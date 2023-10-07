set dotenv-load

script_dir := if os_family() == "windows" { "./line_bot" } else { "./line_bot" }

default:
    @just --list --unsorted

# install poetry and install project dependencies
prepare:
  pip install poetry
  poetry install
  pre-commit install

# run unit test
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
  uvicorn line_bot.main:app --host 0.0.0.0 --port 5000 --reload

# start server in docker
start-docker:
  docker compose up -d

# stop server in docker
stop-docker:
  docker compose down

# restart server
restart-docker: stop-docker start-docker
