#!/bin/bash

# Define the list
options="Lock\nSuspend\nReboot\nShutdown"

# Use dmenu mode - Rofi closes as soon as a selection is made
choice=$(echo -e "$options" | rofi -dmenu -p "Power:")

case "$choice" in
    "󰌾 Lock") hyprlock ;;
    "󰤄 Suspend") systemctl suspend ;;
    " Reboot") systemctl reboot ;;
    "󰐥 Shutdown") systemctl poweroff ;;
esac
