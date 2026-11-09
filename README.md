# sudokulib

A Python library for Sudoku. The project is set up for development; application
APIs will be documented here as they are added.

## Requirements

- Python 3.12
- Poetry 2.x
- GNU Make

## Installation

```sh
poetry install
```

To import the package in the Poetry environment:

```sh
poetry run python -c "import sudokulib"
```

## Commands

Run `make help` for the current list of targets. The main commands are:

```sh
make test
make coverage
make lint-all
make pre-commit
```

## Structure

```text
src/sudokulib/       Python package
tests/unit/          unit tests
tests/functional/    functional tests
```

## Contributing

Work on a dedicated branch. Before proposing changes, run `make lint-all` and
the relevant tests. Run `make pre-commit` to check staged files.

## License

Distributed under the MIT license. See [LICENSE](LICENSE).
