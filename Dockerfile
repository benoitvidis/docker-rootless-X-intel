FROM vidiben/rootless:alpine-3.14

LABEL fr.ben0.maintainer="Benoît Vidis"

USER root
RUN  set -x \
  \
  && apk add --no-cache \
    font-noto \
    font-ubuntu-nerd \
    libxcomposite \
    libx11 \
    libva-intel-driver \
    mesa-dri-intel \
    mesa-vdpau-gallium \
    pulseaudio-utils \
    ttf-freefont \
    ttf-liberation \
    ttf-opensans \
  && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
    libvdpau \
  && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    libva \
    libvdpau-va-gl \
  && echo done

COPY pulse-client.conf /etc/pulse/client.conf

USER me
