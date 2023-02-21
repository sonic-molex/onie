#!/bin/sh

sudo apt-get update
sudo apt-get install -y build-essential stgit u-boot-tools \
    util-linux gperf device-tree-compiler python-all-dev \
    xorriso autoconf automake bison flex texinfo libtool \
    libtool-bin gawk libncurses5 libncurses5-dev bc \
    dosfstools mtools pkg-config git wget help2man libexpat1 \
    libexpat1-dev fakeroot python3-sphinx rst2pdf \
    libefivar-dev libnss3-tools libnss3-dev libpopt-dev \
    libssl-dev sbsigntool uuid-runtime uuid-dev cpio \
    bsdmainutils curl unzip libfreetype6-dev unifont \
    autopoint python2.7 python3 python3-pip libelf-dev

