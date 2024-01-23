if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

path+=/opt/homebrew/bin
path+=/usr/bin:/bin:/usr/sbin:/sbin
path+=$HOME/.local/bin
path+=/opt/homebrew/share/pypy3.10

export GPG_TTY=$(tty)
typeset -U path
export path
export PAGER=""

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

plugins=(git macos history)

source $ZSH/oh-my-zsh.sh

alias python='python3'
alias pip='pip3'
alias rm=trash
alias tl='trash -l'
alias tree='eza --tree --icons'
alias te='tl&&trash -e'
alias q='exit'
alias ls='eza --color=always --icons --group-directories-first' 	# my preferred listing
alias la='eza -a --color=always --icons --group-directories-first'  	# all files and dirs
alias ll='eza -l --color=always --icons --group-directories-first'  	# long format
alias pypy='pypy3'

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

eval $(thefuck --alias)
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh
