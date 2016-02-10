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
