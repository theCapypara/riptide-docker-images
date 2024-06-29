#!/bin/sh
set -e
python3 -m venv --system-site-packages /tmp/riptide-venv
. /tmp/riptide-venv/bin/activate
if [ ! -z "$REQUIREMENTS_FILE" ]; then
    pip install -I -r"$REQUIREMENTS_FILE"
fi
sphinx-autobuild  --ignore "_riptide/*" --host 0.0.0.0 --port 8000 "$SPHINX_SOURCE" "$SPHINX_BUILD"/html