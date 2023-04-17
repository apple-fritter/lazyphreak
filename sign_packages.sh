#!/bin/bash

# Prompt user to enter model number
read -p "Enter model number: " model

# Prompt user to select GPG key
echo "Select GPG key:"
gpg --list-keys --keyid-format=long
read -p "Enter GPG key ID: " keyid

# Sign TWRP image
gpg --default-key $keyid --output output/twrp/$model-$twrp_version.img.asc --detach-sig output/twrp/$model-$twrp_version.img

# Sign LineageOS image
gpg --default-key $keyid --output output/
