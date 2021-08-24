FROM vidiben/rootless:ubuntu-20.04

LABEL fr.ben0.maintainer="Benoît Vidis"

USER root
RUN  set -x \
  \
  && apt-get update  \
  && apt-get install --no-install-recommends --no-install-suggests -y \
    fonts-freefont-ttf \
    fonts-liberation \
    fonts-noto \
    fonts-ubuntu \
    intel-media-va-driver-non-free \
    libxcomposite1 \
    libx11-6 \
    libva-x11-2 \
    libvdpau1 \
    libvdpau-va-gl1 \
    mesa-vdpau-drivers \
    pulseaudio-utils \
    vdpauinfo \
  && rm -rf /var/lib/apt/lists/*

COPY pulse-client.conf /etc/pulse/client.conf

USER me
