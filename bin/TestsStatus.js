import { each } from 'lodash';

export default class TestsStatus {
  constructor(screen) {
    this.screen = screen;
  }

  init(total) {
    this.totalTests = total;
    this.crtTest = 0;
    this.passCount = 0;
    this.failed = [];
  }

  next() {
    this.crtTest++;
  }

  pass() {
    this.passCount++;
  }

  fail(name) {
    this.failed.push(name);
  }

  print() {
    if (this.failed.length === 0) {
      this.screen.successHighlighted('...DONE...');
    } else {
      this.screen.errorHighlighted('...DONE...');
    }

    this.screen.info(`- completed: ${this.crtTest}`);
    this.screen.success(`- successful: ${this.passCount}`);

    if (this.failed.length) {
      this.screen.error(`- failed: ${this.failed.length}`);
      each(this.failed, test => this.screen.error(`    - ${test}`));
    }
  }
}
