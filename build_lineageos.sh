#!/bin/bash

# Prompt user to enter model number
read -p "Enter model number: " model

# Prompt user to select LineageOS version
options=("17.1" "18.1")
echo "Select LineageOS version:"
select opt in "${options[@]}"
do
    case $opt in
        "17.1")
            lineage_version="lineage-17.1"
            break
            ;;
        "18.1")
            lineage_version="lineage-18.1"
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done

# Clone LineageOS repo and checkout selected version
repo init -u https://github.com/LineageOS/android.git -b $lineage_version
repo sync --current-branch --no-tags --no-clone-bundle --optimized-fetch --prune -j$(nproc)
cd device/$model
git checkout lineage-18.1

# Build LineageOS
source build/envsetup.sh
breakfast $model
brunch $model

# Move LineageOS image to output directory
cd $ANDROID_BUILD_TOP
mkdir -p output/lineageos
mv out/target/product/$model/lineage-*.zip output/lineageos/$model-$lineage_version.zip
