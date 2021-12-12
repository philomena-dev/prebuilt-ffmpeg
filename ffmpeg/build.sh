#!/bin/sh
set -e
cd /opt/ffmpeg

export builddir="$PWD/src/FFmpeg-release-6.0"

echo | abuild-keygen -a -i
abuild checksum
abuild
