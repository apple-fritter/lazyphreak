# TWRP and LineageOS build automation

This repository contains shell scripts to automate the building of `TWRP` and `LineageOS` for Android devices on `AWS EC2` instances. The scripts have been tested on `Ubuntu 20.04 LTS`.

## Prerequisites

Before using these scripts, you need to have the following:

- An `AWS` account with an `EC2` instance running `Ubuntu 20.04 LTS`.
- `Git`, `Java JDK`, `Python 3`, and necessary Android build tools installed on your EC2 instance.

## Usage

Clone this repository onto your EC2 instance.

You may run the wrapper script by typing:
```
./wrapper.sh
```
Or by following the procedure below:
1. Run the `install-packages.sh` script to install necessary packages on your EC2 instance.
2. Run the `build-twrp.sh` script to build a TWRP recovery image for your Android device. You will be prompted to enter your device's model number and the version of TWRP you want to build.
3. Run the `build-lineageos.sh` script to build a LineageOS ROM for your Android device. You will be prompted to enter your device's model number and the version of LineageOS you want to build.
4. Run the `sign-packages.sh` script to sign the flashable TWRP recovery image and LineageOS ROM with your GPG key.

## License

This project is licensed under the [MIT License](LICENSE).
