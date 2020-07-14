# Wormhole: A Cosmos-Substrate bridge

## What is Wormhole?

Wormhole is a bridge to connect a Substrate-based blockchain to a Cosmos-SDK based blockchain. It is based around a 

## Parts

The Wormhole bridge, comprises three parts:
  - A fork of Gaia, with an additional module to allow execution of wasm-based light clients.
  - Wormhole, a Substrate-based chain, including a tendermint-client pallet.
  - Quantum-tunnel, a simple relayer, written in rust.

## Demo

In order to run the demo, clone this repository, and run `docker-compose up`.


## Credit and Attribution

Substrate - Web3 Foundation, Parity
Cosmos-SDK - All in Bits, Tendermint Inc., Interchain.io, Interchain Foundation
Cosmwasm - Confio, Ethan Frey and Simon Warta
Tendermint-rs - Informal Systems
Concept of Wasm-based light client - Zaki Manian, Iqclusion


