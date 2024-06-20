#!/bin/bash

sudo docker run -it --rm \
    --network=host \
    --privileged orangepi5plus-gst-mpp \
    gst-launch-1.0 v4l2src device=/dev/video0 \
        ! video/x-raw \
        ! mpph265enc \
        ! h265parse \
        ! matroskamux \
        ! tcpserversink host=0.0.0.0 port=8888