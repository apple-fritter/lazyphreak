#!/bin/bash

# Prompt user to enter model number
read -p "Enter model number: " model

# Prompt user to select TWRP version
options=("v3.3.1-0" "v3.4.0-0" "v3.5.0_9-0")
echo "Select TWRP version:"
select opt in "${options[@]}"
do
    case $opt in
        "v3.3.1-0")
            twrp_version="twrp-3.3.1-0"
            break
            ;;
        "v3.4.0-0")
            twrp_version="twrp-3.4.0-0"
            break
            ;;
        "v3.5.0_9-0")
            twrp_version="twrp-3.5.0_9-0"
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done

# Clone TWRP repo and checkout selected version
git clone https://github.com/TeamWin/android_device_$model.git device/$model
cd device/$model
git checkout $twrp_version

# Build TWRP
source build/envsetup.sh
lunch omni_$model-eng
make -j$(nproc) recoveryimage

# Move TWRP image to output directory
cd $ANDROID_BUILD_TOP
mkdir -p output/twrp
mv out/target/product/$model/recovery.img output/twrp/$model-$twrp_version.img
