import { each, merge, cloneDeep, omitBy, isNil } from 'lodash';
import ScriptConfig from './ScriptConfig';
import TestRunner from './TestRunner';
import TestsStatus from './TestsStatus';
import Storage from './Storage';
import Screen from './Screen';

const screen = new Screen();
const storage = new Storage('src');
const status = new TestsStatus(screen);
const testRunner = new TestRunner(status, screen);

function main() {
  try {
    const path = process.argv[2];

    if (path) {
      runScript(path);
    } else {
      storage.parseYaml('/map.yaml').then(scripts => {
        let sequence = Promise.resolve();
        each(omitBy(scripts, isNil), path => {
          sequence = sequence.then(() => runScript(path));
        });
      });
    }
  } catch (err) {
    screen.error(`${err.message}`);
    return;
  }
}

function prepareConfig(defaultTestConfig = {}, testConfig = {}) {
  let config = {};

  config.params = merge(defaultTestConfig.params || {}, testConfig.params || {});
  config.files = merge(defaultTestConfig.files || {}, testConfig.files || {});

  return config;
}

function runScript(path) {
  screen.title('Running tests for: ' + path);

  let promises = [];

  return new Promise((resolve, reject) => storage.parseYaml(path + '/tests.yaml').then(tests => {
    status.init(tests.tests.length);

    each(tests.tests, test => {
      const image = test.image || tests.image;

      let testConfig = {};
      testConfig.params = test.params;
      testConfig.files = test.files;

      const config = prepareConfig(cloneDeep(tests.defaults), testConfig);
      const scriptConfig = new ScriptConfig(path, storage, screen, config);

      promises.push(scriptConfig.loadScript().then(() =>
        scriptConfig.flatten().then(flatScript => testRunner.run(image, flatScript, test))
      ));
    });

    Promise.all(promises).then(() => {
      status.print();
      resolve(tests);
    });
  }).catch(error => {
    if (error.code === 'ENOENT') {
      const errorMessage = 'This script has no tests yet.';
      screen.error(errorMessage);
      resolve(errorMessage);
    }

    reject(error);
  }));
}

main();
