import yaml from 'js-yaml';
import fs from 'fs-promise';

export default class Storage {
  constructor(base) {
    this.base = base;
  }

  readFile(path) {
    return fs.readFile(`${this.base}/${path}`);
  }

  readFileSync(path) {
    return fs.readFileSync(`${this.base}/${path}`).toString();
  }

  writeFile(path, content) {
    return fs.writeFile(`${this.base}/${path}`, content);
  }

  parseYaml(path) {
    return this.readFile(path).then(content => yaml.load(content));
  }
}
