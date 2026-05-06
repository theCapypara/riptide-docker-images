# Shopify App


## Setup development environment

### Setup Riptide project

```shell
riptide setup
```

### Update images

```shell
riptide update
```

Note: Make sure riptide is in your PATH (not just an alias to your bin), so it could be found with `which`.


## Create new app

You can jump to the next step, if you have existing app code.

### Create new app framework

For Node.js
```shell
make create-nodejs
```

For PHP
```shell
make create-php
```


## Setup existing app

### Install dependencies

For Node.js
```shell
make install-nodejs
```

For PHP
```shell
make install-php
```

### Connect app with Shopify

```shell
make init-app
```

### Connect app extensions with Shopify

```shell
make init-deploy
```


## Run app

If you have not installed the Riptide shell extensions, prepend `riptide cmd`.

```shell
shopify app dev
```

If this quits silently after "Dependencies installed", run `shopify auth logout`, `make init-app` and try again.


## Deploy extensions

If you have not installed the Riptide shell extensions, prepend `riptide cmd`.

```shell
shopify app deploy
```


## Node.js Debugging

To enable debugging add this to the script section in `web/package.json` (replace <port> with your desired port):

```json
"debug": "cross-env NODE_ENV=development nodemon --inspect=127.0.0.1:<port> index.js --ignore ./frontend",
```

Update the `web/shopify.web.toml` to contain this:

```toml
[commands]
dev = "npm run debug"
```

If you now run `shopify app dev` you could connect your debugging client to the specified port.
