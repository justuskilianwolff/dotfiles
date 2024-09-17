# basic aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gf='git fetch'
alias gcb='git checkout -b'
alias gm='git merge'
alias gd='git diff'
alias gl='git log'
alias gcm='git commit'
alias gp='git pull'
alias gh='git push'

# convenienve functions

# undo the last x commits (defaults to 1)
function gundo(){
    if [ $# -eq 0 ]; then
        git reset --soft HEAD~1
    else
        git reset --soft HEAD~$1
    fi
}

function gdelloc(){
    # Delete all local branches that have been merged
    git branch --merged | grep -v "\*" | grep -v "main" | grep -v "master" | xargs -n 1 git branch -d
    # delete all local branches that were deleted on remote
    git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d
}

# git checkout function
function gc(){
    if [ $# -eq 0 ]; then
        git checkout main
    else
        git checkout "$@"
    fi
}