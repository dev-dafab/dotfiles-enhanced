fds_alias() {

# Editor
alias e="nvim"

alias tm="tmux -2"

alias p="cd ~/Projekts/"

alias k="kubectl"
alias kgx="kubectl config get-contexts"

alias d="docker"
alias dps="docker ps"

# Suffix Aliases are defined using the -s flag. With suffix aliases,
# you can launch files with a specific extension (or suffix) in your favorite tool.
# To register a suffix alias, we use the alias -s extension=name-of-the-tool pattern.
alias -s md=code
alias -s json=code
alias -s zsh=nvim
alias -s {cs,ts,html}=nvim

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# node related

alias y='yarn --offline '

# macOS aliasses
if [[ $OSTYPE == darwin* ]]; then
  alias flush='dscacheutil -flushcache'
  # Disable Spotlight
  alias spotoff="sudo mdutil -a -i off"
  # Enable Spotlight
  alias spoton="sudo mdutil -a -i on"
  # Empty the Trash on all mounted volumes and the main HDD.
  # Also, clear Apple’s System Logs to improve shell startup speed.
  # Finally, clear download history from quarantine. https://mths.be/bum
  alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

  # Show/hide hidden files in Finder
  alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
  alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

  # Hide/show all desktop icons (useful when presenting)
  alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
  alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
fi
}

fds_env() {
# Prefer US English and use UTF-8.
export LANG=en_US.UTF-8
export LC_ALL='en_US.UTF-8';

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export TERM=xterm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export SDKMAN_DIR="/home/dev/.sdkman"
[[ -s "/home/dev/.sdkman/bin/sdkman-init.sh" ]] && source "/home/dev/.sdkman/bin/sdkman-init.sh"

export PATH=$PATH:/usr/local/go/bin

# custom bin
export PATH=$PATH:$HOME/.bin

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';
}

fds_vim_like() {
bindkey -v
zle -N nop
bindkey '\e[7~' beginning-of-line
bindkey '\e[8~' end-of-line
# search up/down by taking the current line content into account
bindkey -M viins '^[[A' history-beginning-search-backward
bindkey -M viins '^[[B' history-beginning-search-forward
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward
bindkey '^[[Z' reverse-menu-complete
# vi-backward-delete-char is stupid
bindkey -M viins '^?' backward-delete-char
# go up one dir with <C-u>
bindkey -M viins -s ^U "cd ..\C-m"
}

fds_fzf() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

fds_alias
fds_env
fds_vim_like
fds_fzf
