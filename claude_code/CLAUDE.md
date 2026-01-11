# Claude Code Guidelines

- Don't remove comments I added for better code understanding

Below are instructions for working with different technologies.

## Git

- Don't stage or commit any files if not explicitly instructed to do so

## Python

- Always try to use `uv`  
  - Use it to manage virtual environments and dependencies
  - Use it to run python scripts and commands, e.g., `uv run python script.py`, `uv run python -m module` or `uv run pytest`
  - If `uv` is not available, please ask for help
- When working on python projects, please make sure that you run `uv run ruff check --fix` and `uv run ruff format` before committing your code
- Always use named arguments where possible: `fun_call(arg_name=arg)` instead of `fun_calll(arg)`,  `fun(x=x, k=5)` instaed of `fun(x, 5)`

### Testing

- Always run pytest through uv: `uv run pytest`
- Use `uv run pytest -v` for verbose output
- Use `uv run pytest <path>` to run specific tests
