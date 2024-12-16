# Installation

created after this example: https://www.youtube.com/watch?v=w7i4amO_zaE
updated lsp.lua after this example: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/configuration-templates.md#primes-config

## Steps
Start by installing neovim. Make sure the version is 0.9 or higher.

After starting nvim, you'll likely see a lot of errors. This is because the plugins have not been installed yet. You can
install them by starting from /init.lua and walking through the code flow. In each file, run `:so` and then
`:PackerSync`. 

### Additionally
- install Hack Nerd Font in order for NeoTree to display icons instead of questionmarks

#### Mac OSX
```sh
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```
Then: set iterm preferences -> profiles -> text -> set non ascii font to 'Hack nerd font'

#### Linux
1. Go (here)[https://www.nerdfonts.com/font-downloads] and download 'Hack nerd font', 'Fira code nerd font' and 'Fira mono nerd font'
2. Unzip and copy to `~/.fonts`
3. run `fc-cache -fv`
4. set the terminal font to use 'hack nerd font'

### LSP
In order to install the proper lsp's, you need to run `:Mason` and then select the lsp's you want.
| warning: The deno lsp might mess up your TS-imports
