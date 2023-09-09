set dotenv-load

script_dir := if os_family() == "windows" { "./line_bot" } else { "./line_bot" }

default:
    @just --list --unsorted

prepare:
    poetry install
    pre-commit install

test:
  echo "version: $(poetry version -s)"

# build image
build:
  docker compose build

# publish image
publish:
  poetry export --without-hashes --format=requirements.txt > requirements.txt
  gcloud app deploy .

# start server
start:
  docker compose up -d

# stop server
stop:
  docker compose down

# restart server
restart: stop start
