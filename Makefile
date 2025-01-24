.PHONY: install format lint test clean build publish

install:
	pip install -e ".[dev]"

format:
	black countmytokens tests
	ruff check --fix countmytokens tests

lint:
	black --check countmytokens tests
	ruff check countmytokens tests
	mypy countmytokens tests

test:
	pytest

clean:
	rm -rf build/ dist/ *.egg-info/ .pytest_cache/ .coverage .mypy_cache/ .ruff_cache/

build: clean
	python -m build

publish: build
	python -m twine upload dist/* 