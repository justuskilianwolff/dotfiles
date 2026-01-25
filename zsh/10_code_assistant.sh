# Code Assistant configuration
# Overwrite this in your shell config (e.g., .zshrc):
CA_COMPOSE_PATH="$HOME/Repositories/dotfiles/code_assistant/docker-compose.yml"

# Code Assistant helper function
_code_assistant_run() {
  docker compose --file "$CA_COMPOSE_PATH" run --rm \
    --volume "$(pwd):/workspace:cached" \
    --env UV_PROJECT_ENVIRONMENT=".venv_${PWD##*/}" \
    code-assistant "$@"
}

# Code Assistant aliases
alias cc='_code_assistant_run claude' # code claude
alias co='_code_assistant_run opencode' # code open
alias cs='_code_assistant_run /bin/zsh' # code shell
alias cr='docker ps --quiet --filter "ancestor=code-assistant-image:latest" | xargs --no-run-if-empty docker stop' # code remove
