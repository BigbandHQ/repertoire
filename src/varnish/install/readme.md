# varnish/install

----

## Params

|  name  | default value  |  description  |
|  ----- | -------------  |  -----------  |
| Host | 127.0.0.1 |  |
| Port | 80 |  |
| TTL | 10s |  |
| Grace | 1h |  |

----

## Before Scripts

The following scripts will be executed **before** running *varnish/install*.

- [misc/check-dependency](http://github.com/bigband-repertoire/misc/check-dependency)
- [misc/check-dependency](http://github.com/bigband-repertoire/misc/check-dependency)

----

## After Scripts

The following scripts will be executed **after** running *varnish/install*.

- [apache/restart](http://github.com/bigband-repertoire/apache/restart)
- [varnish/restart](http://github.com/bigband-repertoire/varnish/restart)

----

## Contributing

If you want to contribute to this script, please open an issue or a pull request.
