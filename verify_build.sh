#!/bin/bash

# some form of --network is needed to stream
sudo docker run -it --rm \
    --network=host \
    --privileged \
    --device /dev/video0 \
    --device /dev/dri \
    --device /dev/rga \
    --device /dev/mpp_service \
    gst-hwa \
    gst-launch-1.0 v4l2src device=/dev/video0 \
        ! video/x-raw \
        ! mpph265enc \
        ! h265parse \
        ! matroskamux \
        ! tcpserversink host=0.0.0.0 port=8888

# --device /dev/v4l/by-path/platform-fdee0000.hdmirx-controller-video-index0:/dev/v4l \
#video-dec0
#video-enc0
#--device /dev/video0 \
#--device /dev/v4l/by-path/platform-fdee0000.hdmirx-controller-video-index0:/dev/v4l \
#--device /dev/dri \
#--device /dev/rga \
#--device /dev/mpp_service \