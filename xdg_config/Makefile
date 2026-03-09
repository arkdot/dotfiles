.PHONY: all clean

STOW ?= PERL_BADLANG=0 stow
XDG_CONFIG_HOME ?= $(HOME)/.config

all: clean
	$(STOW) -t $(XDG_CONFIG_HOME) --ignore Makefile .

clean:
	$(STOW) -t $(XDG_CONFIG_HOME) -D .
