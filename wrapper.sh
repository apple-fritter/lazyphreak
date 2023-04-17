#!/bin/bash

# Prompt user for device model number
echo "Enter the device model number:"
read model_number

# Prompt user for TWRP version
echo "Enter the TWRP version to build:"
read twrp_version

# Prompt user for LineageOS version
echo "Enter the LineageOS version to build:"
read lineageos_version

# Run the script to install necessary packages
./install_packages.sh

# Run the TWRP build script with user input
./build_twrp.sh $model_number $twrp_version

# Run the LineageOS build script with user input
./build_lineageos.sh $model_number $lineageos_version

# Sign the TWRP and LineageOS builds with GPG
./sign_packages.sh
