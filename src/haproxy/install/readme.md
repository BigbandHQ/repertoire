# haproxy/install

----

## Params

|  name  | default value  |  description  |
|  ----- | -------------  |  -----------  |
| User | haproxy | Haproxy user name |
| Group | haproxy | Haproxy group name |
| Connection timeout | 5000 |  |
| Client timeout | 50000 |  |
| Server timeout | 50000 |  |

----

## Files

|  name  | default value  |  description  |
|  ----- | -------------  |  -----------  |
| Haproxy config | /haproxy.cfg [view content](http://github.com/bigband-repertoire/haproxy.cfg) |  |

----

## After Scripts

The following scripts will be executed **after** running *haproxy/install*.

- [haproxy/restart](http://github.com/bigband-repertoire/haproxy/restart)

----

## Contributing

If you want to contribute to this script, please open an issue or a pull request.
