.PHONY : all config build run clean test_live test_simulated_substrate test_simulated_cosmos test_faulty_simulated_substrate test_faulty_simulated_cosmos
.DEFAULT_GOAL := all

config:
	mkdir -p data/.gaiacli
	docker-compose run gaia gaiad init --home "/home/gaia/.gaiad" --chain-id=wormhole node || true
	cp configs/keyring-test data/.gaiacli/keyring-test -R
	cp configs/live_config.json data/live_config.json
	cp configs/faulty* data/
	cp configs/simulated* data/
	cp configs/genesis.json data/.gaiad/config/
	cp configs/priv_validator_key.json data/.gaiad/config/
	cp configs/config.toml data/.gaiad/config/

build:
	docker-compose build

all: | build clean config run

clean:
	docker-compose down
	rm -rf data

run:
	docker-compose up

test_live: | clean config
	docker-compose up --exit-code-from qt

test_simulated_substrate: | clean config
	TEST_MODE=simulated_substrate docker-compose up --exit-code-from qt

test_simulated_cosmos: | clean config
	TEST_MODE=simulated_cosmos docker-compose up --exit-code-from qt

test_faulty_simulated_substrate: | clean config
	TEST_MODE=faulty_simulated_substrate docker-compose up --exit-code-from qt

test_faulty_simulated_cosmos: | clean config
	TEST_MODE=faulty_simulated_cosmos docker-compose up --exit-code-from qt

