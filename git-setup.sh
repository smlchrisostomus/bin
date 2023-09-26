#!/bin/bash

git config --global user.name "Stefan Chrisostomus"
git config --global user.email "yourname@example.com"

git config --global init.defaultBranch main
git config --global color.ui auto
git config --global pull.rebase false

ssh-keygen -t ed25519 -C smlchrisostomus@gmail.com
cat ~/.ssh/id_ed25519.pub