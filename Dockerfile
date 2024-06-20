# docker build -t orangepi5plus-gst-mpp .
FROM ubuntu:24.04 as orangepi5plus-gst-mpp 

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

# Copy additional files from local context
COPY libfiles/lib /lib
COPY libfiles/usr/lib/aarch64-linux-gnu /usr/lib/aarch64-linux-gnu

# Set environment variables for runtime
ENV LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:/lib:/usr/lib/aarch64-linux-gnu:/lib/aarch64-linux-gnu:/usr/lib/aarch64-linux-gnu/libv4l/plugins:$LD_LIBRARY_PATH
ENV GST_PLUGIN_PATH=/usr/lib/aarch64-linux-gnu/gstreamer-1.0:/usr/local/lib/gstreamer-1.0:/usr/lib/gstreamer-1.0:$GST_PLUGIN_PATH

# Set the default command to run a shell
CMD ["/bin/bash"]
    