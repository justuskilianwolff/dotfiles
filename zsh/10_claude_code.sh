# Claude Code configuration
# Overwrite this in your shell config (e.g., .zshrc):
CC_COMPOSE_PATH="$HOME/Repositories/dotfiles/claude_code/docker-compose.yml"

# Claude Code helper function
_claude_code_run() {
  docker compose --file "$CC_COMPOSE_PATH" run --rm \
    --volume "$(pwd):/workspace:cached" \
    --env UV_PROJECT_ENVIRONMENT=".venv_${PWD##*/}" \
    claude-code "$@"
}

# Claude Code aliases
alias sc='_claude_code_run' # sandbox claude
alias ss='_claude_code_run /bin/zsh' # sandbox shell
alias so='_claude_code_run opencode' # sandbox opencode
alias sr='docker ps --quiet --filter "ancestor=claude-code-image:latest" | xargs --no-run-if-empty docker stop' # sandbox remove
