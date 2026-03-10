export XDG_CACHE_HOME=$HOME/.cache

# Sets ZSH_CUSTOM to the path where my custom files and plugins are stored.
[[ -n "$ZSH_CUSTOM" ]] || ZSH_CUSTOM="$ZDOTDIR/custom"

# Sets ZSH_CACHE_DIR to the path where cache files should be created.
[[ -n "$ZSH_CACHE_DIR" ]] || ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

source $XDG_CONFIG_HOME/shell/common/commonrc.sh

# My plugins.
custom=(
    'history'
    'completion'
    'key-bindings'
)
for config_file in $custom; do
    source "$ZSH_CUSTOM/$config_file.zsh"
 
done
unset custom
unset config_file


# Initializes starship prompt.
if has_program "starship"; then
    export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
    eval "$(starship init zsh)"
else
    autoload -U colors && colors
    PS1="%F{blue}%n%f%F{cyan}@%f%F{magenta}%m%f %F{green}%~%f
%F{green}>%f "
fi

# Initializes fzf.
if has_program "fzf"; then
    source <(fzf --zsh)
fi

# Initializes zoxide (cd replacement).
if has_program "zoxide"; then
    eval "$(zoxide init zsh)"
fi

alias s='source $ZDOTDIR/.zshrc && echo "Sourced zshrc"'
