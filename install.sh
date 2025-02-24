set -e

git clone --recurse-submodules https://github.com/arkdot/dotfiles && \
    cd dotfiles && \
    make
