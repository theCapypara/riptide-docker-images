# Supported tags and respective `Dockerfile` links
-	[`latest`, (*latest/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/opensearch/latest/Dockerfile)
-	[`2`,  (*2/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/opensearch/2/Dockerfile)
-	[`1` (*1/Dockerfile*)](https://github.com/theCapypara/riptide-docker-images/tree/master/opensearch/1/Dockerfile)

# Quick reference

-	**Where to get help**:
	[the Riptide Docker Images Github Repository](https://github.com/theCapypara/riptide-docker-images)

-	**Where to file issues**:
	[https://github.com/theCapypara/riptide-docker-images/issues](https://github.com/theCapypara/riptide-docker-images/issues)

-	**Maintained by**:
	[the Riptide Community](https://github.com/theCapypara/riptide-docker-images)

-	**Source of this description**:
	[README in riptide-docker-images repo](https://github.com/theCapypara/riptide-docker-images/tree/master/opensearch) ([history](https://github.com/theCapypara/riptide-docker-images/tree/master/opensearch))

# What is OpenSearch?

OpenSearch images based on the [official OpenSearch images](https://hub.docker.com/r/opensearchproject/opensearch).

These images work like their official counterpart, but:

- They include `util-linux`, which allows Riptide to utilize the current user instead of the predefined `opensearch` user

# How to use this image.

See the description of the [official OpenSearch images](https://hub.docker.com/r/opensearchproject/opensearch).
The directory used for app data is `/usr/share/opensearch/data`!
The configuration file used for this app is `/usr/share/opensearch/config/opensearch.yml`!

This image is meant to be used with [Riptide](https://github.com/theCapypara/riptide-cli). 
Using it without Riptide is probably possible, but not supported.

## Basic Usage with Riptide

For a service using this image, see: [OpenSearch Riptide Service](https://github.com/theCapypara/riptide-repo/tree/master/service/opensearch)

The image is meant to be used only for services.

This image supports ``run_as_current_user: true`` for services (this is the default).

## Basic Usage with Docker Run

```
docker run \
      -it \
      -d \
      -p 9200:9200 \
      -p 9600:9600 \
      -e "discovery.type=single-node" \
      -v ./data:/usr/share/opensearch/data \
      riptidepy/opensearch
```
