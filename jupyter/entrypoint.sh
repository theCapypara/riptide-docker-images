#!/bin/bash

set -x

NEW_VENV=false
cp /assets/JUPYTER.md /src
cp /assets/code /src

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

# ensure jupyter is installed with required versions
required_packages=(
  "jupyter-core:^5.9.1"
  "jupyter-client:^8.6.3"
  "ipython:^9.6.0"
  "ipykernel:^7.1.0"
  "jupyter-server:^2.17.0"
  "jupyterlab:^4.4.10"
)
installed_packages=$(sed -n '/\[tool.poetry.dependencies\]/,/\[/{/^\[/!p}' pyproject.toml)
for rpkg in "${required_packages[@]}"; do
  pkg_name="${rpkg%%:*}"
  required_version="${rpkg#*:}"
  escaped_version=$(echo "$required_version" | sed -e 's/[\^\.]/\\&/g')

  if echo "$installed_packages" | grep -qE "^\s*${pkg_name}\s*=\s*\"?${escaped_version}"; then
    echo "$pkg_name with version ${required_version} is already in pyproject.toml."
  else
    echo "$pkg_name is missing or has a different version than ${required_version}, it will be added."
    poetry add "${pkg_name}@${required_version}"
  fi
done

exec "$@"
