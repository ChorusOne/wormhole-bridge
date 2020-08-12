.PHONY : all config build run clean
.DEFAULT_GOAL := all

config:
	mkdir data
	docker-compose run gaia gaiad init --chain-id=wormhole node || true
	cp configs/qt.json data/config.json
	cp configs/genesis.json data/.gaiad/config/
	cp configs/priv_validator_key.json data/.gaiad/config/
	cp configs/config.toml data/.gaiad/config/

build:
	docker-compose build

all: build clean config run

clean:
	rm -rf data

run:
	docker-compose up
