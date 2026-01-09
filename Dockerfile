FROM ubuntu:22.04

# Install any needed packages specified in requirements.txt
RUN apt update && \
    apt install -y \
# Development files
    build-essential \
    git \
    bzip2 \
    upx \
    wget && \
    apt clean
#
ARG CMAKE_VERSION=4.1.2
# Get Cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh \
    -q -O /tmp/cmake-install.sh \
    && chmod u+x /tmp/cmake-install.sh \
    && mkdir /usr/bin/cmake \
    && /tmp/cmake-install.sh --skip-license --prefix=/usr/bin/cmake \
    && rm /tmp/cmake-install.sh \
    && rm -rf /usr/local/cmake/man /usr/local/cmake/doc
#
ENV PATH="/usr/bin/cmake/bin:${PATH}"
