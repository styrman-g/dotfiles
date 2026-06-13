#!/bin/sh
nm-applet &
emacs --daemon &
blueman-applet &
flatpak run com.protonvpn.www &
flatpak run com.synology.SynologyDrive start &
flatpak run org.signal.Signal --enable-features=UseOzonePlatform --ozone-platform=wayland &
volumeicon &
