# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="kennethreitz"

plugins=(git ssh-agent) # osx brew gem ssh-agent chruby node npm golang rust)

source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/projects/go
export PATH=$HOME/bin:$GOPATH/bin:/usr/local/opt/python/libexec/bin:/usr/local/opt/curl/bin:/usr/local/sbin:$PATH

# source ~/.zshenv
source ~/.profile

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
# alias r='rails'
alias r='redis-cli'
alias d='docker'
alias be='bundle exec'
alias f=fleetctl
alias fig=docker-compose
alias bb=babl-build
alias ba=babl-admin
alias ncdu="ncdu --color dark -x --exclude .git --exclude node_modules"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias k='kubectl --context "$KUBECTL_CONTEXT"'


export EDITOR='vim'


# Erlang
export ERL_AFLAGS="-kernel shell_history enabled"

# Crystal
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

# default ruby
source /usr/local/share/chruby/chruby.sh
chruby 2.6.4

# node.js
export NODE_PATH=/usr/local/lib/node_modules

# NVM
# export NVM_DIR="/Users/lars/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Direnv
eval "$(direnv hook zsh)"
export PATH="/usr/local/opt/node@8/bin:$PATH"

# FZF // install with $(brew --prefix)/opt/fzf/install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc
if [ -e /Users/l/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/l/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
