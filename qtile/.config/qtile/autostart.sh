#!/bin/sh
picom &
nm-applet &
birdtray &
emacs --daemon &
blueman-applet &
flatpak run com.synology.SynologyDrive start &
flatpak run org.signal.Signal &
