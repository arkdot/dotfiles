COMMON_SHELL_CUSTOM="$XDG_CONFIG_HOME/shell/common"

common_custom=(
    'functions'
)

for config_file in $common_custom; do

    echo "sourcing $COMMON_SHELL_CUSTOM/$config_file.sh"
    source "$COMMON_SHELL_CUSTOM/$config_file.sh"
done
unset common_custom
unset config_file
