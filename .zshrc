# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="kennethreitz"

plugins=(git ssh-agent) # osx brew gem ssh-agent chruby node npm golang rust)

source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/projects/go
export PATH=$HOME/bin:$GOPATH/bin:/usr/local/sbin:$PATH

# source ~/.zshenv


# Lang
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Arch
export ARCHFLAGS="-arch x86_64"


# Aliases
#
unalias gst # to use my gst bin instead :)
# unalias gh # to use my gh github script instead
alias g='nocorrect git'
alias gf='git fetch'
alias grco='git rebase origin/$(current_branch)'
alias grb='nocorrect grb'
alias root='sudo zsh'
alias r='rails'
alias d='docker'
alias be='bundle exec'
alias f=fleetctl
alias fig=docker-compose
alias bb=babl-build
alias ba=babl-admin


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi


# Languages

# default ruby
source /usr/local/share/chruby/chruby.sh
chruby 2.4.1

# node.js
export NODE_PATH=/usr/local/lib/node_modules

# NVM
# export NVM_DIR="/Users/lars/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Direnv
eval "$(direnv hook zsh)"
