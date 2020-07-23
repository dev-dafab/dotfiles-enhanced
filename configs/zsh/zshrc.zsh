ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh-custom-plugins

ZSH_THEME="robbyrussell"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git fds)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
