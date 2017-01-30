# nginx/install

----

## Params

|  name  | default value  |  description  |
|  ----- | -------------  |  -----------  |
| User | www-data |  |
| Server names hash bucket size | 64 | Numeric value (32, 64, ...) |
| Worker processes | 1 | Defines the number of worker processes. (numeric or auto) |
| Multi accept | off | If multi_accept is disabled, a worker process will accept one new connection at a time. Otherwise, a worker process will accept all new connections at a time. (on or off) |

----

## After Scripts

The following scripts will be executed **after** running *nginx/install*.

- [nginx/restart](http://github.com/bigband-repertoire/nginx/restart)

----

## Contributing

If you want to contribute to this script, please open an issue or a pull request.
