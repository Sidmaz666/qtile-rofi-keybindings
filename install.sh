#!/bin/bash
echo "Installing...."
sudo cp qtile_kb_rofi.sh /usr/bin/qtile_kb_rofi
sudo ln -s /usr/bin/qtile_kb_rofi /usr/bin/qkb
echo -e "Installed...!\nLaunching Qtile Keybinding Rofi Helper"
echo "Run the command qkb or qtile_kb_rofi to Launch!"
