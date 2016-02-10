#### Installation
```
$ export xbranch=qt-gstreamer1.0
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

Example where the Language is German, X dispaly set to :10 and 
pulseaudio server is on the ip 192.168.0.120 with port 4747
```
$ docker build --build-arg LANG="de_DE" \
	--build-arg DISPLAY=":10" \
	--build-arg PULSE_SERVER="tcp:192.168.0.120:4747"
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
