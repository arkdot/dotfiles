.PHONY: home xdg_config

home:
	make -C home

xdg_config:
	make -C xdg_config


clean:
	make -C home clean
	make -C xdg_config clean
