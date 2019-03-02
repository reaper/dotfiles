#!/bin/sh

mkdir -p ~/.config/systemd/user
cp terminator.service ~/.config/systemd/user/
systemctl --user enable terminator
