# dotfiles

This repository just serves to sync my shell and other configs between my work and private machines. 
More advanced approaches like stow or chezmoi don’t seem to be necessary yet, but never say never...

## zsh 
To source all files in the `zsh` directory you can run following command in your `.zshrc` file:
```shell
for file in /path/to/dotfiles/zsh/*; do
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
to list all casks and formulaes and forcing the overrride.