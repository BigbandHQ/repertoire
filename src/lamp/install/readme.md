# lamp/install

----

## Params

|  name  | default value  |  description  |
|  ----- | -------------  |  -----------  |
| MySQL Password | 123secret |  |
| Install libapache2_mod_php5 | 0 | 0 = don&#39;t install, 1 = install |
| Install php5_mcrypt | 0 | 0 = don&#39;t install, 1 = install |

----

## Before Scripts

The following scripts will be executed **before** running *lamp/install*.

- [apache/install](http://github.com/bigband-repertoire/apache/install)
- [mysql/install](http://github.com/bigband-repertoire/mysql/install)
- [php/install](http://github.com/bigband-repertoire/php/install)

----

## Contributing

If you want to contribute to this script, please open an issue or a pull request.
