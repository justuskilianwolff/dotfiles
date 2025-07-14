# FVM and flutter
export PATH="$HOME/.fvm_flutter/bin:$PATH"
export PATH="$PATH:$HOME/fvm/default/bin" # links to the global flutter version of fvm, only use outside of project

# aliases for fvm
# install via curl -fsSL https://fvm.app/install.sh | bash (https://fvm.app/documentation/getting-started/installation)
alias fl="fvm flutter"
alias da="fvm dart"

# add some aliases for fvm commands
alias fu="fvm use"
alias fin="fvm install"
alias fls="fvm list"
alias fr="fvm releases"
alias frm="fvm remove"
alias fg="fvm global"
alias fdo="fvm doctor"

# add some aliases for flutter commands
alias flr="fl run"
alias flb="fl build"
alias flc="fl clean"
alias flcr="fl create"
alias flg="fl generate"
alias flt="fl test"
alias fld="fl doctor"
alias fli="fl install"
alias flup="fl upgrade"
alias flp="fl pub"
alias flpg="fl pub get"
alias flpa="fl pub add"
alias flpr="fl pub remove"
alias flcg="flc && flpg"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
## TODO: Does not work since I use zsh plugins for autocompletion
[[ -f $HOME/.dart-cli-completion/zsh-config.zsh ]] && . $HOME/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]
