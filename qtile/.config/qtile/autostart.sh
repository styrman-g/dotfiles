#!/bin/sh
picom &
nm-applet &
emacs --daemon &
blueman-applet &
flatpak run com.synology.SynologyDrive start &
flatpak run org.signal.Signal &
