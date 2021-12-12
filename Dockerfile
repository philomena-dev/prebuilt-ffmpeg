FROM elixir:1.16.1-alpine

RUN apk update && \
    apk add sudo alpine-sdk alsa-lib-dev aom-dev bzip2-dev coreutils gnutls-dev imlib2-dev lame-dev libass-dev libsrt-dev libssh-dev libtheora-dev libva-dev libvdpau-dev libvorbis-dev libvpx-dev libwebp-dev libxfixes-dev opus-dev perl-dev sdl2-dev soxr-dev v4l-utils-dev x264-dev x265-dev xvidcore-dev yasm zlib-dev dav1d-dev vidstab-dev vulkan-loader-dev

COPY ffmpeg /opt/ffmpeg
RUN (adduser build || echo) && \
    mkdir -p /var/cache/distfiles && \
    chmod a+w /var/cache/distfiles && \
    chmod a+w /opt/ffmpeg && \
    echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    sudo -u build /opt/ffmpeg/build.sh
