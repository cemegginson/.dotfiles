#!/bin/bash

mkdir gnome-extensions
cp -r submodules/gnome-shell-system-monitor-applet/system-monitor@paradoxxx.zero.gmail.com gnome-extensions/
cp -r submodules/multi-monitors-add-on/multi-monitors-add-on@spin83 gnome-extensions/
cp -r submodules/gse-sound-output-device-chooser/sound-output-device-chooser@kgshank.net gnome-extensions/
cp -r submodules/nohotcorner gnome-extensions/nohotcorner@azuri.free.fr

rm -rf ~/.local/share/gnome-shell/extensions

ln -s $PWD/gnome-extensions ~/.local/share/gnome-shell/extensions
