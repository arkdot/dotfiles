.PHONY: all clean

STOW ?= PERL_BADLANG=0 stow

all: clean
	$(STOW) -t $(HOME) --ignore Makefile .

clean:
	$(STOW) -t $(HOME) -D .
