setopt hist_expire_dups_first  # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_find_no_dups       # when searching history don't show results already cycled through twice
setopt hist_ignore_dups        # do not write events to history that are duplicates of previous events
setopt hist_ignore_all_dups    # delete old recorded event if new event is a duplicate
setopt hist_save_no_dups       # if a new command is a duplicate of the previous command, don't save it
setopt hist_ignore_space       # remove command line from history list when first character is a space
setopt hist_reduce_blanks      # remove superfluous blanks from history items
setopt hist_verify             # show command with history expansion to user before running it
setopt histignorespace         # remove commands from the history when the first character is a space
setopt inc_append_history      # save history entries as soon as they are entered
setopt share_history           # share history between different instances of the shell

mkdir -p "${XDG_STATE_HOME}/zsh"
HISTFILE="${XDG_STATE_HOME}/zsh/history"
HISTSIZE=100000
SAVEHIST=${HISTSIZE}
