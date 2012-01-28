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

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew cap gem ssh-agent rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#
export PATH=/usr/local/bin:/usr/local/Cellar/ruby/1.9.2-p180/bin:/usr/local/Cellar/ruby/1.9.2-p180/lib/ruby/gems/1.9.1/bin:/usr/bin:/usr/sbin:/bin:/sbin:/opt/local/bin:/opt/local/sbin:/Users/viper/bin:/usr/X11/bin:/usr/local/pear/bin:/usr/local/mysql/bin:/usr/local/sbin

# lang
#
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# rvm
#
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"


# node.js
#
export NODE_PATH=/usr/local/lib/node:/usr/local/lib/node_modules


# arch
export ARCHFLAGS="-arch x86_64"


# git
#
unalias gst # to use my gst bin instead :)
alias gf='git fetch'
alias grco='git rebase origin/$(current_branch)'


# some more aliases
#
alias root='sudo zsh'
alias r='rails'


# for bundle open (at least)
#
export EDITOR=mvim

