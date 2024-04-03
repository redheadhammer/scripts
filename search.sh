#!/bin/bash
# I have no idea for what purpose i created this script and apparently it is not complete either :) Typical me

fe() {
local files
  IFS=$'\n' 
  files=($(alacritty -e fzf-tmux --query="$1" --multi --select-1 --exit-0))
  printf "Files are: $files"
  EDITOR=$(echo -e 'nvim\nokular' | rofi -config $HOME/.config/rofi/launcher/style.rasi -dmenu -i -p "[ Computer ] : " -hide-scrollbar -tokenize -lines 4 -eh 1 -width 40 -location 8 -xoffset 500 -yoffset 70 -padding 30 -disable-history -font "SourceCodePro 18")

  [[ -n "$files" ]] && $EDITOR "${files[@]}"
}

fe

#  EDITOR=$(echo -e 'nvim\nokular' | rofi -config $HOME/.config/rofi/launcher/style.rasi -dmenu -i -p "[ Computer ] : " -hide-scrollbar -tokenize -lines 4 -eh 1 -width 40 -location 8 -xoffset 500 -yoffset 70 -padding 30 -disable-history -font "SourceCodePro 18")

