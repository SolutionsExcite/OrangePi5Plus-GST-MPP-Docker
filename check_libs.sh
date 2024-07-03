#!/bin/bash

mkdir -p /libfiles-built/usr/lib/aarch64-linux-gnu
mkdir -p /libfiles-built/usr/local/lib
mkdir -p /libfiles-built/lib/aarch64-linux-gnu
mkdir -p /libfiles-built/usr/lib

# Copy other libraries
sudo cp -r /usr/lib/ /libfiles-built/usr/lib/
sudo cp -r /usr/local/lib /libfiles-built/usr/local/
sudo cp -r /lib/aarch64-linux-gnu /libfiles-built/lib/


#*gst*
#*v4l*

cd /libfiles-built/lib/aarch64-linux-gnu
sudo rm -r audit avahi bfd-plugins blas caca cmake cryptsetup dbus-1.0 directfb-1.7.7 \
    dri e2fsprogs engines-3 gconv gdalplugins gdcm-3.0 gdk-pixbuf-2.0 gettext \
    gio gir-1.0 girepository-1.0 glib-2.0 gprofng graphviz gtk-3.0 \
    hwloc icu ImageMagick-6.9.12 krb5 lapack ldscripts libdecor \
    libfakeroot libgphoto2 libgphoto2_port libgtk-3-0t64 libheif libibverbs \
    libproxy metatypes ogdi openmpi OpenNI2 ossl-modules perl perl5 perl-base \
    pkgconfig pmix2 pulseaudio qt-default qt5 qtchooser rsocket sasl2 security \
    spa-0.2 systemd ucx vdpau vtk wireplumber-0.4

find ./ -type f -name "*gst*"