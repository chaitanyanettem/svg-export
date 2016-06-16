#!/bin/bash

usage() { echo "Usage: $0 [-d] [-s] [-n]" 1>&2; exit 1; }

command -v inkscape >/dev/null 2>&1 || { echo >&2 "Inkscape is missing. Aborting."; exit 1;}

# $1 = directory where logos will be placed
# $2 = input logo file
# $3 = output logo name
# eg. svg-export.sh ~/logo ~/logo/input.svg output.png

if [ ! -d "$1" ]; then
    mkdir $1
fi
mkdir $1/mipmap-mdpi $1/mipmap-hdpi $1/mipmap-xhdpi $1/mipmap-xxhdpi \
    $1/mipmap-xxxhdpi

sizes=( 48 72 96 144 192 )
folders=( mdpi hdpi xhdpi xxhdpi xxxhdpi )

for i in {0..4}
do
    inkscape --file $2 --export-png $1/mipmap-${folders[i]}/$3 --export-width \
        ${sizes[i]}
done
