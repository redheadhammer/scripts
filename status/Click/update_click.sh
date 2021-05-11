#!/bin/bash

TOTPKG=$(pacman -Qe | wc -l)
MAINREPO=$(pacman -Qen | wc -l)
AURPKGS=$(pacman -Qem | wc -l)

notify-send "Package Managment" "Total:$TOTPKG\n Main-Repo:$MAINREPO\n Aur-Packages:$AURPKGS"

