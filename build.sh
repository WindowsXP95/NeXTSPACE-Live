#!/bin/bash
# nxspce build script v2
# 2022 The NextSpace OS Project

buildopt='Please enter your choice: '
options=("Option 1" "Option 2" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Option 1")
            echo "Building Stable"
            livecd-creator --config /NeXTSPACE-OS/testing/nextspace.ks --title "NEXTSPACEOS_Stable" --fslabel "NEXTSPACEOS_Stable"
            ;;
        "Option 2")
            echo "Building beta"
	    livecd-creator --config /NeXTSPACE-OS/testing/nextspace_beta.ks --title "NEXTSPACEOS_Beta" --fslabel "NEXTSPACEOS_Beta"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
