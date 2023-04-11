#!/bin/bash
# Tests
echo "Installing all apt packages"
sudo add-apt-repository ppa:yubico/stable
sudo add-apt-repository ppa:costamagnagianfranco/borgbackup
sudo apt update
sudo apt install -y borgbackup build-essential calcurse checkinstall chromium-browser clang clang-tidy cmake cmdtest curl delta dfu-util expat exuberant-ctags fcitx5-anthy fcitx5-mozc fonts-ipafont fzf gem gh gir1.2-appindicator3-0.1 git gnome-panel gnome-shell-extensions gnome-tweaks gobject-introspection gtk-chtheme htop ibus-mozc jq libasound2-dev libclang-dev libdbus-1-dev libdbusmenu-gtk3-dev libevdev-dev libexpat1-dev libffi-dev libfmt-dev libfreetype6-dev libgirepository1.0-dev libglib2.0-dev libgtk-3-dev libgtkmm-3.0-dev libinput-dev libjsoncpp-dev liblzma-dev libmpdclient-dev libnl-3-dev libnl-genl-3-dev libnotify-dev libopencv-dev libpango1.0-dev libpcsclite-dev libpipewire-0.3-dev libpulse-dev libreoffice libsecret-tools libsigc++-2.0-dev libspdlog-dev libssl-dev libudev-dev libwayland-dev libx11-dev libxcb-composite0-dev libxdg-basedir-dev libxinerama-dev libxkbregistry-dev libxml2-dev libxrandr-dev libxss-dev light linux-oem-22.04a locate lua5.4 luarocks make meson mkchromecast most nm-tray npm okular opencv-data pandoc pasystray pavucontrol pkg-config  qtwayland5 qtwayland5-dev-tools rbenv resolvconf rng-tools-debian rofi ruby-rubygems scdoc shellcheck sm sway swayidle swaylock texlive-extra-utils texlive-fonts-recommended texlive-latex-base texlive-latex-extra tig tk tk-dev traceroute unicode universal-ctags vim wcalc wev wl-clipboard wofi xdg-desktop-portal-wlr yubikey-manager yubikey-personalization-gui zsh libappindicator-dev libappindicator3-1 libncurses-dev libreadline-dev libsqlite3-dev tk-dev libbz2-dev gcc yubikey-manager-qt pcscd libreadline-dev libncursesw5-dev tk-dev libgdbm-dev libc6-dev libbz2-dev sway wl-clipboard krita openssl


echo "Installing out of repos debs"
sudo apt install -y ./debs/*.deb


sudo systemctl enable --now pcscd.service

# snap stuff
echo "Installing snap software"
#sudo snap install chromium
#sudo snap install glab
#sudo snap install krita
#sudo snap install slack
#sudo snap install telegram-desktop

# Install golang
echo "Installing golang globally"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf ~/installers/golang.tar.gz


# pyenv and python
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init - bash)"

for version in 3.11.3 3.10.5 3.8.9; do
    echo "Check if $HOME/.pyenv/version/$version exists"
    if [[ ! -d $HOME/.pyenv/versions/$version ]]; then
        pyenv install $version
    fi
done
pyenv global 3.11.3 3.10.5 3.9.9 3.8.9

# node env
export PATH="$HOME/.nodenv/bin:$PATH"
cd ~/.nodenv && src/configure && make -C src
eval "$(nodenv init - bash)"

node_versions="16.15.0"

for version in $node_versions; do
    if [[ ! -d $HOME/.nodenv/versions/$version ]]; then
        nodenv install $version
    fi
done
nodenv global $node_versions
