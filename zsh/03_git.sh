# basic aliases
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gm='git merge'
alias gd='git diff'
alias gl='git log'
alias gcm='git commit'
alias gc='git checkout'
alias gp='git pull'
alias gh='git push'

# convenienve aliases
alias gundo='git reset --soft HEAD~1' # Undo last commit
alias gdelloc='git branch --merged | grep -v "\*" | grep -v "main" | grep -v "master" | xargs -n 1 git branch -d' # Delete all local branches that have been merged
