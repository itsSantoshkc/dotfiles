#!/bin/bash

if [ -z "$1" ]; then
    # No arguments: show the initial list
    echo "Check Battery"
    echo "Toggle WiFi"
    echo "Update System"
else
    # Argument received: perform the action
    case "$1" in
        "Check Battery") notify-send "Battery" "$(acpi -b)" ;;
        "Toggle WiFi") nmcli radio wifi off ;;
        "Update System") alacritty -e sudo pacman -Syu ;;
    esac
fi
