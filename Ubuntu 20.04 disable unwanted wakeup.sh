#!/bin/sh


# Script that makes all (USB or other) devices unable to wake
# the system from sleep or hibernation. Power button and
# the laptop lid (if there is one) are not disabled.
#
# Works on Ubuntu 20.04

### HOW TO USE:
# 1) First, put this script inside /lib/systemd/system-sleep/ so that it is run
# when you sleep/hibernate.
# An easy way to do this is to open a terminal,
# type 'sudo gedit /lib/systemd/system-sleep/disable_unwanted_wakeup' to open the correct 
# file, paste all this code into the editor, hit save, and close the editor.
# 
# 2) Mark this script as executable, so it may run.
# Use command 'sudo chmod +x /lib/systemd/system-sleep/disable_unwanted_wakeup'. The file may now be run by the system.
#
# 3) Suspend or Hibernate the computer. The script will run just before it suspends, removing
# all devices but the power button and lid from the wakeup list, meaning the computer will only
# wakeup from the lid being opened, or power button pressed. (non-usb laptop keyboards are also
# able to wakeup system)
#
# To REMOVE this script, simply delete it with the command 'sudo rm /lib/systemd/system-sleep/disable_unwanted_wakeup',
# and then reboot the computer to restore the old wakeup list. 



if [ "$1" = "pre" ]; then # Only run if entering sleep
	# Go through the list of devices currently allowed to wake the computer, and turn them all off
	for ev in $(cat /proc/acpi/wakeup|grep enabled|cut --delimiter=\  --fields=1)
	do
		if [ $ev != "LID" ] && [ $ev != "SLPB" ]; then # Do not disable if it is the lid or the power button
			echo $ev > /proc/acpi/wakeup # toggle this device off
		fi
	done
fi