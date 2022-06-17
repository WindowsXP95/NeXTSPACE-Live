#!/bin/bash
# nxspce build script v2
# 2022 The NextSpace OS Project

buildopt='Select an option to build an image: '
options=("Build Stable" "Build Beta" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Build Stable")
            echo "Building Stable"
            echo ""
            livecd-creator --config /NeXTSPACE-OS/release/stable/nextspace.ks --title "NEXTSPACEOS" --fslabel "NEXTSPACEOS"
            break
            ;;
        "Build Beta")
            echo "Building beta"
            echo ""
	    livecd-creator --config /NeXTSPACE-OS/release/beta/nextspace.ks --title "NEXTSPACEOS" --fslabel "NEXTSPACEOS"
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done
