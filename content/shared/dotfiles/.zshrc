if [ -x "$(command -v direnv)" ]; then
	eval "$(direnv hook zsh)"
fi

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

# zsh features
setopt appendhistory autocd beep extendedglob nomatch notify NO_GLOBAL_RCS
bindkey '^[[1;5D' beginning-of-line
bindkey '^[[1;5C' end-of-line
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word

# Language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Environment
export PATH="$HOME/.cargo/bin:$HOME/Developer/scripts:$HOME/.yarn/bin:$HOME/.local/bin/:$PATH"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"