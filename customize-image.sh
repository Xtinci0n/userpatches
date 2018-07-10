#!/bin/bash

# arguments: $RELEASE $FAMILY $BOARD $BUILD_DESKTOP
#
# This is the image customization script
#
# NOTE: It is copied to /tmp directory inside the image
# and executed there inside chroot environment
# so don't reference any files that are not already installed

RELEASE=$1
FAMILY=$2
BOARD=$3
BUILD_DESKTOP=$4

# Set ARCH variable for choosing the right package architecture
ARCH=`dpkg --print-architecture`

case $RELEASE in
	wheezy)
	# your code here
	;;
	stretch)

	# Set of scripts to turn an ARMbian image into a full Ethereum node
	# Visit https://www.armbian.com for further info regarding image customization and Armbian itself
	# Diego Losada <diego.losadaf@gmail.com>

	# Assign unique hostname on first boot (ethnode-$MAC-HASH)
	cp /tmp/overlay/armbian_first_run.txt /boot
	
	# Create ethereum user and assign groups for Geth and Parity systemd daemon
	#echo "Creating ethereum  user for Geth and Parity"
	#if ! id -u ethereum >/dev/null 2>&1; then
	#	adduser --disabled-password --gecos "" ethereum
	#fi
	#echo "ethereum:ethereum" | chpasswd
	#for GRP in sudo netdev audio video dialout plugdev bluetooth; do
  	#	adduser ethereum $GRP
	#done	
	
	# Disable new account creation
	#rm -rf /root/.not_logged_in_yet

	# Install Geth and Parity Debian packages
	# check ARCH and choose the right architecture (armhf or arm64)
	echo "Installing Parity and Geth Debian packages"
	#if [[ $ARCH == armhf ]]; then
        #	dpkg -i /tmp/overlay/parity-rasp_1.6.8-0_armhf.deb
	#	dpkg -i /tmp/overlay/geth-rasp_1.6.5-0_armhf.deb
	#	dpkg -i /tmp/overlay/ipfs_0.4.9-0_armhf.deb
	#else
        #        dpkg -i /tmp/overlay/parity-rasp_1.6.8-0_arm64.deb
	dpkg -i /tmp/overlay/geth_1.8.12-0_arm64.deb
	dpkg -i /tmp/overlay/parity_1.10.9-0_arm64.deb
	#	dpkg -i /tmp/overlay/ipfs_0.4.9-0_arm64.deb
	#fi
	;;
	trusty)
	# your code here
	;;
	xenial)
	# you can copy the above code here if you prefer Ubuntu instead of Debian
	;;
esac
