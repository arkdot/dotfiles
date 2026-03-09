export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# Sets ZSH_CUSTOM to the path where my custom files and plugins are stored.
[[ -n "$ZSH_CUSTOM" ]] || ZSH_CUSTOM="$XDG_CONFIG_HOME/zsh/custom"

# Sets ZSH_CACHE_DIR to the path where cache files should be created.
[[ -n "$ZSH_CACHE_DIR" ]] || ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

source $XDG_CONFIG_HOME/shell/common/commonrc.sh

# My plugins.
custom=(
    'aliases'
    'history'
    'environment'
    'completion'
    'key-bindings'
)
for config_file in $custom; do
    source "$ZSH_CUSTOM/$config_file.zsh"
done
unset custom
unset config_file


# Loads $HOME/.extra if it exists.
[[ -e $HOME/.extra ]] && source $HOME/.extra

# Initializes starship prompt.
if has_program "starship"; then
    export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
    eval "$(starship init zsh)"
else
    if [ -n "$BASH_VERSION" ]; then
        export PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\u\[$(tput setaf 6)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 2)\]\w\[$(tput setaf 1)\]\[$(tput sgr0)\]\n\[$(tput setaf 2)\]>\[$(tput sgr0)\]"
    else
        autoload -U colors && colors
        PS1="%F{blue}%n%f%F{cyan}@%f%F{magenta}%m%f %F{green}%~%f
%F{green}>%f "
    fi
fi

# Initializes fzf.
if has_program "fzf"; then
    source <(fzf --zsh)
fi

# Initializes zoxide (cd replacement).
if has_program "zoxide"; then
    eval "$(zoxide init zsh)"
fi
