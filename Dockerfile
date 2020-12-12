FROM vidiben/rootless:alpine-3.12

LABEL fr.ben0.maintainer="Benoît Vidis"

USER root
RUN  set -x \
  \
  && apk add --no-cache \
    font-noto \
    libxcomposite \
    libx11 \
    libva-intel-driver \
    libvdpau \
    mesa-dri-intel \
    mesa-vdpau-gallium \
    pulseaudio-utils \
    ttf-freefont \
    ttf-liberation \
    ttf-opensans \
    ttf-ubuntu-font-family

COPY pulse-client.conf /etc/pulse/client.conf

USER me
