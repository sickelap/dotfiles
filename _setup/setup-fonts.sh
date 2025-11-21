#!/bin/sh

set -eu

OS=$(uname -s)

case $OS in
  Darwin)
    DESTDIR=~/Library/Fonts/
    ;;
  *)
    echo "Unsupported OS $OS"
    exit 0
    ;;
esac

TMPDIR=${TMPDIR:-$(mktemp -d)}
VERSION=v3.4.0
NERDFONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/JetBrainsMono.zip"
DOWNLOAD=$TMPDIR/fonts.zip

if [[ ! -f $DOWNLOAD ]]; then
  echo Downloading fonts
  curl -Lsko $DOWNLOAD $NERDFONT_URL
fi

echo Extracting fonts
unzip -qqud $TMPDIR $DOWNLOAD

echo Installing fonts
find $TMPDIR -type f -name "*.ttf" -exec cp {} $DESTDIR \;

echo Fonts installed to $DESTDIR

