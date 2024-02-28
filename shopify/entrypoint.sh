#!/bin/bash

if [ "${XDEBUG#-off}" = "on" ]; then
  echo "Setting xdebug.mode 'debug'..."
  sed -i 's/xdebug.mode=.*/xdebug.mode=debug/' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
fi

if [ "${XDEBUG_CLIENT_HOST#-host.docker.internal}" != "host.docker.internal" ]; then
  echo "Setting xdebug client host '${XDEBUG_CLIENT_HOST}'..."
  sed -i "s/xdebug.client_host=.*/xdebug.client_host=${XDEBUG_CLIENT_HOST}/" /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
fi

set -e

# Run command with node if the first argument contains a "-" or is not a system command. The last
# part inside the "{}" is a workaround for the following bug in ash/dash:
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=874264
if [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ] || { [ -f "${1}" ] && ! [ -x "${1}" ]; }; then
  echo Prefix with node...
  set -- node "$@"
fi

RIPTIDE_SRC="/src/"
if [ -d "$RIPTIDE_SRC" ]; then
  # Keep Makefile and documentation up to date
  cp /assets/base.makefile "$RIPTIDE_SRC"
  if [ ! -f "$RIPTIDE_SRC""Makefile" ]; then
    cp /assets/Makefile "$RIPTIDE_SRC"
  fi
  if [ ! -f "$RIPTIDE_SRC"".env" ]; then
    touch "$RIPTIDE_SRC"".env"
  fi
  cp /assets/shopify-app.md "$RIPTIDE_SRC"

  # Create app configuration if missing
  if [ ! -f "$RIPTIDE_SRC""shopify.app.toml" ] && [ -f "$RIPTIDE_SRC""template.shopify.app.toml" ]; then
    cp "$RIPTIDE_SRC""template.shopify.app.toml" "$RIPTIDE_SRC""shopify.app.toml"
  fi
fi

exec "$@"
