.PHONY: help install test-unit test-functional test coverage coverage-check mypy ruff ruff-fix arid format format-check lint-all pre-commit clean

ifeq ($(OS),Windows_NT)
SHELL := cmd.exe
endif

help: ## Show documented development targets
	@echo "Targets: install, test-unit, test-functional, test, coverage, coverage-check, mypy, ruff, ruff-fix, arid, format, format-check, lint-all, pre-commit, clean"

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

coverage-check: coverage ## Require at least 95 percent total test coverage
	poetry run coverage report --fail-under=95

mypy: ## Type-check package code
	poetry run mypy src/sudokulib

ruff: ## Check package code Ruff
	poetry run ruff check src

ruff-fix: ## Check package code with Ruff and apply automatic fixes
	poetry run ruff check --fix src

arid: ## Check package code for duplication
	poetry run arid src

format: ## Format package code
	poetry run ruff format src 

format-check: ## Check formatting without changing files
	poetry run ruff format --check src tests

lint-all: ## Run Ruff, MyPy, and formatting checks
	$(MAKE) ruff
	$(MAKE) mypy
	$(MAKE) format-check
	$(MAKE) arid

pre-commit: lint-all coverage-check

clean: ## Remove generated test, typing, lint, and build artifacts
	poetry run python -c "import pathlib, shutil; [shutil.rmtree(p, ignore_errors=True) for p in map(pathlib.Path, ['.pytest_cache', '.mypy_cache', '.ruff_cache', 'htmlcov', 'dist', 'build'])]; [p.unlink(missing_ok=True) for p in map(pathlib.Path, ['.coverage', 'coverage.json'])]"
