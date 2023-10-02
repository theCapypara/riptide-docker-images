# Supported tags and respective `Dockerfile` links

-	[`8.1-cli`, `8-cli`, `cli`, `8.1`, `8`, `latest` (*8.1/buster/cli-composer/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/8.1/buster/cli-composer/Dockerfile)
-	[`8.1-cli-composer2`, `8-cli-composer2`, `cli-composer` (*8.1/buster/cli-composer/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/8.1/buster/cli-composer2/Dockerfile)
-	[`8.1-apache`, `8-apache`, `apache` (*8.1/buster/apache/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/8.1/buster/apache/Dockerfile)
-	[`8.1-fpm`, `8-fpm`, `fpm` (*8.1/buster/fpm/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/8.1/buster/fpm/Dockerfile)
-	[`8.0-cli`, `8.0` (*8.0/buster/cli-composer/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/8.0/buster/cli-composer/Dockerfile)
-	[`8.0-cli-composer2` (*8.0/buster/cli-composer2/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/8.0/buster/cli-composer2/Dockerfile)
-	[`8.0-apache` (*8.0/buster/apache/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/8.0/buster/apache/Dockerfile)
-	[`8.0-fpm` (*8.0/buster/fpm/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/8.0/buster/fpm/Dockerfile)
-	[`7.4-cli`, `7-cli`, `7.4`, `7` (*7.4/buster/cli-composer/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/7.4/buster/cli-composer/Dockerfile)
-	[`7.4-cli-composer2` (*7.4/buster/cli-composer2/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/7.4/buster/cli-composer2/Dockerfile)
-	[`7.4-apache`, `7-apache` (*7.4/buster/apache/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/7.4/buster/apache/Dockerfile)
-	[`7.4-fpm`, `7-fpm` (*7.4/buster/fpm/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/7.4/buster/fpm/Dockerfile)
-	[`7.3-cli`, `7.3`, (*7.3/buster/cli-composer/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/7.3/buster/cli-composer/Dockerfile)
-	[`7.3-cli-composer2` (*7.3/buster/cli-composer2/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/7.3/buster/cli-composer2/Dockerfile)
-	[`7.3-apache`, (*7.3/buster/apache/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/7.3/buster/apache/Dockerfile)
-	[`7.3-fpm`, (*7.3/buster/fpm/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/7.3/buster/fpm/Dockerfile)
-	[`7.2-cli`, `7.2` (*7.2/buster/cli-composer/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/7.2/buster/cli-composer/Dockerfile)
-	[`7.2-cli-composer2` (*7.2/buster/cli-composer2/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/7.2/buster/cli-composer2/Dockerfile)
-	[`7.2-apache` (*7.2/buster/apache/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/7.2/buster/apache/Dockerfile)
-	[`7.2-fpm` (*7.2/buster/fpm/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/php/7.2/buster/fpm/Dockerfile)

# Quick reference

-	**Where to get help**:
	[the Riptide Docker Images Github Repository](https://github.com/theCapypara/riptide-docker-images)

-	**Where to file issues**:
	[https://github.com/theCapypara/riptide-docker-images/issues](https://github.com/theCapypara/riptide-docker-images/issues)

-	**Maintained by**:
	[the Riptide Community](https://github.com/theCapypara/riptide-docker-images)

-	**Source of this description**:
	[README in riptide-docker-images repo](https://github.com/theCapypara/riptide-docker-images/tree/master/php) ([history](https://github.com/theCapypara/riptide-docker-images/tree/master/php))

# What is php?

php images based on the [official PHP images](https://hub.docker.com/_/php).

These images work like their official counterpart, but:

- They include the following PHP extensions (additional may be installed by default, depending on PHP version):
  - xdebug 3 (not loaded by default & and controlled via XDEBUG_CONFIG, see below)
  - pdo_mysql
  - mysqli
  - gd
  - mbstring
  - soap
  - xsl
  - intl
  - ctype
  - iconv
  - json
  - session
  - simplexml
  - tokenizer
  - bcmath
  - bz2
  - sockets
  - yaml
- They include the following tools for developing with common PHP applications and Frameworks
  - [Composer](https://getcomposer.org/)
    - Composer 1 as `composer`
    - Composer 2 as `composer2`
    - NOTE: The `cli-composer2` images instead only contain Composer 2, linked as both `composer` and `composer2`.
  - [wp-cli](https://wp-cli.org/)
  - [n98-magerun](https://github.com/netz98/n98-magerun)
  - [n98-magerun2](https://github.com/netz98/n98-magerun2)
  - [Symfony CLI](https://symfony.com/)
- msmtp is installed by default to be used with a mailcatcher. It is configured in the php.ini but no msmtprc
  file is present. If you want to use msmtp, create an "/etc/msmtprc".
- Includes an SSH client
- Includes Git

Xdebug is not loaded by default for performance reasons. If you want
to enable Xdebug, add the following lines to the file ``/usr/local/etc/php/conf.d/xdebug.ini`` via a new image or mount:
```ini
zend_extension=xdebug.so
xdebug.remote_enable=on
xdebug.remote_autostart=off
```


This image is meant for developers using PHP. If you are missing any extensions
or tools, be sure to open a [pull request](https://github.com/theCapypara/riptide-docker-images/pulls).

# How to use this image.

See the description of the [official PHP images](https://hub.docker.com/_/php). 
The directory used for app sources is `/src`, not `/usr/src`!

This image is meant to be used with [Riptide](https://github.com/theCapypara/riptide-cli). 
Using it without Riptide is probably possible, but not supported.

## Basic Usage with Riptide

A simple PHP app that uses the apache variant to run an Apache web-server: 

```yaml
app:
  name: php-demo
  services:
    php_demo:
      image: riptidepy/php:7.3-apache
      environment:
        APACHE_RUN_USER: '#{{ os_user() }}'
        APACHE_RUN_GROUP: '#{{ os_group() }}'
      port: 80
      run_as_current_user: false
      roles:
        - main
        - src
```

For all image variants, expect for `apache`:

- This image supports ``run_as_current_user: true`` for services (this is the default).

For the `apache` image variant:

- This image only supports ``run_as_current_user: false`` for services.
  To run the image with the user controlling riptide, instead of the image user, provide the APACHE_RUN_USER and APACHE_RUN_GROUP environment variables,
  as shown in the example above.

## Basic Usage with Docker Run

See the description of the [official PHP images](https://hub.docker.com/_/php).

# Environment Variables
 
| Name            | Required | Example Value(s)                    | Description                                                         |
|-----------------|----------|-------------------------------------|---------------------------------------------------------------------|
| APACHE_RUN_USER | see desc.| #1000 / #{{ os_user() }} (Riptide)  | (apache only) ID of the user that Apache should switch to           |   
| APACHE_RUN_GROUP| see desc.| #1000 / #{{ os_group() }} (Riptide) | (apache only) ID of the group that the main command should switch to|
| XDEBUG_CONFIG   | no       | client_host={{ host_address() }}    | [Xdebug configuration](https://xdebug.org/docs/remote)              |
| XDEBUG_CONFIG   | no       | serverName=riptide-{{ name }}'      | [PhpStorm path mapping key](https://blog.jetbrains.com/phpstorm/2012/03/new-in-4-0-easier-debugging-of-remote-php-command-line-scripts/)|

More environment variables may be provided by PHP, PHP-FPM, Apache or the PHP extensions.

# Volumes
 
- **/src**: Source code

# Image Variants

See the description of the [official PHP images](https://hub.docker.com/_/php). Only
variants for FPM, CLI and Apache are provided. Only variants based on Debian buster are provided.
