export XDG_CONFIG_HOME=$HOME/.config

# Setup autocompletion.
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# Ensures zsh cache is updated whenever PATH is modified.
zstyle ":completion:*:commands" rehash 1

export LANG=en_US.UTF8

# My plugins.
sources=(
    'aliases'
    'functions'
    'history'
    'path'
)
for s in $sources; do
    source $XDG_CONFIG_HOME/zsh/include/$s.zsh
done


# Loads $HOME/.extra if it exists.
[[ -e $HOME/.extra ]] && source $HOME/.extra

# Initializes starship prompt.
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
eval "$(starship init zsh)"


# Initializes fzf.
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"


# Initializes zoxide (cd replacement).
eval "$(zoxide init zsh)"
