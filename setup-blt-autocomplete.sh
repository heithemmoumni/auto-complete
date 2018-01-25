#!/bin/bash

com="# remove this line and re-login to disable blt-autocomplete
if [ -f ~/blt_complete ] ; then
. ~/blt_complete
fi"

machineOut="$(uname -s)"
case "${machineOut}" in
    "Linux")
        dest="~/home/$(whoami)/.bashrc"
        ;;
    "Darwin")
        if [ -z "/Users/$(whoami)/.bash_profile" ] ; then
            dest="/Users/$(whoami)/.profile"
        else
            dest="/Users/$(whoami)/.bash_profile"
        fi
        ;;
    *)
        ;;
esac

if [ -z $dest ] ; then
    echo "Unknown machine type"
else
    if [ -f ~/blt_complete ] ; then
        echo "$com" >> "$dest"
        echo "DONE"
    else
        echo "blt_complete not found in ~/ !"
    fi
fi
