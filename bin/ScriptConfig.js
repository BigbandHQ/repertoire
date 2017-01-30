import { each, flatMap, map, concat } from 'lodash';

export default class ScriptConfig {
  constructor(path, storage, screen, config = {}) {
    this.path = path;
    this.storage = storage;
    this.screen = screen;

    this.params = config.params;
    this.files = config.files;
    this.script = {};
  }

  loadScript() {
    return this.storage.parseYaml(this.path + '/script.yaml').then(script => {
      this.script = script || {};
      return this.setDependencies();
    }).catch(error => {
      if (error.code === 'ENOENT') {
        return this.setDependencies();
      }
    });
  }

  setDependencies() {
    return Promise.all([
      this.flattenDependencies(this.script.before),
      this.flattenDependencies(this.script.after)
    ]).then(promises =>
      Promise.all([promises[0], promises[1]]).then(dependencies => {
        this.before = flatMap(dependencies[0]) || [];
        this.after = flatMap(dependencies[1]) || [];

        return this;
      })
    );
  }

  flatten(parent = null) {
    this.compileParams(parent);

    return this.compileFiles(parent).then(() =>
      this.compileContent().then(content =>
        concat(this.before, [{ name: this.path, content }], this.after)
      )
    );
  }

  flattenDependencies(dependencies = []) {
    return Promise.all(flatMap(dependencies, config => {
      const scriptConfig = new ScriptConfig(config.name, this.storage, this.screen, config);
      return scriptConfig.loadScript().then(() => scriptConfig.flatten(this));
    }));
  }

  compileParams(parent = null) {
    this.params = this.compileVars(this.script.params, this.params);

    if (parent) {
      each(this.params, (param, name) => {
        this.params[name] = this.replaceVars(this.params[name], parent.params, 'parent.params');
      });
    }
  }

  compileFiles(parent = null) {
    let files = this.compileVars(this.script.files, this.files);
    let promises = [];

    each(files, (file, name) => {
      if (file.charAt(0) === '/') {
        promises.push(this.storage.readFile(this.path + file).then(content => {
          files[name] = content;
          this.replaceVarsInFile(files, name, parent);
        }));
      } else {
        this.replaceVarsInFile(files, name, parent);
      }
    });

    return new Promise((resolve, reject) => Promise.all(promises).then(() => {
      this.files = files;
      resolve(this.files);
    }).catch(error => reject(error)));
  }

  replaceVarsInFile(files, name, parent = null) {
    if (parent) {
      files[name] = this.replaceVars(files[name], parent.params, 'parent.params');
      files[name] = this.replaceVars(files[name], parent.files, 'parent.files');
    }

    files[name] = this.replaceVars(files[name], this.params, 'params');
  }

  compileVars(defaultVars = [], configVars = {}) {
    let result = {};

    each(defaultVars, item => {
      result[item.name] = configVars[item.name] || item.default;
    });

    return result;
  }

  compileContent() {
    return this.storage.readFile(this.path + '/script.sh').then(content => {
      let parsedContent = content;

      parsedContent = this.replaceVars(parsedContent, this.params, 'params');
      parsedContent = this.replaceVars(parsedContent, this.files, 'files');

      return parsedContent;
    }).catch(err => {
      this.screen.error(err.message);
      return null;
    });
  }

  replaceVars(subject, vars, prefix) {
    let patterns = map(vars, (value, key) => `{{\\s*${prefix}\.${key}\\s*}}`);

    if (patterns.length > 0) {
      let startIndex = 0;
      const segments = prefix.split('.').length;

      patterns = new RegExp(patterns.join('|'), 'gi');

      return subject.replace(patterns, matched => {
        if (segments === 2) {
          startIndex = matched.indexOf('.') + 1;
        }

        const name = matched.slice(matched.indexOf('.', startIndex) + 1, -2).trim();
        return vars[name];
      });
    }

    return subject;
  }
}
