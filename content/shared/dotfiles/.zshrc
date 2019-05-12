if [ -x "$(command -v direnv)" ]; then
	eval "$(direnv hook zsh)"
fi

# Completions
fpath+=~/.antigen/completions

# antigen
source ~/.antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle pip
antigen bundle git
antigen theme cypher
antigen apply

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Aliases
alias ip="ip -c"
alias timestamp="date '+%s'"

# zsh features
setopt appendhistory autocd beep extendedglob nomatch notify NO_GLOBAL_RCS
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# Language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Environment
export PATH="$HOME/.cargo/bin:$HOME/Developer/scripts:$HOME/.yarn/bin:$HOME/.local/bin/:$PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
