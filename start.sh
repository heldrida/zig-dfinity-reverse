#!/usr/bin/env bash
set -e
zig build-lib reverse.zig -target wasm32-freestanding -static
dfx canister create reverse
mkdir -p .dfx/local/canisters/reverse/
cp reverse.wasm .dfx/local/canisters/reverse/reverse.wasm
dfx canister install --all
dfx canister call reverse go '("hello")'