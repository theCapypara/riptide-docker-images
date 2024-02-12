# Supported tags and respective `Dockerfile` links

-	[`latest` (*Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/shopify/Dockerfile)

# Quick reference

-	**Where to get help**:
	[the Riptide Docker Images Github Repository](https://github.com/theCapypara/riptide-docker-images)

-	**Where to file issues**:
	[https://github.com/theCapypara/riptide-docker-images/issues](https://github.com/theCapypara/riptide-docker-images/issues)

-	**Maintained by**:
	[the Riptide Community](https://github.com/theCapypara/riptide-docker-images)

-	**Source of this description**:
	[README in riptide-docker-images repo](https://github.com/theCapypara/riptide-docker-images/tree/master/shopify) ([history](https://github.com/theCapypara/riptide-docker-images/tree/master/shopify))

# What is shopify?

[Shopify](https://shopify.com) is a E-commerce software. This image contains all tools needed to develop [Shopify Apps](https://shopify.dev/apps)

# How to use this image.

This image is meant to be used with [Riptide](https://github.com/theCapypara/riptide-cli). 
Using it without Riptide is probably possible, but not supported.

## Basic Usage with Riptide

For a service using this image, see: [Shopify Riptide Service](https://github.com/theCapypara/riptide-repo/tree/master/service/shopify)

The image is meant to be used only for services.
It should not be started. Instead, define commands, running in this service.
Check out this Riptide app, to see how to use it: [Shopify Riptide App](https://github.com/theCapypara/riptide-repo/tree/master/app/shopify)

This image supports ``run_as_current_user: true`` for services.

## Basic Usage with Docker Run

```
docker run \
	--network host \
	-v ~/.config/composer:~/.config/composer \
	-v ~/.cache/composer:~/.cache/composer \
	-v ~/.config/shopify-cli-kit-nodejs:~/.config/shopify-cli-kit-nodejs \
	-v ~/.cache/shopify-cli-nodejs:~/.cache/shopify-cli-nodejs \
	-v ~/.config/ngrok:~/.config/ngrok \
	-v ~/.cache/yarn:~/.cache/yarn \
	-v ~/.npm:~/.npm \
	-v .:/src \
	-w /src \
	riptidepy/shopify \
	yarn shopify
```

# Volumes

Have a look here for the volumes used by this image: [Shopify Riptide Service](https://github.com/theCapypara/riptide-repo/tree/master/service/shopify)

# Versions
atm we cannot use a standard versioning scheme here
since there are too many languages in the container
that may not fit your needs.

`latest` stays as is for now since we cannot change it without probably breaking things.

Please update your projects to use a version following the new scheme:  
{firstLowercaseCharacterOfLanguage[anOptionalSecondCharacter]}{version} divided by underscores e.g.: `n20.11_p8.1`  
Ruby and Rust are skipped for now since we assume that there is no need for containers with specific versions of these languages.

| V           | Node  | PHP | Ruby | Rust |
|-------------|-------|-----|------|------|
| latest      | 18.16 | 8.1 |      |      |
| n20.11_p8.1 | 20.11 | 8.1 | 3.1  | 1.60 |
| n18.19_p8.2 | 18.19 | 8.2 | 3.1  | 1.60 |
