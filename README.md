# ![Riptide](https://riptide-docs.readthedocs.io/en/latest/_images/logo.png)

[<img src="https://readthedocs.org/projects/riptide-docs/badge/?version=latest" alt="Documentation Status">](https://riptide-docs.readthedocs.io/en/latest/)

Riptide is a set of tools to manage development environments for web applications.
It's using container virtualization tools, such as [Docker](https://www.docker.com/)
to run all services needed for a project.

Its goal is to be easy to use by developers.
Riptide abstracts the virtualization in such a way that the environment behaves exactly
as if you were running it natively, without the need to install any other requirements
the project may have.

Riptide consists of a few repositories, find the
entire [overview](https://riptide-docs.readthedocs.io/en/latest/development.html) in the documentation.

## Docker Images

This repository contains Docker Images for use with Riptide. They are published
with the "[riptidepy](https://hub.docker.com/u/riptidepy)" user in Docker Hub.

Documentation for individual images can be found in the directories of these images.

## Contributing

If you want to submit your own Dockerfiles open a pull request. A group of images
is stored in a directory in this repository (eg. "php"). This directory contains a README.md
and a sub-directory of each tag of the image. The sub-directories must be named
after the tags used for buildings. They can also contain sub-directories.
Those and additional tags and aliases (such as latest) must be specified in the README.md

You need to provide an up-to-date documentation for your image, in form of a README.md. If you have
sub-directories with different Dockerfiles, an up-to-date copy of the README.md must be present here.

Templates can be found in the \_contrib-templates directory (based on the official image docs).

All images must be based on official images or other Riptide images.

Riptide Docker images should not create or modify any users. The Riptide container
backend creates users and groups on startup.

Your image command must either

1. be runnable by the user that the entrypoint script creates (user/group ids and
   names are unknown).
2. or your command must be runnable by the user specified in the image but
   respect USER and GROUP environment variables (may be called differently) that contain user and group ids.
3. or your command must only be runnable by the user specified in the image.

1\. and 2. are the default case, please indicate in your README.md, that the image
is "[run_as_current_user]" compatible. Your image MUST comply to 1. or 2. if it is meant
to be used with access to the source code (role [src]).

If your image is using case 2., please add a documentation for USER and GROUP, to let
the users of your image know that services or commands need to have these set to `os_user()`
and `os_group()` respectively (see README.md template):

If your image falls under case 3., add to your README.md, that the image
can only be used with "[run_as_current_user]": false.

% todo: link to final manual pages.

## Documentation

Documentation for apps, services and commands can be found inside the directories
of this repository.

The complete documentation for Riptide can be found at [Read the Docs](https://riptide-docs.readthedocs.io/en/latest/).
