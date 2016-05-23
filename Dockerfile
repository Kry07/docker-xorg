FROM buildpack-deps:xenial-curl
MAINTAINER Kry <info.mayl@aol.com>

# Defaults, can be changed at build time
ARG DISPLAY=:0
ARG LANG=en_US.UTF-8

ENV LANG $LANG
RUN locale-gen $LANG \
	&& update-locale LANG=$LANG

ENV HOME /home/user
RUN useradd -u 1000 -G audio,video,users -s /bin/bash -m user 
WORKDIR $HOME

ENV DEBIAN_FRONTEND noninteractive
ENV DISPLAY $DISPLAY
RUN apt-get update -y && apt-get install -y --no-install-recommends \
		apt xz-utils unzip avahi-utils dbus \
		xserver-xorg-core libgl1-mesa-glx libgl1-mesa-dri libglu1-mesa xfonts-base \
		x11-session-utils x11-utils x11-xfs-utils x11-xserver-utils xauth x11-common

RUN rm -rf /var/lib/apt/lists/*

CMD [ "/bin/bash" ]
