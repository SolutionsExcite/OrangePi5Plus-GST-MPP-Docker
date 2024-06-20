# GStreamer Hardware Acceleration Dockerfile

## Overview

This project provides a Dockerfile that sets up an environment for hardware-accelerated GStreamer using the Media Processing Platform (MPP) from Rockchip. The environment has been specifically tested on Joshua Riek's Ubuntu 24.04, and functionality on other versions or distributions is not guaranteed.

## Features

- **Hardware Acceleration**: Leverages Rockchip's MPP for efficient video processing.
- **GStreamer Integration**: Includes a complete GStreamer setup with all necessary plugins for video encoding, decoding, and streaming.
- **Tested Environment**: Optimized for use on Ubuntu 24.04, ensuring compatibility and performance on this platform.
- **Ease of Use**: Provides simple commands for running and interacting with the container.

## Prerequisites

- **Operating System**: Ubuntu 24.04 (specifically tested on Joshua Riek's setup).
- **Docker**: Ensure Docker is installed and running on your system.

## Build Instructions

To build the Docker image, run the following script:

```bash
./build.sh
```

This script will create a Docker image named `orangepi5plus-gst-mpp`.

## Verification

After building the Docker image, you can verify the build by running:

```bash
./verify_build.sh
```

This script checks the functionality of the image and ensures everything is set up correctly.

## Usage

### Running the Container

To run the Docker container with hardware acceleration enabled, use the following command:

```bash
sudo docker run --network=host --privileged orangepi5plus-gst-mpp gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw ! mpph265enc ! h265parse ! matroskamux ! tcpserversink host=0.0.0.0 port=8888
```

This command starts a GStreamer pipeline that captures video from `/dev/video0`, encodes it using Rockchip's hardware-accelerated H.265 encoder, and streams it over a TCP server on port 8888.

### Interactive Usage

You can also run the container interactively for testing or development purposes:

```bash
sudo docker run -it --network=host --privileged orangepi5plus-gst-mpp /bin/bash
```

Inside the container, you can use GStreamer commands and other tools as you would on a standard Ubuntu system with hardware acceleration support.

## Directory Structure

- **Dockerfile**: The Dockerfile for setting up the environment.
- **libfiles/**: Contains the base requirements and libraries needed to enable hardware acceleration and run the GStreamer command.
- **build.sh**: Script to build the Docker image.
- **verify_build.sh**: Script to verify the Docker image functionality.

## Example Commands

Here are some example GStreamer commands you can run inside the container:

1. **Stream Video from Webcam**:
    ```bash
    gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw ! mpph265enc ! h265parse ! matroskamux ! tcpserversink host=0.0.0.0 port=8888
    ```

2. **Test Video Encoding**:
    ```bash
    gst-launch-1.0 videotestsrc ! video/x-raw,width=1280,height=720,framerate=30/1 ! mpph265enc ! h265parse ! matroskamux ! filesink location=test_video.mkv
    ```

## Known Issues

- This Docker image is tested only on Joshua Riek's Ubuntu 24.04 setup. It may not work correctly on other versions or distributions without modifications.

## Troubleshooting

If you encounter any issues, ensure that:
- Docker is properly installed and running.
- Your system meets the prerequisites.
- You are using Ubuntu 24.04 as tested.

For further assistance, refer to the Docker and GStreamer documentation or seek help from relevant community forums.
