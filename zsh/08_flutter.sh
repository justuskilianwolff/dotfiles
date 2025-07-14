# FVM and flutter
export PATH="$HOME/.fvm_flutter/bin:$PATH"
#export PATH="$PATH:$HOME/.fvm/bin" # TODO: might not be needed anymore

# aliases for fvm
# install via curl -fsSL https://fvm.app/install.sh | bash (https://fvm.app/documentation/getting-started/installation)
alias fl="fvm flutter"
alias da="fvm dart"

# add some aliases for flutter commands
alias flr="fl run"
alias flb="fl build"
alias flc="fl clean"
alias flg="fl generate"
alias flt="fl test"
alias fld="fl doctor"
alias fli="fl install"
alias flup="fl upgrade"
alias flp="fl pub"
alias flpg="fl pub get"
alias flcg="flc && flpg"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
## TODO: Does not work since I use zsh plugins for autocompletion
[[ -f $HOME/.dart-cli-completion/zsh-config.zsh ]] && . $HOME/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]
