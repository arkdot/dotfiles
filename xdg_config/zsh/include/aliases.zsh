alias s='source $ZDOTDIR/.zshrc && echo "Sourced zshrc"'

# cd aliases.
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias doc="cd ~/Documents"
alias dev="cd ~/Projects/Development"

# Get the full path of a file.
alias rle="readlink -e"

# Change owner.
alias my="sudo chown `id -u`:`id -g`"

# ls aliases.
alias ls="eza --color=always --group-directories-first"
alias l1="ls -1"
alias ll="ls --long -g --icons=always"
alias l="ll"
alias la="ll -a"

# When using tree, group directories first
alias tree="ll --tree"

# grep aliases.
alias grep="grep --color"
alias egrep="egrep --color"

# Application aliases.
alias vmdtext="vmd -dispdev text"
alias vmd="vmd -size 1000 1000 -nt"

# OS X specific aliases.
if [[ "Darwin" =~ `uname -s` ]]; then
    alias hidedt="defaults write com.apple.finder CreateDesktop false; killall Finder"
    alias showdt="defaults write com.apple.finder CreateDesktop true; killall Finder"
    alias umount="diskutil eject"
    alias du="ncdu -x --color dark --exclude .git"
# Linux specific aliases.
else
    alias du="ncdu -x -r --exclude .git"
    alias du1="\du -h --max-depth=1"
fi


# zsh specific aliases.
if [[ -n "$ZSH_VERSION" ]]; then
    alias zshconfig="$EDITOR ~/.zshrc"

# Any other terminal than zsh aliases.
else
    alias bashconfig="$EDITOR ~/.bashrc"
fi

# git aliases.
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

# vi aliases
alias vi="nvim"
alias vim="nvim"

# Other aliases
alias rl="readlink -e"
alias cat="bat --paging=never"
alias less="bat --paging=always"
alias lg="lazygit"
alias grep="rg"

# Tmux aliases
alias t="tmux"
alias ts="tmux-sessionizer"
alias tls="tmux list-sessions"
alias tns="tmux new-session -t"
alias tks="tmux kill-session -t"
alias ta="tmux attach-session -t"
