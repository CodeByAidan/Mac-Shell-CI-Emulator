#!/bin/bash

# Test function
test_func() {
    line="$1"
    expected_output="$2"

    output="$line"

    # rename
    output=$(echo "$output" | sed 's/rust/crab/g')
    output=$(echo "$output" | sed 's/Rust/Crab/g')
    output=$(echo "$output" | sed 's/RUST/CRAB/g')
    output=$(echo "$output" | sed 's/cargo/crabgo/g')
    output=$(echo "$output" | sed 's/Cargo/Crabgo/g')
    output=$(echo "$output" | sed 's/CARGO/CRABGO/g')
    output=$(echo "$output" | sed 's/clippy/pinchy/g')

    # clean up
    output=$(echo "$output" | sed 's/\.crabgo/\.cargo/g')
    output=$(echo "$output" | sed 's/Crabgo\.toml/Cargo\.toml/g')
    output=$(echo "$output" | sed 's/Crabgo\.lock/Cargo\.lock/g')
    output=$(echo "$output" | sed 's/crabgo\.toml/cargo\.toml/g')
    output=$(echo "$output" | sed 's/\.crabup/\.rustup/g')

    if [ "$output" == "$expected_output" ]; then
        echo "Test passed"
    else
        echo "Test failed: expected $expected_output, got $output"
    fi
}

# Run tests
test_func "rust cargo Rust Cargo RUST CARGO clippy .crabgo Crabgo.toml Crabgo.lock crabgo.toml .crabup" "crab crabgo Crab Crabgo CRAB CRABGO pinchy .cargo Cargo.toml Cargo.lock cargo.toml .rustup"
