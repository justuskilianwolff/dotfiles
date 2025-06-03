alias d='docker'
alias dps='docker ps'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias drm='docker rm $(docker ps -a -q)'
alias drmi='docker rmi $(docker images -q)'

alias dockerclean="docker system prune -a --volumes"
