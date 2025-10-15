eval "$(starship init zsh)" # run as last to ensure all other configurations are loaded first

eval "$(zoxide init zsh)" # zoxide init

source <(fzf --zsh) # added fuzzy find (activated with Ctrl-R)