# Check if TERM is supported; if not, set a default
if ! tput -T "$TERM" colors >/dev/null 2>&1; then
    export TERM=xterm-256color
    echo "Warning: TERM was set to an unsupported value. Using 'xterm' as fallback." >&2
fi

export XDG_CONFIG_HOME=$HOME/.config
source $XDG_CONFIG_HOME/shell/bash/.bash_profile
