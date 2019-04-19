<!--

********************************************************************************

README template for images, based on the official Docker Image docs.
Pay close attention to links and references with §§YOUR_IMAGE_NAME§§.

********************************************************************************

-->

# Supported tags and respective `Dockerfile` links

<!--- Examples (and required formatting): --->

-	[`2.4.39`, `2.4`, `2`, `latest` (*2.4/Dockerfile*)](https://github.com/Parakoopa/riptide-docker-images/§§YOUR_IMAGE_NAME§§/2.4/Dockerfile)
-	[`2.4.39-alpine`, `2.4-alpine`, `2-alpine`, `alpine` (*2.4/alpine/Dockerfile*)](https://github.com/Parakoopa/riptide-docker-images/§§YOUR_IMAGE_NAME§§/2.4/alpine/Dockerfile)

# Quick reference

-	**Where to get help**:
	[the Riptide Docker Images Github Repository](https://github.com/Parakoopa/riptide-docker-images)

-	**Where to file issues**:
	[https://github.com/Parakoopa/riptide-docker-images/issues](https://github.com/Parakoopa/riptide-docker-images/issues)

-	**Maintained by**:
	[the Riptide Community](https://github.com/Parakoopa/riptide-docker-images)

-	**Source of this description**:
	[README in riptide-docker-images repo](https://github.com/Parakoopa/riptide-docker-images/tree/master/§§YOUR_IMAGE_NAME§§) ([history](https://github.com/Parakoopa/riptide-docker-images/tree/master/§§YOUR_IMAGE_NAME§§))

# What is §§YOUR_IMAGE_NAME§§?

<!-- Description of your image here -->

# How to use this image.

<!-- General usage notes. After this, keep the following text: -->

This image is meant to be used with [Riptide](https://github.com/Parakoopa/riptide-cli). 
Using it without Riptide is probably possible, but not supported.

## Basic Usage with Riptide

<!--- Example of running this image with Riptide (eg. an example Service) 
      and a short explanation --->
      
<!--- If the image is meant to be used only for services OR commands, state this here --->

<!--- Depending on the three cases in the README.rst under Contributing, 
      provide one of the following texts: --->
  
<!--- CASE 1: Runnable via entrypoint user/group --->
This image supports ``run_as_current_user: true`` for services (this is the default).

<!--- CASE 2: Runnable via USER and GROUP env variables --->
This image only supports ``run_as_current_user: false`` for services.
To run the image with the user controlling riptide, instead of the image user, provide the USER and GROUP environment variables,
as shown in the example above.
<!--- In this case your example must be a service and contain:
    environment:
        USER: '{{ os_user() }}'
        GROUP: '{{ os_group() }}'
--->

<!--- CASE 3: Only runnable as user defined in Dockerfile (or root): --->
This image only supports ``run_as_current_user: false`` for services.

## Basic Usage with Docker Run

<!--- Example of running this image with plain docker run 
      and a short explanation --->

# Environment Variables

<!-- Below are examples. USER and GROUP can be kept as is for CASE 2
     Images -->
 
| Name      | Required | Example Value(s)                    | Description                                                         |
|-----------|----------|-------------------------------------|---------------------------------------------------------------------|
| USER      | yes      | 1000 / {{ os_user() }} (Riptide)    | ID of the user that the main command should switch to               |   
| GROUP     | yes      | 1000 / {{ os_group() }} (Riptide)   | ID of the group that the main command should switch to              |

<!--- If you don't need it, remove this section. --->

# Volumes

<!-- Below are examples -->
 
- **/var/run/docker.sock**: Docker Host socket

<!--- If you don't need it, remove this section. --->


# Additional notes

<!--- Additional notes or comments. You can also use your own headings for those.
      If you don't need it, remove this section. --->

# Image Variants

<!--- A text describing variants of your images. If you have non, remove this. --->