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
path+=/opt/homebrew/opt/ruby/bin
fpath+=$HOME/emma/marketplace-toolbox/bin
fpath+=$(brew --prefix)/share/zsh/site-functions
typeset -U path
typeset -U fpath

autoload -Uz compinit
compinit

# Exports
export path
export fpath
export GPG_TTY=$(tty)                               # for signed commits
export XDG_CONFIG="$HOME/.config"
export XDG_CACHE="$HOME/.cache"
export EDITOR=nvim
export HOMEBREW_AUTO_UPDATE_SECS="86400"            # brew configs
export HOMEBREW_DEVELOPER=1                         # brew configs
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"       # ruby
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"  # ruby

# Sources scripts
source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias dps="docker ps --format \"table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Ports}}\""
alias v='nvim'
alias vi='nvim'
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
alias g='git'
alias lz='lazygit'
alias gdml='git for-each-ref --format "%(refname:short)" refs/heads | grep -v "master\|main" | xargs git branch -D'
alias man='gman'

# Evals
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
eval "$(fzf --zsh)"
eval "$(starship init zsh)"

# Perl stuff
PATH="/Users/callegarimattia/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/callegarimattia/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/callegarimattia/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/callegarimattia/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/callegarimattia/perl5"; export PERL_MM_OPT;
