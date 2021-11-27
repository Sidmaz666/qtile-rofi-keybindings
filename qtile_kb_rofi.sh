#!/bin/bash
usage(){
while IFS= read line; do
	printf "%s\n" "$line"
done<<-EOF
Qtile Keybinding Rofi Script [USAGE]
--config,-c 	qtile Keybinding config file
		By default -c source the config.py file from $HOME/.config/qtile/config.py	
-h,--help 	Help Menu [USAGE]
Example:

./qtile_kb_rofi.sh -c 	Load KB From Deafault Qtile config file.

./qtile_kb_rofi -c ~/.config/qtile/settings/keys.py 	Load Custom KB

./qtile_kb_rofi -h 	For Help
EOF
}
mod="$(echo "ModKey  mod4:Super:WindowsKey")"
call(){
$source | grep 'Key' | tail -n +2| \
       	sed -e 's/^[ \t]*//' | \
       	sed -e 's/",/\t: /g' \
       	-e 's/"/ + /g' \
       	-e 's/),//g' \
       	-e 's/,//g' \
       	-e 's/Key//g' \
       	-e 's/[()]//g' \
       	-e 's/  //g' \
       	-e 's/lazy.spawn +//g' \
       	-e 's/lazy.spawn+//g' \
       	-e 's/lazy.spawn//g' \
       	-e 's/lazy.layout/ Window/g' \
       	-e 's/desc= + / : /g' \
       	-e 's/lazy./ /g' \
       	-e 's/ + control + ]+ s/control + s/g' \
       	-e 's/\[//g' \
       	-e 's/\]//g' \
       	-e 's/ + + / + /g' -e 's/ +  + / + /g' \
       	-e 's/mod+/mod +/g' -e 's/ +   + / +/g' \
       	-e 's/modcontrol/mod + control/g' -e 's/ +//g' \
       	-e 's/mod/mod + /g' -e 's/shift/shift + /g' \
       	-e 's/control/control +/g' -e 's/ //g' -e 's/\t/ /g' \
       	-e 's/:/:\t/g' | tr -d \' \
       	| sed -e 's/:\t/  /g' \
	| sed 's/[a-z]/\U&/g' \
	| sed -e 's/KEYS.APPEND//g' \
	-e 's/.DROP/   DROP/g' \
	-e 's/GROUP/   GROUP/g' \
	-e 's/TOGGLE/TOGGLE   /g ' \
	-e 's/GROUP/GROUP /g' \
	-e 's/\#//g' \
	-e 's/.TO / TO /g' \
	-e 's/[A-Z]/\L&/g' \
	-e 's/\b\(.\)/\u\1/g' \
	-e 's/Mod/Super/g' \
	-e 's/window/ Window /g' \
       	| rofi -dmenu -theme gruvbox-dark -p " $mod"
}
[[ $# -eq 0 ]] &&
	usage && exit ||
	case "$1" in
		--help | -h )
			usage && exit;
			;;
		-c |--config )
	if [[ ! -z "$2" ]]; then
	       	 source="cat $2 $3" && call && exit 
	 else
		souce="cat $HOME/.config/qtile/config.py" &&
	       	call && exit;
	fi
				;;
			* )
				usage && exit;
				;;
		esac
		shift
