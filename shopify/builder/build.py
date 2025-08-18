#!/usr/bin/env python
import os.path
import shutil

from jinja2 import Environment, FileSystemLoader

NODE_VERSIONS = {
    # Checksum
    "18.19.0": "10b7b23b6b867a25f060a433b83f5c3ecb3bcf7cdba1c0ce46443065a832fd41",
    "20.11.0": "a8bec39586538896715be7a2ca7ef08727a58ad94d25876c5db11cafacff4c37",
}
PHP_VERSIONS = ["8.1", "8.2", "8.3"]
ALPINE_VERSION = "3.22"  # Rust 1.87
COPY_FILES = [
    "base.makefile",
    "entrypoint.sh",
    "Makefile",
    "shopify-app.md"
]
BASE_DIR = os.path.join(os.path.dirname(__file__), "..")
BUILDER_DIR = os.path.join(BASE_DIR, "builder")

if __name__ == "__main__":
    env = Environment(
        loader=FileSystemLoader(os.path.join(BUILDER_DIR, "jinja_tpl")),
    )
    template = env.get_template("Dockerfile.jinja2")

    for node_version, node_checksum in NODE_VERSIONS.items():
        for php_version in PHP_VERSIONS:
            outdir = os.path.join(BASE_DIR, f"n{node_version}", f"p{php_version}")
            shutil.rmtree(outdir, ignore_errors=True)
            os.makedirs(outdir)
            for file in COPY_FILES:
                shutil.copy(
                    os.path.join(BUILDER_DIR, file),
                    os.path.join(outdir, file),
                )

            with open(os.path.join(outdir, "Dockerfile"), "w") as f:
                f.write(template.render(
                    alpine_version=ALPINE_VERSION,
                    node_version=node_version,
                    php_version=php_version,
                    node_checksum=node_checksum
                ))
