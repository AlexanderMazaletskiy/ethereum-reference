install: FORCE  # Pull in local project dependencies
	pipenv install
	pipenv install --dev
	pipenv lock --pre

test: FORCE  # Run tests
	pipenv run pytest --doctest-modules

format: FORCE  # Auto-format Python code
	pipenv run black src

types: FORCE  # Type check
	pipenv run mypy --ignore-missing-imports src/*

run: FORCE  # Generate and print markdown file to stdout
	pipenv run python -m src.main

push: FORCE # Prepare gen.html file for publishing
	pipenv run python -m src.main > ../ethereum-reference-www/src/cheatsheet/main.md

live: FORCE  # Create a live reload server
	ls src/* | entr -s "pipenv run python -m src.main"

python: FORCE
	apt-get update -qy
	apt-get install -y python3-dev python3-pip
	pip3 install pipenv

python37: FORCE
	add-apt-repository -y ppa:deadsnakes/ppa
	apt-get install -y python3.7 python3.7-dev

FORCE: 
