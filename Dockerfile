FROM kalilinux/kali-rolling:latest
LABEL MAINTAINER=BlackV1ruZ

# Copy startup script
ADD startup.sh /startup.sh

# Configure user for Xwindows
ENV USER root

# Run startup script
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        git \
        python \
        pip \
        tigervnc-standalone-server \
        x11vnc \
        kali-desktop-core \
        kali-desktop-xfce \
        dbus-x11 \
        x11-utils \
        alsa-utils \
        mesa-utils \
        libgl1-mesa-dri \
    && pip install numpy \
    && apt autoclean -y \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/novnc/noVNC.git /root/noVNC \
    && git clone https://github.com/novnc/websockify.git /root/noVNC/utils/websockify \
    && chmod 0755 /startup.sh

CMD [ "./startup.sh" ]

# Expose VNC & websockify ports
EXPOSE 5901 6080
