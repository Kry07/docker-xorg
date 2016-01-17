docker Xorg Container
---------------------

#### Description
This Container is made to be used as base for gui Applications.

[Link to docker hub](https://hub.docker.com/r/kry07/xorg/)

#### Dependencies
This Container depends on [buildpack-deps:trusty-curl](https://hub.docker.com/_/buildpack-deps/)  
*buildpack-deps:trusty-curl* depends on [ubuntu:trusty](https://hub.docker.com/_/ubuntu/)

Why did i choose Ubuntu ?  
Ubuntu is in my Opinion the most used and supported linux-distro.

#### Dockerfile

- A user *"user"* is created, because **you should never run X always as root !**

##### Environment variables
*LANG $LANG* - Tells the system which language you are using. (Default en_US)  
*HOME /home/user* - Sets the path to the home directory of the user.  
*DEBIAN_FRONTEND noninteractive* - Let the OS know there is no tty.  
*DISPLAY $DISPLAY* - Tells the X on which Screen to draw the windows. (Default :0)  
*PULSE_SERVER $PULSE_SERVER* - Tells docker pulseaudio to connect to other pulseaudio server.  
 (Default tcp:172.17.0.1:4713) sets to localhost with default pulseaudio port.  

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

#### Installation
```
$ export xbranch=gtk-pulse
```

##### How to get this Container
```
$ docker pull kry07/xorg:${xbranch}
```

```
$ git clone --single-branch --branch gtk-pulse https://github.com/Kry07/docker-xorg.git
$ cd docker-xorg
$ docker build -t kry07/xorg:${xbranch} .
```

Example where the Language is German, X dispaly set to :10 and 
pulseaudio server is on the ip 192.168.0.120 with port 4747
```
$ docker build --build-arg LANG="de_DE" \
	--build-arg DISPLAY=":10" \
	--build-arg PULSE_SERVER="tcp:192.168.0.120:4747"
	-t kry07/xorg:gtk-pulse .
	-t kry07/xorg:${xbranch} .
```

##### How to run example
```
$ xhost +si:localuser:$USER
$ docker run -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
	-v $HOME/.config/pulse/cookie:/home/user/.config/pulse/cookie:ro \
	kry07/xorg:${xbranch}
$ su user
```
