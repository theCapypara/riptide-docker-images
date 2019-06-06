# Supported tags and respective `Dockerfile` links

-	[`7.3-cli`, `7-cli`, `cli`, `7.3`, `7`, `latest` (*7.3/stretch/cli/Dockerfile*)](https://github.com/Parakoopa/riptide-docker-images/php/7.3/stretch/cli/Dockerfile)
-	[`7.3-apache`, `7-apache`, `apache` (*7.3/stretch/apache/Dockerfile*)](https://github.com/Parakoopa/riptide-docker-images/php/7.3/stretch/apache/Dockerfile)
-	[`7.3-fpm`, `7-fpm`, `fpm` (*7.3/stretch/fpm/Dockerfile*)](https://github.com/Parakoopa/riptide-docker-images/php/7.3/stretch/fpm/Dockerfile)
-	[`7.2-cli`, `7.2` (*7.2/stretch/cli/Dockerfile*)](https://github.com/Parakoopa/riptide-docker-images/php/7.2/stretch/cli/Dockerfile)
-	[`7.2-apache` (*7.2/stretch/apache/Dockerfile*)](https://github.com/Parakoopa/riptide-docker-images/php/7.2/stretch/apache/Dockerfile)
-	[`7.2-fpm` (*7.2/stretch/fpm/Dockerfile*)](https://github.com/Parakoopa/riptide-docker-images/php/7.2/stretch/fpm/Dockerfile)
-	[`7.1-cli`, `7.1` (*7.1/stretch/cli/Dockerfile*)](https://github.com/Parakoopa/riptide-docker-images/php/7.1/stretch/cli/Dockerfile)
-	[`7.1-apache` (*7.1/stretch/apache/Dockerfile*)](https://github.com/Parakoopa/riptide-docker-images/php/7.1/stretch/apache/Dockerfile)
-	[`7.1-fpm` (*7.1/stretch/fpm/Dockerfile*)](https://github.com/Parakoopa/riptide-docker-images/php/7.1/stretch/fpm/Dockerfile)

# Quick reference

-	**Where to get help**:
	[the Riptide Docker Images Github Repository](https://github.com/Parakoopa/riptide-docker-images)

-	**Where to file issues**:
	[https://github.com/Parakoopa/riptide-docker-images/issues](https://github.com/Parakoopa/riptide-docker-images/issues)

-	**Maintained by**:
	[the Riptide Community](https://github.com/Parakoopa/riptide-docker-images)

-	**Source of this description**:
	[README in riptide-docker-images repo](https://github.com/Parakoopa/riptide-docker-images/tree/master/php) ([history](https://github.com/Parakoopa/riptide-docker-images/tree/master/php))

# What is php?

php images based on the [official PHP images](https://hub.docker.com/_/php).

These images work like their official counterpart, but:

- They include the following PHP extensions (additional may be installed by default, depending on PHP version):
  - xdebug (enabled via XDEBUG_CONFIG, see below)
  - pdo_mysql
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
- They include the following tools for developing with common PHP applications and Frameworks
  - [Composer](https://getcomposer.org/)
  - [wp-cli](https://wp-cli.org/)
  - [n98-magerun](https://github.com/netz98/n98-magerun)
  - [n98-magerun2](https://github.com/netz98/n98-magerun2)
- msmtp is installed by default to be used with a mailcatcher. It is configured in the php.ini but no msmtprc
  file is present. If you want to use msmtp, create an "/etc/msmtprc".
- Includes an SSH client

This image is meant for developers using PHP. If you are missing any extensions
or tools, be sure to open a [pull request](https://github.com/Parakoopa/riptide-docker-images/pulls).

# How to use this image.

See the description of the [official PHP images](https://hub.docker.com/_/php). 
The directory used for app sources is `/src`, not `/usr/src`!

This image is meant to be used with [Riptide](https://github.com/Parakoopa/riptide-cli). 
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
| XDEBUG_CONFIG   | no       | remote_host={{ host_address() }}    | [Xdebug configuration](https://xdebug.org/docs/remote)              |
| XDEBUG_CONFIG   | no       | serverName=riptide-{{ name }}'      | [PhpStorm path mapping key](https://blog.jetbrains.com/phpstorm/2012/03/new-in-4-0-easier-debugging-of-remote-php-command-line-scripts/)|

More environment variables may be provided by PHP, PHP-FPM, Apache or the PHP extensions.

# Volumes
 
- **/src**: Source code

# Image Variants

See the description of the [official PHP images](https://hub.docker.com/_/php). Only
variants for FPM, CLI and Apache are provided. Only variants based on Debian stretch are provided.
