# Claude Code configuration
# Overwrite this in your shell config (e.g., .zshrc):
CC_COMPOSE_PATH="$HOME/Repositories/dotfiles/claude_code/docker-compose.yml"

# Claude Code helper function
_claude_code_run() {
  docker compose -f "$CC_COMPOSE_PATH" run --rm \
    -v "$(pwd):/workspace:cached" \
    claude-code "$@"
}

# Claude Code aliases
alias sc='_claude_code_run' # sandbox claude
alias ss='_claude_code_run /bin/bash' # sandbox shell
alias sr='docker ps -q --filter "ancestor=claude-code-image:latest" | xargs -r docker stop' # sandbox remove 
