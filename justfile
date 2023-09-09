set dotenv-load

script_dir := if os_family() == "windows" { "./line_bot" } else { "./line_bot" }

default:
    @just --list --unsorted

test:
  echo "version: $(poetry version -s)"

# build image
build:
  docker build . -f Dockerfile.prod -t "schwannden/wl-line-bot:$(poetry version -s)"

# publish image
publish:
  docker push "schwannden/wl-line-bot:$(poetry version -s)"

# start server
start:
  docker compose up -d

# stop server
stop:
  docker compose down

# restart server
restart: stop start

# format python
format:
  autoflake --in-place --remove-all-unused-imports {{script_dir}} -r
  isort --profile black {{script_dir}}
  black {{script_dir}}
