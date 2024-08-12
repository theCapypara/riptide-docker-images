# Supported tags and respective `Dockerfile` links

-	[`latest` (*Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/streamlit/Dockerfile)

# Quick reference

-	**Where to get help**:
	[the Riptide Docker Images Github Repository](https://github.com/theCapypara/riptide-docker-images)

-	**Where to file issues**:
	[https://github.com/theCapypara/riptide-docker-images/issues](https://github.com/theCapypara/riptide-docker-images/issues)

-	**Maintained by**:
	[the Riptide Community](https://github.com/theCapypara/riptide-docker-images)

-	**Source of this description**:
	[README in riptide-docker-images repo](https://github.com/theCapypara/riptide-docker-images/tree/master/streamlit) ([history](https://github.com/theCapypara/riptide-docker-images/tree/master/streamlit))

# What is Streamlit?

[Streamlit](https://streamlit.io) is an open-source Python framework for data scientists and AI/ML engineers to deliver interactive data apps. This image contains all tools needed to run a Streamlit server.

# How to use this image.

This image is meant to be used with [Riptide](https://github.com/theCapypara/riptide-cli). 
Using it without Riptide is probably possible, but not supported.

## Basic Usage with Riptide

For a service using this image, see: [Streamlit Riptide Service](https://github.com/theCapypara/riptide-repo/tree/master/service/streamlit)

This image supports ``run_as_current_user: true`` for services.

## Basic Usage with Docker Run

```
docker run \
	-v .:/src \
	riptidepy/streamlit
```

# Volumes

Have a look here for the volumes used by this image: [Streamlit Riptide Service](https://github.com/theCapypara/riptide-repo/tree/master/service/streamlit)
