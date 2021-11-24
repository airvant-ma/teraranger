#!/bin/bash

####################################################################################
# Copyright (C) Airvant Mediciones Ambientales - All Rights Reserved               #
# Unauthorized copying of this file, via any medium is strictly prohibited         #
# Proprietary and confidential                                                     #
# Written by Airvant Mediciones Ambientales <administracion@airvant.es>, June 2021 #
####################################################################################

# root privileges needed
if (( $EUID != 0 )); then
    echo "Please run as root"
    exit 1
fi

# remove udev rules file
rm 99-teraranger.rules /etc/udev/rules.d/99-teraranger.rules

# reinitialize rules
udevadm control --reload-rules && service udev restart && udevadm trigger
