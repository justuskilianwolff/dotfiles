# Code Assistant configuration
# Overwrite this in your shell config (e.g., .zshrc):
CA_COMPOSE_PATH="$HOME/Repositories/dotfiles/code_assistant/docker-compose.yml"

# Code Assistant helper function
_code_assistant_run() {
  docker compose --file "$CA_COMPOSE_PATH" run --rm \
    --interactive --tty \
    --volume "$(pwd):$(pwd):cached" \
    --workdir "$(pwd)" \
    --env UV_PROJECT_ENVIRONMENT=".venv_${PWD##*/}" \
    code-assistant "$@"
}

# Code Assistant aliases
alias cac='_code_assistant_run claude' # code claude
alias cao='_code_assistant_run opencode' # code open
alias cas='_code_assistant_run /bin/zsh' # code shell
alias car='docker ps --quiet --filter "ancestor=code-assistant-image:latest" | xargs --no-run-if-empty docker stop' # code remove
