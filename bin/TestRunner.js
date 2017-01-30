import exec from 'sync-exec';
import { each } from 'lodash';

export default class TestRunner {
  constructor(status, screen) {
    this.status = status;
    this.screen = screen;
  }

  run(image, flatScript, test) {
    this.status.next();
    this.screen.info(`[${this.status.crtTest}/${this.status.totalTests}] ${test.name} - ${image}`);

    const containerId = this.createContainer(image);

    this.runScripts(containerId, flatScript);
    this.runTest(containerId, test);

    this.cleanUp(containerId);
  }

  createContainer(image) {
    const cmd = `docker run -it -d ${image} /bin/bash`;
    const errorType = 'Container create error';

    return this.exec(cmd, errorType)
  }

  runScripts(containerId, flatScript) {
    each(flatScript, script => this.runScript(containerId, script));
  }

  runScript(containerId, script) {
    const cmd = `docker exec -i ${containerId} bash -c '${script.content}'`;
    const errorType = 'Script execution error';

    return this.exec(cmd, errorType)
  }

  runTest(containerId, test) {
    const cmd = `docker exec -i ${containerId} bash -c '${test.test}'`;
    const errorType = 'Test execution error';

    try {
      this.exec(cmd, errorType);
      this.status.pass();
      this.screen.success(' passed', false);
    } catch (error) {
      this.status.fail(test.name);
      this.screen.error(' failed', false);
    }

    this.screen.write();
  }

  cleanUp(containerId) {
    this.exec(`docker stop ${containerId}`, null, '');
    this.exec(`docker rm ${containerId}`, null, '');
  }

  exec(cmd, errorType = 'Exec error', progressChar = '.') {
    this.screen.write(progressChar, false);

    const result = exec(cmd);

    if (result.status !== 0) {
      throw new Error(`{info: ${errorType}, stderr: ${result.stderr || null}}`);
    }

    this.screen.write(progressChar, false);

    return result.stdout.trim();
  }
}
