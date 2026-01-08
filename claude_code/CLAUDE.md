# Project Configuration

## Git

Don't stage or commit any files if not explicitly instructed to do so.

## Python

Instructions for working with Python projects. Always try to use the `uv` tool to manage virtual environments and dependencies. If `uv` is not available, please ask for help.

### Testing

- Always run pytest through uv: `uv run pytest`
- Use `uv run pytest -v` for verbose output
- Use `uv run pytest <path>` to run specific tests

### General Guidelines

- All Python commands should be executed through uv (e.g., `uv run python`, `uv run pytest`)
- When working on python projects, please make sure that you run `uv run ruff check --fix` and `uv run ruff format` before committing your code
- This ensures the correct virtual environment and dependencies are used
- Please add dependencies via `uv add <package>` to keep the environment consistent
- Please use named arguments where possible: `fun_call(arg_name=arg)` instead of `fun_calll(arg)`
- always use named arguments, i.e. fun(x=x, k=5), not fun(x, 5)
