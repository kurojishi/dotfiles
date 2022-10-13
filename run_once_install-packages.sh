#!/bin/sh
echo 'deb http://download.opensuse.org/repositories/graphics:/darktable/xUbuntu_22.04/ /' | sudo tee /etc/apt/sources.list.d/graphics:darktable.listcurl -fsSL https://download.opensuse.org/repositories/graphics:darktable/xUbuntu_22.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/graphics_darktable.gpg > /dev/null
sudo add-apt-repository ppa:mozillateam/ppa
sudo apt update
sudo apt install borgbackup build-essential calcurse checkinstall chromium-browser clang clang-tidy cmake cmdtest curl darktable delta dfu-util dunst expat exuberant-ctags fcitx5-anthy fcitx5-mozc firefox fonts-ipafont fzf gem gh gir1.2-appindicator3-0.1 git git-delta gnome-panel gnome-shell-extensions gnome-tweaks gobject-introspection gopass gopass-jsonapi gtk-chtheme htop i3status ibus-mozc jq libasound2-dev libbz2-dev libclang-dev libdbus-1-dev libdbusmenu-gtk3-dev libevdev-dev libexpat1-dev libffi-dev libfmt-dev libfreetype6-dev libgirepository1.0-dev libglib2.0-dev libgtk-3-dev libgtkmm-3.0-dev libinput-dev libjsoncpp-dev liblzma-dev libmpdclient-dev libnl-3-dev libnl-genl-3-dev libnotify-dev libopencv-dev libpango1.0-dev libpcsclite-dev libpipewire-0.3-dev libpulse-dev libreoffice libsecret-tools libsigc++-2.0-dev libspdlog-dev libssl-dev libudev-dev libwayland-dev libx11-dev libxcb-composite0-dev libxdg-basedir-dev libxinerama-dev libxkbregistry-dev libxml2-dev libxrandr-dev libxss-dev light linux-oem-22.04a locate lua5.4 luarocks make meson mkchromecast most neovim nm-tray npm okular opencv-data pandoc pasystray pavucontrol pkg-config protonvpn protonvpn-stable-release qtwayland5 qtwayland5-dev-tools rbenv resolvconf rng-tools-debian rofi ruby-rubygems scdoc shellcheck sm steam-installer sway swayidle swaylock terminator texlive-extra-utils texlive-fonts-recommended texlive-latex-base texlive-latex-extra tig tk tk-dev traceroute transmission ulauncher unicode universal-ctags vim vlc wcalc wev wl-clipboard wofi xdg-desktop-portal-wlr yubikey-manager yubikey-personalization-gui zoom zsh

# nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# snap stuff
sudo snap install chromium glab krita slack telegram-desktop
