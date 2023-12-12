# Supported tags and respective `Dockerfile` links

-	[`latest` (*Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/jupyter/Dockerfile)

# Quick reference

-	**Where to get help**:
	[the Riptide Docker Images Github Repository](https://github.com/theCapypara/riptide-docker-images)

-	**Where to file issues**:
	[https://github.com/theCapypara/riptide-docker-images/issues](https://github.com/theCapypara/riptide-docker-images/issues)

-	**Maintained by**:
	[the Riptide Community](https://github.com/theCapypara/riptide-docker-images)

-	**Source of this description**:
	[README in riptide-docker-images repo](https://github.com/theCapypara/riptide-docker-images/tree/master/jupyter) ([history](https://github.com/theCapypara/riptide-docker-images/tree/master/jupyter))

# What is Jupyter?

[Jupyter Notebook](https://jupyter.org) is a web-based interactive computing platform. This image contains all tools needed to run a Jupyter server and work with notebooks.

# How to use this image.

This image is meant to be used with [Riptide](https://github.com/theCapypara/riptide-cli). 
Using it without Riptide is probably possible, but not supported.

## Basic Usage with Riptide

For a service using this image, see: [Jupyter Riptide Service](https://github.com/theCapypara/riptide-repo/tree/master/service/jupyter)

This image supports ``run_as_current_user: true`` for services.

## Basic Usage with Docker Run

```
docker run \
	-v .:/src \
	-v ./notebooks:/notebooks \
	-v ./.jupyter:~/.jupyter \
	riptidepy/jupyter
```

# Volumes

Have a look here for the volumes used by this image: [Jupyter Riptide Service](https://github.com/theCapypara/riptide-repo/tree/master/service/jupyter)
