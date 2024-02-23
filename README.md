# noVNC Docker Image

This image is intended to be used as a VNC client to connect to existing VNC servers.

## Usage

A VNC server must be set using the `VNC_SERVER` environment variable. Both the host and port must be defined. The noVNC service is available on the container's port 8080.

For example, if you wanted to run noVNC on your localhost port `3000` to connect to a VNC server hosted at `192.168.1.200` on port `5900`, you'd run the following command:

```
docker run --rm -p 3000:8080 -e VNC_SERVER=192.168.1.200:5900 ghrc.io/whimsical-c4lic0/novnc:latest
```

Then open a web browser, and navigate to `http://localhost:3000`

## Image Contents

- [Alpine Linux](https://www.alpinelinux.org) - A lightweight Linux distribution to serve as the image base
- [noVNC](https://novnc.com) - An HTML5 canvas VNC viewer
- [supervisord](http://supervisord.org) - A process control system for managing the noVNC server

## Attributions

This image is a simplified version of the [noVNC image](https://github.com/psharkey/docker/tree/master/novnc) by Pat Sharkey ([@psharkey](https://github.com/psharkey)). I just needed a VNC client without x11.

