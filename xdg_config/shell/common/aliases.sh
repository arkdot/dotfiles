# cd aliases.
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias doc="cd ~/Documents"
alias dev="cd ~/Projects/Development"

# Change owner.
alias my="sudo chown `id -u`:`id -g`"

# ls aliases.
if has_program "eza"; then
    alias ls="eza --color=auto --group-directories-first"
    alias ll="ls --long -g --icons=always"
    alias tree="ll --tree"
else
    alias ls="ls --color=auto --group-directories-first"
    alias ll="ls -lh"
fi
alias l="ll"
alias l1="ls -1"
alias la="ll -a"
alias lla="ll -a"

if [[ "Darwin" =~ `uname -s` ]]; then
    # OS X specific aliases.
    alias hidedt="defaults write com.apple.finder CreateDesktop false; killall Finder"
    alias showdt="defaults write com.apple.finder CreateDesktop true; killall Finder"
    alias umount="diskutil eject"
#else
    # Linux specific aliases.
fi

# du aliases
if has_program "ncdu"; then
    alias du="ncdu -x -r --exclude .git"
else
    alias du="du -h"
fi
alias du1="\du -h --max-depth=1"

# git aliases.
if has_program "git"; then
    alias g="git"
    alias gci="git commit"
    alias gcia="git commit -a"
    alias gcim="git commit -m"
    alias gciam="git commit -am"
    alias gst="git status -s"
    alias gamm="git commit --amend"
    alias gforgot="git commit -a --amend -C HEAD"
    alias gadd="git add"
    alias grm="git rm"
    alias gls="git ls"  # ls defined in $HOME/.gitconfig
    alias gl="git log --oneline"
    alias god="git opendiff"
    alias gpull="git pull"
    alias gpush="git push"
    alias ginit="git init"
    alias gclone="git clone"
    alias gco="git checkout"
    alias gmv="git mv"
    alias glog="git log"
fi

# vi aliases
if has_program "nvim"; then
    alias vi="nvim"
    alias vim="nvim"
fi

# Tmux aliases
if has_program "tmux"; then
    alias t="tmux"
    alias ts="tmux-sessionizer"
    alias tls="tmux list-sessions"
    alias tns="tmux new-session -t"
    alias tks="tmux kill-session -t"
    alias ta="tmux attach-session -t"
fi

# --
if has_program "bat"; then
    alias cat="bat --paging=never"
    alias less="bat --paging=always"
fi

# --
has_program "lazygit" && alias lg="lazygit"

# --
if has_program "rg"; then
    alias grep="rg"
else
    alias grep="grep --color"
    alias egrep="egrep --color"
fi

# --
if has_program "vmd"; then
    alias vmdtext="vmd -dispdev text"
    alias vmd="vmd -size 1000 1000 -nt"
fi

# Other aliases
alias rl="readlink -e"
alias rle="readlink -e"
