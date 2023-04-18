#!/bin/bash

sudo apt install meson pixmap libpng-dev libjpeg-dev
cd "$HOME/src/grim"
meson build
ninja -C build
sudo ninja -C build install
sudo apt install libxkbcommon-dev libcairo2-dev scdoc
cd "$HOME/src/slurp"
meson build
ninja -C build
sudo ninja -C build install
