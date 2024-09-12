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
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias reps="cd ~/Repositories"

# misc
alias h='history'
alias c='clear'


function forward-word-begin(){
    zle forward-word
    zle beginning-of-word
}
zle -N forward-word-begin


# key bindings
bindkey '^I' autosuggest-accept
# accept the next word with alt+right (especially useful for autosuggestions of paths)
