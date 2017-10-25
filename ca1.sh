#!/bin/bash
history
echo "Enter a Command"
echo "Type help to see all available commands"

while true;
do
        read -r cmd
        history -s "$cmd"
        echo "Enter New Command"
        case $cmd in
        help) echo "help - displays available commands"
        echo "pw | pwd -  Displays the working Directory"
        echo "ifc -  short for ifconfig. Displays Interface Configuration"
        echo "dt -  Displays the Date"
        echo "ud -  Displays the user information and inode"
        echo "hist - Displays command history"
        echo "stop -  Ends the shell script and logs the user out"
        echo "clear - Clears the screen";;
        pwd|pw* ) pwd;;
        ifconfig|ifc*) if [ "$cmd" == "ifc" ] ; then
                ifconfig | grep "eth0" -A 8;
        else
                ifconfig | grep ${cmd:4} -A 8;
        fi;;
        dt)  echo `python -c "from datetime import datetime; print datetime.utcnow().strftime('%Y%m%d%H%M%S')"` ;;
        ud) python UserD.py;;
        clear) clear
        echo "Enter a Command or use help for details";;
        hist) history ;;
        stop) echo "Stopped Shell Script" break;break;;
        *) echo "Please Ensure you enter a Command"
        esac
done
