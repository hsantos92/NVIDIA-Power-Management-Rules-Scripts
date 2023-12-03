#!/bin/bash

CONF_FILE="/etc/modprobe.d/nvidia-pm.conf"
CONF_CONTENT="options nvidia \"NVreg_DynamicPowerManagement=0x02\""

apply_config() {
    echo "$CONF_CONTENT" > "$CONF_FILE"
    echo "Configuration applied."
}

undo_config() {
    rm "$CONF_FILE"
    echo "Configuration removed."
}

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

while true; do
    echo "NVIDIA Dynamic Power Management Configuration Script"
    echo "1. Apply Configuration"
    echo "2. Undo Configuration"
    echo "3. Exit"
    read -p "Enter choice: " choice
    case $choice in
        1) apply_config ;;
        2) undo_config ;;
        3) exit 0 ;;
        *) echo "Invalid option. Please enter 1, 2, or 3." ;;
    esac
done

