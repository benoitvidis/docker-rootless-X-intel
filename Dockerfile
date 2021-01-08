FROM vidiben/rootless:alpine-3.12

LABEL fr.ben0.maintainer="Benoît Vidis"

USER root
RUN  set -x \
  \
  && apk add --no-cache \
    font-noto \
    libxcomposite \
    libx11 \
    mesa-dri-intel \
    mesa-vdpau-gallium \
    pulseaudio-utils \
    ttf-freefont \
    ttf-liberation \
    ttf-opensans \
    ttf-ubuntu-font-family \
  && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
    libvdpau \
  && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    libva \
    libvdpau-va-gl \
  && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    libva-intel-driver \
  \
  && echo done

COPY pulse-client.conf /etc/pulse/client.conf

USER me
