#!/bin/bash

sudo apt install build-essential
sudo apt install --assume-yes git clang curl libssl-dev llvm libudev-dev make protobuf-compiler
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup default stable
rustup update
rustup update nightly
rustup target add wasm32-unknown-unknown --toolchain nightly
rustup default nightly-2023-01-01
rustup target add wasm32-unknown-unknown
cargo build --release
./target/release/lunes-node --dev
