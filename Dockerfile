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

ENV QT_X11_NO_MITSHM 1
RUN apt-get install -y --no-install-recommends \
		libqtgui4 libqt5gui5

ARG PULSE_SERVER=tcp:172.17.0.1:4713
ENV PULSE_SERVER $PULSE_SERVER
RUN apt-get install -y --no-install-recommends \
		pulseaudio \
	&& su user -c 'mkdir -p /home/user/.config/pulse/'

RUN apt-get install -y --no-install-recommends \
		gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad \
		gstreamer1.0-plugins-ugly gstreamer1.0-pulseaudio gstreamer1.0-libav \
	&& usermod -a -G cdrom user \
	&& /usr/share/doc/libdvdread4/install-css.sh

RUN rm -rf /var/lib/apt/lists/*

CMD [ "/bin/bash" ]
