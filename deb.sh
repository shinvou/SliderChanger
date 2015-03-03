#!/bin/sh
# Thanks to https://github.com/comex/substitute/blob/master/script/gen-deb.sh

set -e
debroot=out/debroot

rm -rf $debroot
mkdir -p $debroot
mkdir -p $debroot/DEBIAN
mkdir -p $debroot/Library/Substitute/DynamicLibraries

cp {out/SliderChanger.dylib,SliderChanger.plist} $debroot/Library/Substitute/DynamicLibraries
cp control $debroot/DEBIAN

fakeroot dpkg-deb -Zlzma -b $debroot com.shinvou.SliderChanger.deb
