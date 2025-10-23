# basic aliases
alias g='git'
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

alias gr='git rebase'
compdef gr=git

alias grc='git rebase --continue'
compdef grc=git

alias gra='git rebase --abort'
compdef gra=git

alias gd='git diff'
compdef gd=git

alias gds='git diff --staged'
compdef gds=git

alias gl='git log'
compdef gl=git

alias gc='git commit'
compdef gc=git

gcm() {
    git commit -m "$*"
}

alias gpl='git pull'
compdef gpl=git

alias gph='git push'
compdef gph=git

alias gphf='git push --force-with-lease'
compdef gphf=git

alias grs='git restore'
compdef grs=git

alias gsn='git switch -c' # git switch new
compdef gsn=git

alias gsd='git switch dev' # git switch dev
compdef gsd=git

alias gsth='git stash' 
compdef gsth=git

gsthm() {
    local flags=()
    local message=()
    
    # Separate flags from message words
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -*) flags+=("$1") ;;
            *) message+=("$1") ;;
        esac
        shift
    done
    
    git stash push "${flags[@]}" -m "${message[*]}"
}

alias gsthp='git stash pop'
compdef gsthp=git

alias gcl='git clone'
compdef gcl=git

alias gst='git status'
compdef gst=git

alias glg="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=format:'%d/%m/%Y %H:%M'"
compdef glg=git

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
compdef glods=git

# convenienve functions and aliases (without tab completion)
alias go='branch=$(git branch --show-current 2>/dev/null || git rev-parse --short HEAD); \
  url=$(git remote get-url origin | sed "s|^git@|https://|; s|github\.com:|github.com/|; s|\.git$||"); \
  open "$url/tree/$branch"'
  
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
        # Try to switch to main first
        if ! git switch main 2>/dev/null; then
            # If main doesn't exist, try master
            echo "Branch 'main' not found, trying 'master'..."
            git switch master
        fi
    else
        # If arguments provided, pass them through to git switch
        git switch "$@"
    fi
}

compdef _git gs=git-switch
