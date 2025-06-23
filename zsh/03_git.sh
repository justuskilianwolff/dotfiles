# basic aliases
alias g='git' #
compdef g=git

alias ga='git add'
compdef ga=git

alias gb='git branch'
compdef gb=git

alias gf='git fetch'
compdef gf=git

alias gm='git merge'
compdef gm=git

alias gmnc='git merge --no-commit --no-ff'
compdef gmnc=git

alias gd='git diff'
compdef gd=git

alias gl='git log'
compdef gl=git

alias gc='git commit'
compdef gc=git

alias gpl='git pull'
compdef gpl=git

alias gph='git push'
compdef gph=git

alias gr='git restore'
compdef gr=git

alias gsn='git switch -c'
compdef gsn=git

alias gcl='git clone'
compdef gcl=git

# convenienve functions and aliases (without tab completion)
alias go='git remote get-url origin | sed "s/git@/https:\/\//; s/com:/com\//; s/\.git$//" | xargs open' # open the repo in the browser

# undo the last x commits (defaults to 1)
function gundo() {
    if [ $# -eq 0 ]; then
        git reset --soft HEAD~1
    else
        git reset --soft HEAD~$1
    fi
}

function gdelloc() {
    # Delete all local branches that have been merged
    git branch --merged | grep -v "\*" | grep -v "main" | grep -v "master" | xargs -n 1 git branch -d
    # delete all local branches that were deleted on remote
    git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D
}

# git checkout function
function gs() {
    if [ $# -eq 0 ]; then
        git switch main
    else
        git switch "$@"
    fi
}
compdef _git gs=git-switch
