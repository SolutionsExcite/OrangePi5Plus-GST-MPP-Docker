# docker build -t orangepi5plus-gst-mpp .
FROM ubuntu:24.04 AS orangepi5plus-gst-mpp 

RUN apt-get update && apt-get install -y \
    libdrm2 \ 
    gstreamer1.0-tools \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    gstreamer1.0-gl \
    gstreamer1.0-pulseaudio \
    gstreamer1.0-libcamera \
    gstreamer1.0-pipewire \
    && rm -rf /var/cache/apt/*

CMD ["/bin/bash"]
    