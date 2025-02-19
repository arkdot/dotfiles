export XDG_CONFIG_HOME=$HOME/.config

export LANG=en_US.UTF8


# Sets ZSH_CUSTOM to the path where my custom files and plugins are stored.
[[ -n "$ZSH_CUSTOM" ]] || ZSH_CUSTOM="$XDG_CONFIG_HOME/zsh/custom"

# Sets ZSH_CACHE_DIR to the path where cache files should be created.
[[ -n "$ZSH_CACHE_DIR" ]] || ZSH_CACHE_DIR="$HOME/.cache/zsh"

# ===========================================================================
# ZSH completion configuration

# Creates cache and completion directories and add to $fpath.
mkdir -p $ZSH_CACHE_DIR/completions
fpath=($ZSH_CACHE_DIR/completions $fpath)

# Loads and configures completion system.
autoload -U compaudit compinit zrecompile

# Saves the location of the current completion dump file.
if [[ -z "$ZSH_COMPDUMP" ]]; then
    ZSH_COMPDUMP="$ZSH_CACHE_DIR/zcompdump-${ZSH_VERSION}"
fi

compinit -i -d $ZSH_COMPDUMP

# zcompile the completion dump file
if command mkdir "${ZSH_COMPDUMP}.lock" 2>/dev/null; then
    zrecompile -q -p "${ZSH_COMPDUMP}"
    command rm -rf "${ZSH_COMPDUMP}.zwc.old" "${ZSH_COMPDUMP}.lock"
    zrecompile
fi

# Set completion colors to be the same as `ls`.
[[ -z "$LS_COLORS" ]] || zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Ensures zsh cache is updated whenever PATH is modified.
zstyle ":completion:*:commands" rehash 1

# ===========================================================================

# My plugins.
custom=(
    'aliases'
    'functions'
    'history'
    'environment'
    'completion'
)
for config_file in $custom; do
    source "$ZSH_CUSTOM/$config_file.zsh"
done
unset config_file

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
