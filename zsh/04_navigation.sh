# Function to go up x directories
function up() {
    # Default to 1 if no argument is provided
    local x=${1:-1}
    # do cd .. x times
    for ((i=0; i<x; i++)); do
        cd ..
    done
}

# directory shortcuts
alias docs="cd ~/Documents"
alias down="cd ~/Downloads"
alias desk="cd ~/Desktop"
alias repos="cd ~/Repositories"
alias dotfiles="code ~/Repositories/dotfiles"

# misc
alias h='history'
alias c='clear'
alias l='ls -lahF --color=auto'

# run last command if empty
# repeat_last_command() {
#     if [[ -z $BUFFER ]]; then
#         zle up-history
#     fi
#     zle accept-line
# }

# zle -N repeat_last_command
# bindkey '^M' repeat_last_command
