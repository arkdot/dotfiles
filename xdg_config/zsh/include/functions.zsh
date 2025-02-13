append_path() {
    [[ "$PATH" != *"$1"* ]] && export PATH=$PATH:$1
}

prepend_path() {
    [[ "$PATH" != *"$1"* ]] && export PATH=$1:$PATH
}

setup_dircolors() {
    if dircolors > /dev/null 2>&1; then # dircolors installed
        eval $(dircolors -b $XDG_CONFIG_PERSONAL/dircolors)
    fi
}

# Move files/directories to trash.
trash() {
    [[ $# -lt 1 ]] && echo "usage: trash SOURCE..." && return

    [[ -n $TRASH ]] && TRASH=$TRASH
    [[ -z $TRASH ]] && [[ -d $HOME/.Trash ]] && TRASH=$HOME/.Trash
    [[ -z $TRASH ]] && [[ -d $HOME/.local/share/Trash ]] && TRASH=$HOME/.local/share/Trash

    # No trash found: create one.
    [[ -z $TRASH ]] && TRASH=$HOME/.Trash && mkdir $TRASH

    mv -b $* $TRASH    
}

# Base function to create a tarball from a directory.
# Args:
#     - source
#     - compress
__mktar() {
    local src=$1
    local compress=$2
    local bname=$(basename $src)
    local tarname="$bname.tar"
    local taropts="cvf"

    [[ $compress = true ]] && taropts="cvzf" && tarname="$tarname.gz"
    COPYFILE_DISABLE=1 tar $taropts $tarname -C $(dirname $src) $bname
}

# Create a tarball of a directory.
mktar() {
    [[ $# -ne 1 ]] && echo "usage: mktar SOURCE" && return 1
    __mktar $1 false
}

# Create a gzipped tarball of a directory.
mktarz() {
    [[ $# -ne 1 ]] && echo "usage: mktarz SOURCE" && return 1
    __mktar $1 true
}

# Create a directory which name is prefixed by the date.
mkdate() {
    [[ $# -ne 1 ]] && echo "usage: mkdate SUFFIX" && return 1
    local thedate=`date +%y%m%d`
    echo "${thedate}_$1"
    mkdir ${thedate}_$1
}

