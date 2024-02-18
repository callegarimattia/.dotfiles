if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

path+=$HOME/.local/bin
path+=/opt/homebrew/share/pypy3.10
path+=$HOME/go/bin

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"


export GPG_TTY=$(tty)
typeset -U path
export path
export PAGER=""

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git macos history)

source $ZSH/oh-my-zsh.sh

alias cat='bat'
alias rm='trash'
alias tl='trash -l'
alias te='trash -l && trash -e'
alias tree='eza --tree --icons'
alias ls='eza --color=always --icons --group-directories-first' 	# my preferred listing
alias la='eza -a --color=always --icons --group-directories-first'  	# all files and dirs
alias ll='eza -l --color=always --icons --group-directories-first'  	# long format
alias python='python3'
alias q='exit'
alias c='clear'

# AWS
alias awslogindev="aws sso login --profile dataeng-dev"
alias awsloginstg="aws sso login --profile dataeng-stage"
alias awsloginprod="aws sso login --profile dataeng-prod"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.developer-toolbox/developer-toolbox.sh

eval $(thefuck --alias)
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
