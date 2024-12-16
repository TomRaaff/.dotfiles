# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# [ENVIRONMENT VARIABLES]
PATH="/bin:/usr/bin:/usr/local/bin"
path+=/sbin:/usr/sbin
path+=/opt/homebrew/bin
path+=/Users/tomraaff/Library/Python/3.9/bin
path+=/Users/tomraaff/Workspace/scripts/projects/
path+=/Users/tomraaff/Workspace/boilerplates/

export PATH

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export ZSH=/Users/tomraaff/.oh-my-zsh

# [ZSH]
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  mvn
  brew
  docker
  gradle
  iterm2
  node
  npm
  yarn
  ng
  nvm
  macos
  sdk
  java
)

source $ZSH/oh-my-zsh.sh 

# [ALIASES]
alias la='ls -a'
alias ll='ls -al'
alias ..='cd ../'
alias tab='open . -a iterm'
# [folders]
alias root='cd /'
alias home='cd ~'
alias desk='cd ~/desktop'
alias nvimconfig='cd ~/.dotfiles/nvim/ && nvim .'
alias nvimdocs='cd ~/.dotfiles/nvim/.config/nvim/ && nvim vim-notes.md'
alias security='cd /Volumes/Security'
alias file='find . | grep -i'
alias ip='ip4 && echo " " && ip6'
alias ip4='ipconfig getifaddr en0'
alias ip6='curl ifconfig.me'
# [git]
alias gpf="git push --force-with-lease"
alias gbpurge='git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d'
alias gpmr='gp -o merge_request.create -o merge_request.remove_source_branch'
alias gpfmr='gpf -o merge_request.create -o merge_request.remove_source_branch'
alias gpmerge='gp -o merge_request.create -o merge_request.merge_when_pipeline_succeeds'
alias gpsupmr='gpsup -o merge_request.create -o merge_request.remove_source_branch'
alias gpsupmerge='gpsup -o merge_request.create -o merge_request.merge_when_pipeline_succeeds -o merge_request.remove_source_branch'
alias mvncvct='mvncv -Pcomponent-test'
alias gcambla='gcam "bla"'

# [FUNCTIONS]
function mk() {
    mkdir -p $1 && cd $1
}

# [SDKMAN] This must be at the end of the file for sdkman to work
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

[ -f "/Users/tomraaff/.ghcup/env" ] && . "/Users/tomraaff/.ghcup/env" # ghcup-env

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
