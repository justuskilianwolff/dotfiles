# dotfiles

This repository just serves to sync my shell and other configs between my work and private machines. 
More advanced approaches like stow or chezmoi don’t seem to be necessary yet, but never say never...

## zsh 
To source all files in the `zsh` directory you can run following command in your `.zshrc` file:
```shell
DOTFILES_PATH="/Users/justuswolff/Repositories/dotfiles"

# source all files in the zsh folder of teh dotfiles repo
for file in "$DOTFILES_PATH/zsh/"*; do
  [ -f "$file" ] && source "$file"
done
```

## Homebrew
Within the `brew` directory run
```shell
brew bundle [--cleanup]
```
to install the Brewfile (and optionally) removing your other installations. To add your local installations run
```shell
brew bundle dump --cask --formula --tap --force
``` 
to list all casks and formulaes and forcing the overrride. This just handles installation. To upgrade already installed casks run
```shell
brew upgrade --cask --greedy  
```

### Using on multiple accounts on same machine
- Followed the [untar anywhere approach](https://stackoverflow.com/questions/41840479/how-to-use-homebrew-on-a-multi-user-macos-sierra-setup)
- Export in .zshrc: `export HOMEBREW_PREFIX="/Users/justuswolff_private/brew"`

## iTerm2
Load and/or export the profile configured here. I could not get the profile used by iTerm2 to be also used by VSCode but the natural key editing seems to be similar :)

## To Do
- [ ] [Toggle function keys](https://superuser.com/questions/1755750/how-can-i-toggle-between-fn-and-function-f-keys-on-mac)