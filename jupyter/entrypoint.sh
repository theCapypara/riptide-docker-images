#!/bin/bash

set -x

NEW_VENV=false
cp /assets/JUPYTER.md /src

# create new venv if not existing
if [ ! -d .venv ]; then
  python -m venv .venv
  .venv/bin/pip install --upgrade pip
  .venv/bin/pip install poetry
  NEW_VENV=true
fi

# activate the virtual env
source .venv/bin/activate

# add activation script to .bashrc, so we are using the venv, if we are in a bash shell
echo "if [ -f .venv/bin/activate ]; then source .venv/bin/activate; fi" >> ~/.bashrc

# init poetry project
if [ ! -f pyproject.toml ]; then
  PLACEHOLDER_NAME="Your Project"
  poetry new "$PLACEHOLDER_NAME"
  cp "$PLACEHOLDER_NAME/pyproject.toml" .
  rm -r "$PLACEHOLDER_NAME"
fi

# install dependencies if the venv was newly created
if [ "$NEW_VENV" = true ]; then
  poetry install --no-root
fi

# ensure jupyter is installed
if ! jupyter-notebook --version; then
  poetry add jupyter
fi

exec "$@"
