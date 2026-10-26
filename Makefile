.PHONY: help install test-unit test-functional test coverage mypy ruff format format-check lint-all clean

ifeq ($(OS),Windows_NT)
SHELL := cmd.exe
endif

help: ## Show documented development targets
	@echo "Targets: install, test-unit, test-functional, test, coverage, mypy, ruff, format, format-check, lint-all, clean"

install: ## Install the package and development dependencies with Poetry
	poetry install

test-unit: ## Run unit tests
	poetry run pytest tests/unit/

test-functional: ## Run functional tests
	poetry run pytest tests/functional/

test: ## Run the complete configured test suite
	poetry run pytest

coverage: ## Run all tests and display coverage
	poetry run pytest --cov=sudokulib --cov-report=term-missing

mypy: ## Type-check package code
	poetry run mypy src/sudokulib

ruff: ## Check package code and tests with Ruff
	poetry run ruff check src tests

format: ## Format package code and tests
	poetry run ruff format src tests

format-check: ## Check formatting without changing files
	poetry run ruff format --check src tests

lint-all: ## Run Ruff, MyPy, and formatting checks
	$(MAKE) ruff
	$(MAKE) mypy
	$(MAKE) format-check

clean: ## Remove generated test, typing, lint, and build artifacts
	poetry run python -c "import pathlib, shutil; [shutil.rmtree(p, ignore_errors=True) for p in map(pathlib.Path, ['.pytest_cache', '.mypy_cache', '.ruff_cache', 'htmlcov', 'dist', 'build'])]; [p.unlink(missing_ok=True) for p in map(pathlib.Path, ['.coverage', 'coverage.json'])]"
