#!/usr/bin/env bash
set -euo pipefail

echo "==> Updating package lists"
sudo apt-get update

echo "==> Installing base development tools"
sudo apt-get install -y \
    git \
    curl \
    vim \
    fish \
    ripgrep \
    fd-find \
    jq \
    unzip \
    ca-certificates \
    build-essential

echo "==> Configuring SSH"
sudo systemctl enable --now ssh

echo "==> Configuring Avahi"
sudo systemctl enable --now avahi-daemon

echo "==> Setting default shell to fish"
if [[ "$SHELL" != */fish ]]; then
    sudo chsh -s "$(command -v fish)" "$USER"
fi

echo "==> Done"

