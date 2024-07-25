#!/bin/bash

apagar=" Shutdown"
reiniciar=" Restart"
suspender=" Suspend"
salvapantallas="Savescreen"
bloquear=" Block"
logout=" Log Out"

OPTIONS="${apagar}\n${reiniciar}\n${suspender}\n${salvapantallas}\n${bloquear}\n${logout}"
ans=$(echo -e "${OPTIONS}" | rofi -p "Choose:" -dmenu)
rs=$?
if [ $rs -eq 0 ]
then
    case "$ans" in
        "$apagar")
            systemctl poweroff
            ;;
        "$reiniciar")
            systemctl reboot
            ;;
        "$suspender")
            systemctl suspend
            ;;
        "$salvapantallas")
			betterlockscreen
            ;;
        "$bloquear")
			betterlockscreen -l
            ;;
        "$logout")
            bspc quit
            ;;
    esac
fi
