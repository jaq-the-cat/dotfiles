#!/bin/sh

cp $HOME/.oh-my-zsh .oh-my-zsh -r
cp .config/kitty/kitty-themes kitty/kitty-themes -r
git add *
git commit
