export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

# Sets BASH_CUSTOM to the path where my custom files and plugins are stored.
[[ -n "$BASH_CUSTOM" ]] || ZSH_CUSTOM="$XDG_CONFIG_HOME/shell/bash/custom"

source $XDG_CONFIG_HOME/shell/common/commonrc.sh

# My plugins.
custom=(
)
for config_file in $custom; do
    source "$BASH_CUSTOM/$config_file.bash"
done
unset custom
unset config_file


# Initializes starship prompt.
if has_program "starship"; then
    export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
    eval "$(starship init zsh)"
else
    export PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\u\[$(tput setaf 6)\]@\[$(tput setaf 5)\]\h \[$(tput setaf 2)\]\w\[$(tput setaf 1)\]\[$(tput sgr0)\]\n\[$(tput setaf 2)\]>\[$(tput sgr0)\] "
fi

# Initializes fzf.
if has_program "fzf"; then
    source <(fzf --bash)
fi

# Initializes zoxide (cd replacement).
if has_program "zoxide"; then
    eval "$(zoxide init bash)"
fi

alias s='source $XDG_CONFIG_HOME/shell/bash/.bash_profile && echo "Sourced bash_profile"'
