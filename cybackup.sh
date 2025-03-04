#!/bin/bash

apt-get update && apt-get dist-upgrade -y && update-kernel -y && apt-get clean && reboot


echo "DONE - UNCOMMENT AFTER REBOOT"


# apt-get install kernel-source-<x.x>
# apt-get install kernel-headers-modules-std-def gcc make -y
# chmod +x CyberBackup_17_64-bit.x86_64
# ./CyberBackup_17_64-bit.x86_64


# echo "DONE - CAN DO FURTHER"
