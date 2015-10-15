# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
# export ZSH_THEME="robbyrussell"
export ZSH_THEME="kennethreitz"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"
export DISABLE_UPDATE_PROMPT="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew gem ssh-agent docker chruby node npm golang)

source $ZSH/oh-my-zsh.sh
source ~/.zshenv


# lang
#
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# default ruby
#
chruby ruby-2.2.3


# node.js
#
export NODE_PATH=/usr/local/lib/node:/usr/local/lib/node_modules


# arch
export ARCHFLAGS="-arch x86_64"


# git
#
unalias gst # to use my gst bin instead :)
alias g='nocorrect git'
alias gf='git fetch'
alias grco='git rebase origin/$(current_branch)'
alias grb='nocorrect grb'


# some more aliases
#
alias root='sudo zsh'
alias r='rails'
alias d='docker'
alias be='bundle exec'


# for bundle open (at least)
#
export EDITOR=mvim



# boot2docker
#
# eval $(boot2docker shellinit)
eval $(docker-machine env docker-vm)


# NVM
export NVM_DIR="/Users/lars/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# CoreOS
#
alias f=fleetctl
