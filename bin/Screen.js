import colors from 'colors';

export default class Screen {
  write(message, line = true, color = 'white', background = 'bgBlack') {
    let text = message;
    if (line) text += '\n';
    process.stdout.write(colors[color][background](text));
  }

  success(message, line = true) {
    this.write(message, line, 'green');
  }

  error(message, line = true) {
    this.write(message, line, 'red');
  }

  info(message, line = true) {
    this.write(message, line, 'magenta');
  }

  title(message, line = true) {
    this.write(message, line, 'blue');
  }

  successHighlighted(message) {
    this.write(message, false, 'white', 'bgGreen');
    this.write();
  }

  errorHighlighted(message) {
    this.write(message, false, 'white', 'bgRed');
    this.write();
  }
}