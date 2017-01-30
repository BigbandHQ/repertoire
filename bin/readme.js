import ejs from 'ejs';
import { each, omitBy, isNil } from 'lodash';
import Storage from './Storage';
import Screen from './Screen';

const screen = new Screen();
const scriptStorage = new Storage('src');
const repository = 'http://github.com/bigband-repertoire';

function generate() {
  scriptStorage.parseYaml('/map.yaml').then(scripts => {
    each(omitBy(scripts, isNil), path => {
      screen.info(`Started generating readme for ${path}...`);
      scriptStorage.parseYaml(path + '/script.yaml')
        .then(script => buildContent(path, script))
        .catch(error => {
          if (error.code === 'ENOENT') {
            buildContent(path, {});
          } else {
            screen.error(error);
          }
        });
    });
  }).catch(error => screen.write(error));
}

function buildContent(path, script) {
  ejs.renderFile('templates/readme.ejs', { path, script, repository }, (error, content) => {
    if (error) {
      screen.error(error);
    } else {
      scriptStorage.writeFile(path + '/readme.md', content).then(() =>
        screen.success(`Finished generating readme for ${path}.`)
      );
    }
  });
}

generate();
