docker Xorg Container
---------------------

#### Description
This Container is made to be used as base for gui Applications.

[Link to docker hub](https://hub.docker.com/r/kry07/xorg/)

#### Dependencies
This Container depends on [buildpack-deps:trusty-curl](https://hub.docker.com/_/buildpack-deps/)  
*buildpack-deps:trusty-curl* depends on [ubuntu:trusty](https://hub.docker.com/_/ubuntu/)

#### Dockerfile

- A user *"user"* is created, because **you should never run X as root !**

##### Environment variables
*LANG $LANG* - Tells the system which language you are using. (Default en_US)  
*HOME /home/user* - Sets the path to the home directory of the user.  
*DEBIAN_FRONTEND noninteractive* - Let the OS know there is no tty.  
*DISPLAY $DISPLAY* - Tells the X on which Screen to draw the windows. (Default :0)  

#### Installation
```
$ export xbranch=qt
```

##### How to get this Container
```
$ docker pull kry07/xorg:${xbranch}
```

```
$ git clone --single-branch --branch ${xbranch} https://github.com/Kry07/docker-xorg.git
$ cd docker-xorg
$ docker build -t kry07/xorg:${xbranch} .
```

Example where the Language is German and X dispaly set to :10
```
$ docker build --build-arg LANG="de_DE" --build-arg DISPLAY=":10" -t kry07/xorg:${xbranch} .
```

##### How to run example
```
$ xhost +si:localuser:$USER
$ docker run -v /tmp/.X11-unix:/tmp/.X11-unix:ro kry07/xorg:${xbranch}
$ su user
```
