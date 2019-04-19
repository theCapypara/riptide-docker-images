php builder
===========

Build script to update the indivdual images.

Creates the Dockerfile's in the other directories based on their name. All steps
in this directories Dockerfile will be added to those Dockerfiles, only
the FROM part is modified. 