# Supported tags and respective `Dockerfile` links

-	[`21.0.1` (*21.0.1/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/keycloak/21.0.1/Dockerfile)
-	[`latest` (*latest/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/keycloak/latest/alpine/Dockerfile)

# Quick reference

-	**Where to get help**:
	[the Riptide Docker Images Github Repository](https://github.com/theCapypara/riptide-docker-images)

-	**Where to file issues**:
	[https://github.com/theCapypara/riptide-docker-images/issues](https://github.com/theCapypara/riptide-docker-images/issues)

-	**Maintained by**:
	[the Riptide Community](https://github.com/theCapypara/riptide-docker-images)

-	**Source of this description**:
	[README in riptide-docker-images repo](https://github.com/theCapypara/riptide-docker-images/tree/master/keycloak) ([history](https://github.com/theCapypara/riptide-docker-images/tree/master/keycloak))

# What is Keycloak?

[Keycloak](https://keycloak.org) is an open source Identity and Access Management solution for modern applications and services.
This image is modified from the [stock Keycloak image](https://quay.io/repository/keycloak/keycloak) to include a few required RPM packages for [Riptide](https://github.com/theCapypara/riptide-cli).

# How to use this image.

Refer to the [Keycloak documentation](https://www.keycloak.org/server/containers).

This image is meant to be used with [Riptide](https://github.com/theCapypara/riptide-cli). 
If you want to use it without Riptide you should consider using the official [Keycloak image](https://quay.io/repository/keycloak/keycloak) instead.
Using this image without Riptide is probably possible, but not supported.

## Basic Usage with Riptide

For a service using this image, see: [Keycloak Riptide Service](https://github.com/theCapypara/riptide-repo/tree/master/service/keycloak)
      
The image is meant to be used only for services.

This image supports ``run_as_current_user: true`` for services (this is the default).

## Basic Usage with Docker Run

Refer to the official documentation: [Running Keycloak in a container](https://www.keycloak.org/server/containers#_trying_keycloak_in_development_mode)

# Environment Variables

Keycloak can be configured using environment variables.
For a complete list of configuration options, see: [Keycloak build options and configuration](https://www.keycloak.org/server/all-config)

# Volumes

These aren't required, but allow you to have a persist database and make further modifications.
 
- **/opt/keycloak/conf**: Keycloak configuration files
- **/opt/keycloak/data**: Database and cache related files
- **/opt/keycloak/providers**: Additional dependencies for providers
- **/opt/keycloak/themes**: Directory for custom themes
