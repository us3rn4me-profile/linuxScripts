#!/usr/bin/env bash
# Отвечайте на вопросы 1 (да) или 0 (нет)
echo "Отвечайте на вопросы 1 (да) или 0 (нет)"
install="sudo pacman -Sy --noconfirm"
echo Установить ли следующее ПО?
products=(vim neovim zsh npm pacman-contrib nano code fzf firefox ark cmake cmus curl flatpak gcc gzip htop libreoffice-fresh-ru neofetch make okular ranger ttf-hack ttf-dejavu ttr-lato ttf-jetbrains-mono ttf-opensans xclip zathura zip vlc kate tlp kitty speedcrunch)
selected=(vi)
for i in "${products[@]}"; do
  echo "$i?"
  read ans
  if [[ $ans == "1" ]]; then
    selected+=" $i"
  fi
done
$(echo $install $selected)
