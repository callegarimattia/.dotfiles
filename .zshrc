# PATH configuration
path+=/opt/homebrew/bin
path+=/usr/bin
path+=/bin
path+=/opt/homebrew/sbin
path+=/usr/sbin
path+=/sbin
path+=$HOME/.local/bin
path+=/usr/local/bin
path+=/usr/local/sbin
path+=/opt/homebrew/share/pypy3.10
path+=$HOME/go/bin
typeset -U path
export path

export XDG_CONFIG="$HOME/.config"
export XDG_CACHE="$HOME/.cache"

# Path to your oh-my-zsh installation.
export ZSH="$XDG_CONFIG/oh-my-zsh"
export ZSH_THEME="spaceship"
plugins=(git macos history)

# Plugins and Themes for ZSH
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/oh-my-zsh.sh

# AWS Aliases
alias awslogindev="aws sso login --profile ecom-dev"
alias awsloginstg="aws sso login --profile ecom-stage"
alias awsloginprod="aws sso login --profile ecom-prod"

# GPG TTY
export GPG_TTY=$(tty)
export PAGER=""

# Aliases
alias dps="docker ps --format \"table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Ports}}\""
alias v='nvim'
alias vim='nvim'
alias cat='bat'
alias rm='trash'
alias tl='trash -l'
alias te='trash -l && trash -e'
alias tree='eza --tree --icons'
alias ls='eza --color=always --icons --group-directories-first'
alias la='eza -a --color=always --icons --group-directories-first'
alias ll='eza -l --color=always --icons --group-directories-first'
alias python='python3'
alias q='exit'
alias c='clear'

eval $(thefuck --alias)
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Emma Sleep
export APP_SECRET_CONFIG="./config/ecom-dev.sops.yaml"
export APP_CONFIG_FILE="./config/ecom-dev.yaml"
source $HOME/.developer-toolbox/developer-toolbox.sh
export GOPRIVATE=github.com/emma-sleep/*