#!/bin/sh
if [ ! -z "$REQUIREMENTS_FILE" ]; then
    pip install --user -r"$REQUIREMENTS_FILE"
fi
sphinx-autobuild  --ignore "_riptide/*" --host 0.0.0.0 --port 8000 "$SPHINX_SOURCE" "$SPHINX_BUILD"/html