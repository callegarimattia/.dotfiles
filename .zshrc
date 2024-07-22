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
path+=$HOME/emma/marketplace-toolbox/bin
fpath+=$HOME/emma/marketplace-toolbox/bin
typeset -U path
typeset -U fpath

export path
export fpath
export GPG_TTY=$(tty)
export XDG_CONFIG="$HOME/.config"
export XDG_CACHE="$HOME/.cache"
export EDITOR=nvim
export HOMEBREW_AUTO_UPDATE_SECS="86400"

# Plugins and Themes for ZSH
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$(brew --prefix)/opt/spaceship/spaceship.zsh"

# AWS Aliases
alias awslogindev="aws sso login --profile mkpdev"
alias awsloginstg="aws sso login --profile mkpstage"
alias awsloginprod="aws sso login --profile mkpprod"
alias awsloginprodelevate="aws sso login --profile mkpprodelevated"

# Aliases
alias dps="docker ps --format \"table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Ports}}\""
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias cat='bat'
alias rm='trash -F'
alias tl='trash -l'
alias te='trash -l && trash -e'
alias tree='eza --tree --icons'
alias ls='eza --color=always --icons --group-directories-first'
alias la='eza -a --color=always --icons --group-directories-first'
alias ll='eza -l --color=always --icons --group-directories-first'
alias python='python3'
alias q='exit'
alias c='clear'
alias g='git'
alias lz='lazygit'
alias gdml='git for-each-ref --format "%(refname:short)" refs/heads | grep -v "master\|main" | xargs git branch -D'


# Evals
eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
eval "$(fzf --zsh)"

# Emma Sleep
export APP_SECRET_CONFIG="./config/ecom-dev.sops.yaml"
export APP_CONFIG_FILE="./config/ecom-dev.yaml"
source $HOME/.developer-toolbox/developer-toolbox.sh
export GOPRIVATE=github.com/emma-sleep/*

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

zstyle ':completion:*' menu select
fpath+=~/.zfunc
