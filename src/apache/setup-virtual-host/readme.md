# apache/setup-virtual-host

----

## Params

|  name  | default value  |  description  |
|  ----- | -------------  |  -----------  |
| Host | * |  |
| Port number | 80 |  |
| Server name | example.io |  |
| Server alias | www.example.io |  |
| Server admin | admin@example.io |  |
| Error log file | ${APACHE_LOG_DIR}/error.log |  |
| Custom log file | ${APACHE_LOG_DIR}/access.log combined |  |
| Document root | /var/www/example.io/public_html |  |

----

## Files

|  name  | default value  |  description  |
|  ----- | -------------  |  -----------  |
| Index page | /index.html [view content](http://github.com/bigband-repertoire/index.html) |  |
| Config | /example.conf [view content](http://github.com/bigband-repertoire/example.conf) |  |

----

## Before Scripts

The following scripts will be executed **before** running *apache/setup-virtual-host*.

- [misc/check-dependency](http://github.com/bigband-repertoire/misc/check-dependency)

----

## After Scripts

The following scripts will be executed **after** running *apache/setup-virtual-host*.

- [apache/restart](http://github.com/bigband-repertoire/apache/restart)

----

## Contributing

If you want to contribute to this script, please open an issue or a pull request.
