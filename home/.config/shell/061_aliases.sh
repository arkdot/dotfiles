# cd aliases.
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias doc="cd ~/Documents"

# Change owner.
alias my="sudo chown `id -u`:`id -g`"

# == ls aliases ======================================================================
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -lh"
alias l="ll"
alias l1="ls -1"
alias la="ll -a"
alias lla="ll -a"

# == du aliases ======================================================================
if has_command "dust"; then
    alias du="dust"
    alias du1="du --depth=1"
else
    alias du="du -h"
    alias du1="du --max-depth=1"
fi


alias grep="grep --color"
alias egrep="egrep --color"

# Other aliases
alias rle="readlink -e"
