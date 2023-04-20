# TWRP and LineageOS build automation

This repository contains shell scripts to automate the building of `TWRP` and `LineageOS` for Android devices on `AWS EC2` instances. The scripts have been tested on `Ubuntu 20.04 LTS`.

## Wrapper script
The wrapper script is a shell script that automates the building of TWRP and LineageOS for Android devices on AWS EC2 instances. It prompts the user for the device model number, TWRP version, and LineageOS version, and then runs the necessary scripts to install the required packages, build TWRP and LineageOS, and sign the resulting packages with `GPG`.

The following is an outline of the wrapper script's functionality:

1. Prompt user for
- device model number
- TWRP version
- LineageOS version
2. Run the `install-packages.sh` script to install necessary packages on the EC2 instance
3. Run the `build-twrp.sh` script to build a TWRP recovery image for the device, using the user input
4. Run the `build-lineageos.sh` script to build a LineageOS ROM for the device, using the user input
5. Run the `sign-packages.sh` script to sign the flashable TWRP recovery image and LineageOS ROM with the user's GPG key

## Install-packages script
The install-packages script is a shell script that installs the necessary packages for building TWRP and LineageOS on an Ubuntu 20.04 LTS EC2 instance. The script installs the following packages:

```
Git
Java JDK
Python 3
Android build tools
```

## Build-twrp script
The build-twrp script is a shell script that builds a TWRP recovery image for an Android device. The script takes two arguments: the device model number and the TWRP version to build. The script performs the following steps:

1. Clone the TWRP source code from GitHub
2. Set up the build environment for the device
3. Build the TWRP recovery image

## Build-lineageos script
The build-lineageos script is a shell script that builds a LineageOS ROM for an Android device. The script takes two arguments: the device model number and the LineageOS version to build. The script performs the following steps:

1. Clone the LineageOS source code from GitHub
2. Set up the build environment for the device
3. Build the LineageOS ROM


## Sign-packages script
The sign-packages script is a shell script that signs the flashable TWRP recovery image and LineageOS ROM with the user's GPG key. The script performs the following steps:

1. Import the user's GPG key
2. Sign the TWRP recovery image and LineageOS ROM with the user's GPG key

## License

This script is released under the [MIT License](LICENSE).
