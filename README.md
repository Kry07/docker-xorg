
##### Supported tags and respective `Dockerfile` links  
- [`xonly` (xonly/Dockerfile)](https://github.com/Kry07/docker-xorg/blob/xonly/Dockerfile)
- [`gtk` (gtk/Dockerfile)](https://github.com/Kry07/docker-xorg/blob/gtk/Dockerfile)
- [`gtk-pulse` (gtk-pulse/Dockerfile)](https://github.com/Kry07/docker-xorg/blob/gtk-pulse/Dockerfile)
- [`gtk-gstreamer1.0` (gtk-gstreamer1.0/Dockerfile)](https://github.com/Kry07/docker-xorg/blob/gtk-gstreamer1.0/Dockerfile)
- [`qt`  (qt/Dockerfile)](https://github.com/Kry07/docker-xorg/blob/qt/Dockerfile)
- [`qt-pulse` (qt-pulse/Dockerfile)](https://github.com/Kry07/docker-xorg/blob/qt-pulse/Dockerfile)
- [`qt-gstreamer1.0` (qt-gstreamer1.0/Dockerfile)](https://github.com/Kry07/docker-xorg/blob/qt-gstreamer1.0/Dockerfile)

#### Dependencies
This Container depends on [buildpack-deps](https://hub.docker.com/_/buildpack-deps/)  

Why did i choose Ubuntu ?  
Ubuntu is in my Opinion the most used and supported linux-distro.

I use some Applications with this containers. You can find them in [github.com/Kry07/docker-apps](https://github.com/Kry0/docker-apps).
Please Comment, otherwise i don't recognize that some one is using my work. I don't upload them anymore to dockerhub, because nobody is using them.

For more information about this image and its history, please see [GitHub repo](https://github.com/Kry07/docker-xorg).

#### Dockerfile

- A user *"user"* is created, because **you should never run X as root !**

##### Environment variables
*LANG $LANG* - Tells the system which language you are using. (Default en_US)  
*HOME /home/user* - Sets the path to the home directory of the user.  
*DEBIAN_FRONTEND noninteractive* - Let the OS know there is no tty.  
*DISPLAY $DISPLAY* - Tells the X on which Screen to draw the windows. (Default :0)  

##### How to run example
```
$ xhost +si:localuser:$USER
$ docker run -v /tmp/.X11-unix:/tmp/.X11-unix:ro kry07/xorg:${xbranch} ...
```
