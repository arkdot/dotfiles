.PHONY: all clean

XDG_CONFIG_HOME ?= $(HOME)/.config

all: clean
	stow -t $(XDG_CONFIG_HOME) --ignore Makefile -v .

clean:
	stow -t $(XDG_CONFIG_HOME) -v -D .
