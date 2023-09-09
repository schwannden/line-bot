# 萬隆基督的教會 Line Bot

## Requirements

1. [docker](https://docs.docker.com/get-docker/).
    * Using docker compose to start your local development environment ensures that local development and for production is more aligned.
2. [justfile](https://just.systems/)
    * Installation from pre-built binaries: [Installation guide](https://just.systems/man/en/chapter_5.html).
    * Note this is not a hard requirement, read [justfile](./justfile) to learn about relevent project command.

## Getting Started

1. `just prepare`.
2. `just start`.
    * The source code is mounted into container with `ro` flag, and hot reload is enabled.
3. visit `localhost:5000`.

## Updating Dependencies

1. Always use [poetry](https://python-poetry.org/) to manage dependencies.
2. Run `just build` to rebuild local container image after dependency update.

## Publishing Service

TBD.
