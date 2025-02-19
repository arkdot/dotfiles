# Sets-up history behavior.

# Store date and time in history
export HISTTIMEFORMAT="%d/%m/%y %T "

# keep history up to date, across sessions, in realtime
#  http://unix.stackexchange.com/a/48113
export HISTFILE=$HOME/.zsh_history
export HISTCONTROL=ignoredups:erasedups                   # no duplicate entries
export HISTSIZE=100000                                    # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE                             # big big history
if type shopt &> /dev/null; then shopt -s histappend; fi  # append to history, don't overwrite it

# Save and reload the history after each command finishes
# The only downside with this is [up] on the readline will go over all history not just this bash session.
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

