#!/bin/sh

# install lvim
LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# nix
sh <(curl -L https://nixos.org/nix/install) --daemon

