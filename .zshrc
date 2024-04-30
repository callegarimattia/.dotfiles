# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
export EDITOR=nvim

# Path to your oh-my-zsh installation.
export ZSH="$XDG_CONFIG/oh-my-zsh"
export ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git history)

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

# Evals
eval $(thefuck --alias)
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
eval "$(fzf --zsh)"

# Emma Sleep
export APP_SECRET_CONFIG="./config/ecom-dev.sops.yaml"
export APP_CONFIG_FILE="./config/ecom-dev.yaml"
source $HOME/.developer-toolbox/developer-toolbox.sh
export GOPRIVATE=github.com/emma-sleep/*

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
