.PHONY: help install test-unit test-functional test coverage mypy ruff format format-check lint-all pre-commit clean

ifeq ($(OS),Windows_NT)
SHELL := cmd.exe
endif

help: ## Show documented development targets
	@echo "Targets: install, test-unit, test-functional, test, coverage, mypy, ruff, format, format-check, lint-all, pre-commit, clean"

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

pre-commit: ## Run staged-file checks and per-source coverage
	poetry run python -c "import subprocess as s; run=lambda args: s.run(args, check=True); files=[p for p in s.check_output(['git','diff','--cached','--name-only','--diff-filter=ACMR','--','src','tests'], text=True).splitlines() if p.endswith('.py')]; source=[p for p in files if p.startswith('src/')]; checks=[p for p in files if p.startswith(('src/','tests/'))]; print('No staged Python source or test files; lint and coverage checks are not applicable.' if not checks else 'Checking staged Python files:', *checks); [run(['poetry','run','ruff','check',*checks]) for _ in [0] if checks]; [run(['poetry','run','ruff','format','--check',*checks]) for _ in [0] if checks]; [run(['poetry','run','mypy',*source]) for _ in [0] if source]; [run(['poetry','run','pytest','--cov=sudokulib','--cov-report=json:coverage.json']) for _ in [0] if source]; [run(['poetry','run','coverage','report','--include='+p,'--fail-under=96']) for p in source]; [run(['poetry','run','pytest']) for _ in [0] if checks and not source]"

clean: ## Remove generated test, typing, lint, and build artifacts
	poetry run python -c "import pathlib, shutil; [shutil.rmtree(p, ignore_errors=True) for p in map(pathlib.Path, ['.pytest_cache', '.mypy_cache', '.ruff_cache', 'htmlcov', 'dist', 'build'])]; [p.unlink(missing_ok=True) for p in map(pathlib.Path, ['.coverage', 'coverage.json'])]"
