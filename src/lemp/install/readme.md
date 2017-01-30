# lemp/install

----

## Params

|  name  | default value  |  description  |
|  ----- | -------------  |  -----------  |
| NGINX User | www-data |  |
| NGINX Hash Bucket Size | 64 | Numeric value (32, 64, ...) |
| NGINX Worker Processes | 1 | Defines the number of worker processes. (numeric or auto) |
| NGINX Multi Accept | off | If multi_accept is disabled, a worker process will accept one new connection at a time. Otherwise, a worker process will accept all new connections at a time. (on or off) |
| MySQL Password | 123secret |  |

----

## Before Scripts

The following scripts will be executed **before** running *lemp/install*.

- [nginx/install](http://github.com/bigband-repertoire/nginx/install)
- [mysql/install](http://github.com/bigband-repertoire/mysql/install)
- [php/install](http://github.com/bigband-repertoire/php/install)

----

## Contributing

If you want to contribute to this script, please open an issue or a pull request.
