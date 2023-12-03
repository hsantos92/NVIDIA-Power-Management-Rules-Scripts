#!/bin/bash

RULES_FILE="/etc/udev/rules.d/80-nvidia-pm.rules"
RULES_CONTENT="# Enable runtime PM for NVIDIA VGA/3D controller devices on driver bind
ACTION==\"bind\", SUBSYSTEM==\"pci\", ATTR{vendor}==\"0x10de\", ATTR{class}==\"0x030000\", TEST==\"power/control\", ATTR{power/control}=\"auto\"
ACTION==\"bind\", SUBSYSTEM==\"pci\", ATTR{vendor}==\"0x10de\", ATTR{class}==\"0x030200\", TEST==\"power/control\", ATTR{power/control}=\"auto\"

# Disable runtime PM for NVIDIA VGA/3D controller devices on driver unbind
ACTION==\"unbind\", SUBSYSTEM==\"pci\", ATTR{vendor}==\"0x10de\", ATTR{class}==\"0x030000\", TEST==\"power/control\", ATTR{power/control}=\"on\"
ACTION==\"unbind\", SUBSYSTEM==\"pci\", ATTR{vendor}==\"0x10de\", ATTR{class}==\"0x030200\", TEST==\"power/control\", ATTR{power/control}=\"on\""

apply_rules() {
    echo "$RULES_CONTENT" > "$RULES_FILE"
    udevadm control --reload
    echo "Rules applied and udev reloaded."
}

undo_rules() {
    rm "$RULES_FILE"
    udevadm control --reload
    echo "Rules removed and udev reloaded."
}

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

while true; do
    echo "NVIDIA Power Management Rules Script"
    echo "1. Apply Rules"
    echo "2. Undo Rules"
    echo "3. Exit"
    read -p "Enter choice: " choice
    case $choice in
        1) apply_rules ;;
        2) undo_rules ;;
        3) exit 0 ;;
        *) echo "Invalid option. Please enter 1, 2, or 3." ;;
    esac
done

