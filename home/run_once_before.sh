#!/bin/bash

# install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "BEFORE"
