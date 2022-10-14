#!/bin/bash

cd "$HOME/src/Waybar"

meson build
ninja -C build
sudo ninja -C build install
