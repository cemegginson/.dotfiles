#!/bin/bash

# Copy configs
cp configs/gitconfig ~/.gitconfig
cp configs/vimrc ~/.vimrc
cp configs/yaourtrc ~/.yaourtrc
cp configs/zshrc ~/.zshrc
sudo cp configs/zshrc /root/.zshrc

# Copy zsh theme
sudo cp configs/caseymegginson.zsh-theme /usr/share/oh-my-zsh/themes/
