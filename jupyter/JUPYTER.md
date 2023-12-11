# Jupyter Notebook

## Setup

### Setup Riptide project

```shell
riptide setup
```

### Update images

```shell
riptide update
```

Note: Make sure riptide is in your PATH (not just an alias to your bin), so it could be found with `which`.


## Start

To start your notebook server run:

```shell
riptide start
```

This will
- create a new python virtual environment at `.venv` (if not existing)
- create a `pyproject.toml` containing the project dependencies (if not existing)
- install the project dependencies from the `pyproject.toml` (if the venv was not existing before)
- ensures that jupyter notebook is installed (adds it as dependency if missing)
- starts the jupyter notebook server

You manually need to adjust the `pyproject.toml` to your needs.

When the start command is finished, it will give you the link to your notebook server.

If no virtual environment exists, the start command can take a little longer.
It will wait until the server is up and running, so that you know, when you can start accessing it.

## Install dependencies

After `pyproject.toml` was externally changed (e.g. by `git pull`), you need to run following command,
to install the up-to-date dependencies.

```shell
poetry install
```

### Add new dependencies

To install a new dependency (like in this example `pandas`), run the following:

```shell
poetry add pandas
```

## Troubleshooting

If something is not working as expected, you can attach to the logs:

```shell
tail -f _riptide/logs/jupyter/stderr.log
```

At any time you can remove the `.venv` directory in you project and restart
Riptide (`riptide restart`) to recreate it. This could solve most of the issues.
