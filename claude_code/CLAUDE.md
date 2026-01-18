# Claude Code Guidelines

- Don't remove comments I added for better code understanding
- When running into problems, search for known bugs, issues and solutions online
  - Prefer official and up-to-date documentation, e.g. from GitHub repositories

Below are instructions for working with different technologies.

## Git

- Don't stage or commit any files if not explicitly instructed to do so

## Python

- Always try to use `uv`
  - Use it to manage virtual environments and dependencies
  - Use it to run python scripts and commands, e.g., `uv run python script.py`, `uv run python -m module` or `uv run pytest`
  - If `uv` is not available, please ask for help
- When working on python projects, please make sure that you run `uv run ruff check --fix` and `uv run ruff format` before committing your code
- Always use named arguments where possible: `fun_call(arg_name=arg)` instead of `fun_calll(arg)`, `fun(x=x, k=5)` instaed of `fun(x, 5)`

### Testing

- Always run pytest through uv: `uv run pytest`
- Use `uv run pytest -v` for verbose output
- Use `uv run pytest <path>` to run specific tests

## Shell

- When using shell commands in scripts etc, please always use the long form of the arguments, e.g., `--help` instead of `-h`, `--version` instead of `-v`, etc.

  - This simplifies the understanding of the code and reduces the chance of mistakes for other developers
  - When you just need to run a quick command in the terminal, i.e. not used in docs etc, short forms are fine

  Example in a script:

  ```bash
  # Good
  curl --silent --location --output file.txt https://example.com

  # Avoid
  curl -sLo file.txt https://example.com
  ```
