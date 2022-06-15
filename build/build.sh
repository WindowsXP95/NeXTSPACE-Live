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
            livecd-creator --config /NeXTSPACE-OS/rel/stable/nextspace.ks --title "NEXTSPACEOS" --fslabel "NEXTSPACEOS_rel_stable"
            break
            ;;
        "Build Beta")
            echo "Building beta"
            echo ""
	    livecd-creator --config /NeXTSPACE-OS/rel/beta/nextspace.ks --title "NEXTSPACEOS" --fslabel "NEXTSPACEOS_Beta"
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done
