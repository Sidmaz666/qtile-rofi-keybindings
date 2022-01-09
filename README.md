# Qtile-rofi-keybindings
### Show Qtile Keybindings in Rofi Run Launcher
![preview](https://raw.githubusercontent.com/Sidmaz666/qtile-rofi-keybindings/main/preview.gif)
#    
         Qtile Keybinding Rofi Script [USAGE]
         --config,-c 	qtile Keybinding config file
         		By default -c source the config.py file from $HOME/.config/qtile/config.py	
         -h,--help 	Help Menu [USAGE]
         Example:
         
         qkb                   Load KB From Deafault Qtile config file.
         qtile_kb_rofi -c 
         qkb -c
         
         qtile_kb_rofi -c ~/.config/qtile/settings/keys.py 	Load Custom KB
         qkb --config ~/mydotfiles/qtile/kb.py
         
         qtile_kb_rofi -h 	For Help
         qkb --help
