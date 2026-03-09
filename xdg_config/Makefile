.PHONY: all clean

STOW ?= PERL_BADLANG=0 stow
XDG_CONFIG_HOME ?= $(HOME)/.config

all: $(XDG_CONFIG_HOME) clean
	$(STOW) -t $(XDG_CONFIG_HOME) --ignore Makefile .

$(XDG_CONFIG_HOME):
	mkdir -p $(XDG_CONFIG_HOME)

clean:
	$(STOW) -t $(XDG_CONFIG_HOME) -D .
