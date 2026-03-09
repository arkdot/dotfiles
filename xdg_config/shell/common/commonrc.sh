COMMON_SHELL_CUSTOM="$XDG_CONFIG_HOME/shell/common"

common_custom=(
    'functions'
    'environment'
    'aliases'
)

for config_file in $common_custom; do
    source "$COMMON_SHELL_CUSTOM/$config_file.sh"
done
unset common_custom
unset config_file

# Loads $HOME/.extra if it exists.
[[ -e $HOME/.extra ]] && source $HOME/.extra
