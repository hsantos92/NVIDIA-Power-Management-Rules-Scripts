#!/bin/bash

SERVICE_NAME="nvidia-persistenced.service"

start_service() {
    systemctl start "$SERVICE_NAME"
    echo "Service started."
}

stop_service() {
    systemctl stop "$SERVICE_NAME"
    echo "Service stopped."
}

enable_service() {
    systemctl enable "$SERVICE_NAME"
    echo "Service enabled to start on boot."
}

disable_service() {
    systemctl disable "$SERVICE_NAME"
    echo "Service disabled from starting on boot."
}

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

while true; do
    echo "NVIDIA Persistence Daemon Management Script"
    echo "1. Start Service"
    echo "2. Stop Service"
    echo "3. Enable Service"
    echo "4. Disable Service"
    echo "5. Exit"
    read -p "Enter choice: " choice
    case $choice in
        1) start_service ;;
        2) stop_service ;;
        3) enable_service ;;
        4) disable_service ;;
        5) exit 0 ;;
        *) echo "Invalid option. Please enter a number between 1 and 5." ;;
    esac
done

