export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# Sets ZSH_CUSTOM to the path where my custom files and plugins are stored.
[[ -n "$ZSH_CUSTOM" ]] || ZSH_CUSTOM="$XDG_CONFIG_HOME/zsh/custom"

# Sets ZSH_CACHE_DIR to the path where cache files should be created.
[[ -n "$ZSH_CACHE_DIR" ]] || ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

# ===========================================================================
# ZSH completion configuration

# Creates cache and completion directories and add to $fpath.
mkdir -p $ZSH_CACHE_DIR/completions
fpath=($ZSH_CACHE_DIR/completions $fpath)

# Loads and configures completion system.
autoload -U compaudit compinit zrecompile

# Shamelessly borrowed from Prezto. Regenerates the completion cache approximately daily.
_comp_files=($XDG_CACHE_HOME/zsh/zcompcache(Nm-20))
if (( $#_comp_files )); then
    compinit -i -C -d "$XDG_CACHE_HOME/zsh/zcompcache"
else
    compinit -i -d "$XDG_CACHE_HOME/zsh/zcompcache"
fi
unset _comp_files


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

# Restores Ctrl/A and Ctrl/E to move to the beginning and end of the line.
bindkey -e

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
