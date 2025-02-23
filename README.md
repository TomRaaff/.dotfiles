# Installation

`brew install stow`

`cd ~/.dotfiles/`

## ZSH

for this to work, you need to first manually copy .zshrc from the repo.
Otherwise brew will not work. After opening a shell with brew and stow
working, you can `rm -rf ~/.zshrc` and `rm -rf ~/.zprofile`.
DO NOT CLOSE THE TERMINAL
`cd ~/.dotfiles && stow zsh`

## Creating symlinks for the other directories

`stow git && stow karabiner && stow lazygit && stow nvim && stow p10k && stow tmux`

if any of the following commands give errors about .DS_Store, just delete
those .DS_Store files.

For more info and context about the installation:
https://www.jakewiesler.com/blog/managing-dotfiles
