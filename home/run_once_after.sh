#!/bin/bash

#Golang tools
go install github.com/go-delve/delve/cmd/dlv@latest
go install mvdan.cc/sh/v3/cmd/shfmt@latest

source $HOME/.cargo/env

# install rust tools
cargo install stylua
cargo install fd
cargo install sylicon
cargo install --git https://github.com/neovide/neovide
cargo install prosemd-lsp
cargo install rusty-tags

# python tools
pip install bandit
pip install coverage
pip install isort
pip install black
pip install mypy
pip install flake8
pip install poetry
pip install pre-commit
pip install pytest
pip install cookiecutter
pip install setuptools
pip install vint


# npm install
npm install -g @fsouza/prettierd
npm install -g markdownlint-cli

# reload font cache
fc-cache -f

# nix
if [[ ! -d /nix ]]; then
    sh <(curl -L https://nixos.org/nix/install) --daemon
fi

# Nix Packages
nix-env -i bat
nix-env -i nixpkgs.glow

sudo update-alternatives --install /usr/bin/lvim vim /home/kurojishi/.local/bin/lvim 1
sudo update-alternatives --install /usr/bin/vim vim /home/kurojishi/.local/bin/lvim 1
sudo update-alternatives --config vim
