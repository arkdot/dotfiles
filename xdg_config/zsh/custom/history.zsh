# Sets-up history behavior.

# Store date and time in history
export HISTTIMEFORMAT="%d/%m/%y %T "

# History file configuration
HISTFILE="$HOME/.zsh_history"
HISTCONTROL=ignoredups:erasedups                   # no duplicate entries
HISTSIZE=100000                                    # big big history (default is 500)
HISTFILESIZE=$HISTSIZE                             # big big history
if type shopt &> /dev/null; then shopt -s histappend; fi  # append to history, don't overwrite it

# Save and reload the history after each command finishes
# The only downside with this is [up] on the readline will go over all history not just this bash session.
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data


autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search

alias history="fc -l 1"
