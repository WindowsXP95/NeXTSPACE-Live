#!/bin/bash
# nxspce build script v2.1a
# 2022 The NextSpace OS Project

buildopt='Select an option to build an image: '
options=("Build Stable" "Build Beta" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Build Stable")
            echo "Building Stable release"
            echo ""
            livecd-creator --config /NeXTSPACE-OS/release/stable/nextspace.ks --title "nxt" --fslabel "nextspaceos_rel_stable"
            break
            ;;
        "Build Beta")
            echo "Building Beta release"
            echo ""
	    livecd-creator --config /NeXTSPACE-OS/release/beta/nextspace.ks --title "nxtbeta" --fslabel "nextspaceos_rel_beta"
            break
            ;;
        "Quit")
            break
            ;;
        *) echo " Invalid option $REPLY";;
    esac
done
