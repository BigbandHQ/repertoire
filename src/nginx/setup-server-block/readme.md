# nginx/setup-server-block

----

## Params

|  name  | default value  |  description  |
|  ----- | -------------  |  -----------  |
| Server name | example.io |  |
| Root | /var/www/example.io/html |  |

----

## Files

|  name  | default value  |  description  |
|  ----- | -------------  |  -----------  |
| Index page | /index.html [view content](http://github.com/bigband-repertoire/index.html) |  |
| Config | /example.conf [view content](http://github.com/bigband-repertoire/example.conf) |  |

----

## Before Scripts

The following scripts will be executed **before** running *nginx/setup-server-block*.

- [misc/check-dependency](http://github.com/bigband-repertoire/misc/check-dependency)

----

## After Scripts

The following scripts will be executed **after** running *nginx/setup-server-block*.

- [nginx/restart](http://github.com/bigband-repertoire/nginx/restart)

----

## Contributing

If you want to contribute to this script, please open an issue or a pull request.
