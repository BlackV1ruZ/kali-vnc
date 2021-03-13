#!/bin/sh

# Start XServer
vncserver :1 -ac -localhost -SecurityTypes None &

# Create index.html for VNC server
ln -s /root/noVNC/vnc.html /root/noVNC/index.html

# Start noVNC server
/root/noVNC/utils/launch.sh --vnc localhost:5901