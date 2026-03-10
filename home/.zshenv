# .zshenv is always sourced.
# It is loaded before .zshrc

export XDG_CONFIG_HOME=$HOME/.config
export ZDOTDIR=$XDG_CONFIG_HOME/shell/zsh

# prevents .zcompdump to be created in ZDOTDIR
skip_global_compinit=1
