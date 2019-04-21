# Supported tags and respective `Dockerfile` links

-	[`latest` (*Dockerfile*)](https://github.com/Parakoopa/riptide-docker-images/sphinx/Dockerfile)

# Quick reference

-	**Where to get help**:
	[the Riptide Docker Images Github Repository](https://github.com/Parakoopa/riptide-docker-images)

-	**Where to file issues**:
	[https://github.com/Parakoopa/riptide-docker-images/issues](https://github.com/Parakoopa/riptide-docker-images/issues)

-	**Maintained by**:
	[the Riptide Community](https://github.com/Parakoopa/riptide-docker-images)

-	**Source of this description**:
	[README in riptide-docker-images repo](https://github.com/Parakoopa/riptide-docker-images/tree/master/sphinx) ([history](https://github.com/Parakoopa/riptide-docker-images/tree/master/sphinx))

# What is sphinx?

Sphinx is a tool for building documentations. More information can be found on the [http://www.sphinx-doc.org/en/master/](Sphinx homepage).

This image includes the latest version of 
- sphinx
- sphinx-autobuild
- sphinx_rtd_theme

# How to use this image.

The default command runs sphinx-autobuild and insalls some requirements
before this.

Default working directory is /src.

This image is meant to be used with [Riptide](https://github.com/Parakoopa/riptide-cli). 
Using it without Riptide is probably possible, but not supported.

## Basic Usage with Riptide

See the community repository entry for [https://github.com/Parakoopa/riptide-repo/tree/master/app/sphinx/latest.yml](``/app/sphinx/latest``).

This image supports ``run_as_current_user: true`` for services (this is the default).

## Basic Usage with Docker Run

```sh
docker run -p 8000:8000 \
       -v "$(pwd):/src" \
       --user "$(id -u)" \
       riptidepy/sphinx
```

This will start sphinx_autobuild and bind it to the local port 8000.


# Environment Variables
 
| Name              | Required | Example Value(s)                    | Description                                                         |
|-------------------|----------|-------------------------------------|---------------------------------------------------------------------|
| SPHINX_CONF_DIR   | yes      | source                              | Path to the source directory                                        |
| SPHINX_BUILD      | yes      | build                               | Path to the build directory                                         |
| REQUIREMENTS_FILE | no       | requirements.txt                    | If set: Read requirements from this file before running sphinx-autobuild|
