# Claude Code Guidelines

- Don't remove comments that were added for better code understanding
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
- Use ruff over manual formatting and linting
  - This should automatically remove unused imports and variables, fix formatting issues, etc.
- When working on python projects, please make sure that you run `uv run ruff check --fix` and `uv run ruff format` before committing your code
- Always use named arguments where possible: `fun_call(arg_name=arg)` instead of `fun_calll(arg)`, `fun(x=x, k=5)` instaed of `fun(x, 5)`
- Please don't use convenience imports in `__init__.py`files, rather use the full import path when importing modules, e.g., `from package.module import Class` instead of `from package import Class`

### Testing

- Always run pytest through uv: `uv run pytest`
- Use `uv run pytest -v` for verbose output
- Use `uv run pytest <path>` to run specific tests

## Networking

This Claude Code instance runs inside a Docker container. To access services running on the host machine:

- Use `host.docker.internal` instead of `localhost` or `127.0.0.1`
- Example: `curl http://host.docker.internal:8000/docs`
- The `WebFetch` tool cannot access local services (it runs in a different network context), so use `curl` via Bash instead

Note: Even though the container uses `network_mode: host`, `localhost` may not resolve to the host machine on Docker Desktop (macOS/Windows). Always prefer `host.docker.internal` for reliability.

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
