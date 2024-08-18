#!/usr/bin/env bash

set -eo pipefail

filename=$(wget -qO- http://ftpmirror.gnu.org/emacs/ | grep -Eo 'emacs-[^t]+\.tar\.gz' | tail -n 1)

wget "http://ftpmirror.gnu.org/emacs/${filename}"
tar xvf "${filename}"

cd "${filename%.tar.gz}"

./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --without-mailutils \
    --without-pop \
    --without-kerberos \
    --without-kerberos5 \
    --without-hesiod \
    --without-x-toolkit \
    --without-wide-int \
    --without-cairo-xcb \
    --without-xaw3d \
    --without-xim \
    --without-xdbe \
    --without-w32 \
    --without-gconf \
    --without-cygwin32-native-compilation \
    --without-xwidgets \
    --without-be-app \
    --without-be-cairo \
    --without-x \
    --with-sound=yes \
    --with-jpeg \
    --with-tiff \
    --with-gif \
    --with-png \
    --with-rsvg \
    --with-webp \
    --with-sqlite3 \
    --with-cairo \
    --with-json \
    --with-tree-sitter \
    --with-modules \
    --with-harfbuzz \
    --with-dbus \
    --with-pgtk \
    --with-gsettings \
    --with-zlib \
    --with-threads \
    --with-native-compilation=aot

cd -
