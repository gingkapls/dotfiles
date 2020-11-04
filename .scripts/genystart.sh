#!/bin/sh

export QT_QPA_PLATFORM=
if [ "$1" == "-a" ]
	then
	genymotion &
else
	vm_name=$(vboxmanage list vms | awk '{gsub(/[{}]/,"",$0); print $NF}')
	genymotion-player --vm-name $vm_name &
fi


