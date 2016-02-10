docker Xorg Container
---------------------

#### Different branches
[xonly](https://github.com/Kry07/docker-xorg/tree/xonly)
[gtk](https://github.com/Kry07/docker-xorg/tree/gtk)
[gtk-pulse](https://github.com/Kry07/docker-xorg/tree/gtk-pulse)
[gtk-gstreamer1.0](https://github.com/Kry07/docker-xorg/tree/gtk-gstreamer1.0)
[qt](https://github.com/Kry07/docker-xorg/tree/qt)
[qt-pulse](https://github.com/Kry07/docker-xorg/tree/qt-pulse)
[qt-gstreamer1.0](https://github.com/Kry07/docker-xorg/tree/qt-gstreamer1.0)

#### Description
This Container is made to be used as base for gui Applications.

[Link to docker hub](https://hub.docker.com/r/kry07/xorg/)

#### Dependencies
This Container depends on [buildpack-deps:trusty-curl](https://hub.docker.com/_/buildpack-deps/)  
*buildpack-deps:trusty-curl* depends on [ubuntu:trusty](https://hub.docker.com/_/ubuntu/)

Why did i choose Ubuntu ?  
Ubuntu is in my Opinion the most used and supported linux-distro.

#### Dockerfile

- A user *"user"* is created, because **you should never run X as root !**

##### Environment variables
*LANG $LANG* - Tells the system which language you are using. (Default en_US)  
*HOME /home/user* - Sets the path to the home directory of the user.  
*DEBIAN_FRONTEND noninteractive* - Let the OS know there is no tty.  
*DISPLAY $DISPLAY* - Tells the X on which Screen to draw the windows. (Default :0)  

##### Xorg dependencies *( apt-cache depends xorg )*
xserver-xorg libgl1-mesa-glx libgl1-mesa-dri libglu1-mesa xfonts-base x11-apps
x11-session-utils x11-utils x11-xfs-utils x11-xkb-utils x11-xserver-utils xauth
xinit xfonts-utils xkb-data xorg-docs-core xterm x11-common xinput xorg-docs
xfonts-100dpi xfonts-75dpi xfonts-scalable

We take only *xserver-xorg-core*, because we dont want to install input and video drivers.  
I dont know, if we need the *xfonts-*, maybe i will add them in future.  
We want to be light so no *x11-apps, docs, xterm, xinput, xkb* (xkeyboard).  
*xinit* could be of use for special cases, but not for a base Container.

##### avahi-utils, dbus
*Avahi* and *Dbus* is important to run gui apps.

##### missing base Packages
*xz-utils unzip* - Will be later of use to extract *zip* and *tar.xz* files.
