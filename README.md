##### Supported tags and respective `Dockerfile` links  
###### trusty Ubuntu 14.04
 - [`trusty-xonly` (Dockerfile)](https://github.com/Kry07/docker-xorg/blob/trusty-xonly/Dockerfile)
 - [`trusty-gtk` (Dockerfile)](https://github.com/Kry07/docker-xorg/blob/trusty-gtk/Dockerfile)
 - [`trusty-gtk-pulse` (Dockerfile)](https://github.com/Kry07/docker-xorg/blob/trusty-gtk-pulse/Dockerfile)
 - [`trusty-gtk-gstreamer1.0` (Dockerfile)](https://github.com/Kry07/docker-xorg/blob/trusty-gtk-gstreamer1.0/Dockerfile)
 - [`trusty-qt`  (Dockerfile)](https://github.com/Kry07/docker-xorg/blob/trusty-qt/Dockerfile)
 - [`trusty-qt-pulse` (Dockerfile)](https://github.com/Kry07/docker-xorg/blob/trusty-qt-pulse/Dockerfile)
 - [`trusty-qt-gstreamer1.0` (Dockerfile)](https://github.com/Kry07/docker-xorg/blob/trusty-qt-gstreamer1.0/Dockerfile)

###### xenial Ubuntu 16.04
 - [`xonly` , `latest` (Dockerfile)](https://github.com/Kry07/docker-xorg/blob/xonly/Dockerfile)
 - [`gtk` (Dockerfile)](https://github.com/Kry07/docker-xorg/blob/gtk/Dockerfile)
 - [`gtk-pulse` (Dockerfile)](https://github.com/Kry07/docker-xorg/blob/gtk-pulse/Dockerfile)
 - [`gtk-gstreamer1.0` (Dockerfile)](https://github.com/Kry07/docker-xorg/blob/gtk-gstreamer1.0/Dockerfile)
 - [`qt`  (Dockerfile)](https://github.com/Kry07/docker-xorg/blob/qt/Dockerfile)
 - [`qt-pulse` (Dockerfile)](https://github.com/Kry07/docker-xorg/blob/qt-pulse/Dockerfile)
 - [`qt-gstreamer1.0` (Dockerfile)](https://github.com/Kry07/docker-xorg/blob/qt-gstreamer1.0/Dockerfile)

These Containers depends on [buildpack-deps](https://hub.docker.com/_/buildpack-deps/)  

Why did i choose Ubuntu ?  
Ubuntu is in my Opinion the most used and supported linux-distro.

I use some Applications with these containers. You can find them in [github.com/Kry07/docker-apps](https://github.com/Kry0/docker-apps).
Please Comment, otherwise i don't recognize that some one is using my work. I don't upload them anymore to dockerhub, because nobody is using them.

For more information about this image and its history, please see [GitHub repo](https://github.com/Kry07/docker-xorg).

##### Dockerfile

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

##### How to run example
```
$ xhost +si:localuser:$USER
$ docker run -v /tmp/.X11-unix:/tmp/.X11-unix:ro kry07/xorg:${xbranch} ...
```
