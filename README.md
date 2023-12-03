# NVIDIA Management Scripts for Arch Linux

## Overview
This repository contains a collection of shell scripts designed for Arch Linux users to manage various aspects of NVIDIA graphics card settings and services. These scripts are particularly useful for those looking to easily switch power management settings and control the `nvidia-persistenced` service.

### Scripts Included
1. **NVIDIA Power Management Rules Script** (`nvidia_pm_rules.sh`): Manages power management rules for NVIDIA GPUs.
2. **NVIDIA Dynamic Power Management Configuration Script** (`nvidia_pm_config.sh`): Creates or removes a configuration file for NVIDIA's dynamic power management.
3. **NVIDIA Persistence Daemon Management Script** (`manage_nvidia_service.sh`): Controls the `nvidia-persistenced.service` to enable or disable automatic startup at boot and start or stop the service.

## Prerequisites
- An Arch Linux system
- NVIDIA GPU and drivers installed
- Root permissions for executing the scripts

## Usage
Each script in this repository is standalone and performs a specific function related to NVIDIA GPU management.

### General Steps
1. Clone the repository or download the desired script.
2. Make the script executable: `chmod +x script_name.sh`
3. Run the script with root privileges: `sudo ./script_name.sh`
4. Follow the on-screen prompts to perform the desired actions.

### Script-Specific Instructions
Refer to the top of each script for detailed instructions on what it does and how to use it.

## Warning
These scripts directly interact with system files and services. It is recommended to understand their functionality and impact before running them. Always backup your system or relevant configuration files before making changes.

## Contributions
Contributions to this repository are welcome. Please ensure that any pull requests or issues are relevant to the NVIDIA management scripts and Arch Linux system configurations.

---

This repository is provided "as is", without warranty of any kind. Use at your own risk.
