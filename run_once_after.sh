#!/bin/bash

# Install golang
rm -rf /usr/local/go
tar -C /usr/local -xzf ~/installers/golang.tar.gz

#Golang tools
go install github.com/go-delve/delve/cmd/dlv@latest
go install mvdan.cc/sh/v3/cmd/shfmt@latest

# install rust tools
cargo install stylua
cargo install fd
cargo install sylicon
cargo install --git https://github.com/neovide/neovide
cargo install prosemd-lsp
cargo install rusty-tags

# python version
pyenv install 3.10.5
pyenv install 3.9.9
pyenv install 3.8.9
pyenv global 3.10.5 3.9.9 3.8.9
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

# reload font cache
fc-cache -f

