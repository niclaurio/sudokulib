.PHONY: help install clean

ifeq ($(OS),Windows_NT)
SHELL := cmd.exe
endif

help: ## Show documented development targets
	@echo "Targets: install, clean"

install: ## Install the package and development dependencies with Poetry
	poetry install

clean: ## Remove generated test, typing, lint, and build artifacts
	poetry run python -c "import pathlib, shutil; [shutil.rmtree(p, ignore_errors=True) for p in map(pathlib.Path, ['.pytest_cache', '.mypy_cache', '.ruff_cache', 'htmlcov', 'dist', 'build'])]; [p.unlink(missing_ok=True) for p in map(pathlib.Path, ['.coverage', 'coverage.json'])]"
