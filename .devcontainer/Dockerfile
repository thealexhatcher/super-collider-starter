FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -q 
RUN apt-get install -qy apt-utils 
RUN apt-get dist-upgrade 
RUN apt-get install -qy \
    sudo \ 
    bzip2 \ 
    unzip \ 
    build-essential \
    git \ 
    ca-certificates \ 
    cmake \ 
    pkg-config \
    wget
    
RUN apt-get install -qy \
    libsndfile1-dev \
    libasound2-dev \
    libavahi-client-dev \ 
    libicu-dev \
    libreadline6-dev \ 
    libncurses5-dev \
    libfftw3-dev \ 
    libxt-dev \
    libudev-dev \ 
    libjack-jackd2-dev

#https://github.com/supercollider/supercollider/wiki/Installing-SuperCollider-from-source-on-Ubuntu
#START: SC3
RUN mkdir /tmp/sc3 \
    && git clone --recursive https://github.com/supercollider/supercollider.git /tmp/sc3
RUN mkdir /tmp/sc3/build
WORKDIR /tmp/sc3/build
RUN cmake -DCMAKE_BUILD_TYPE="Release" -DNATIVE=ON -DBUILD_TESTING=OFF -DENABLE_TESTSUITE=OFF -DSUPERNOVA=OFF -DSSE=OFF -DSSE2=OFF -DSC_IDE=OFF -DSC_QT=OFF -DSC_ED=OFF -DSC_EL=OFF .. \
    && make \
    && make install
#END: SC3

#START: SC3 Plug-Ins
RUN mkdir /tmp/sc3-plugins \
    && git clone --recursive https://github.com/supercollider/sc3-plugins.git /tmp/sc3-plugins
RUN mkdir /tmp/sc3-plugins/build
WORKDIR /tmp/sc3-plugins/build
RUN cmake -DCMAKE_BUILD_TYPE="Release" -DNATIVE=ON -DBUILD_TESTING=OFF -DENABLE_TESTSUITE=OFF -DSUPERNOVA=OFF -DSSE=OFF -DSSE2=OFF -DSC_IDE=OFF -DSC_QT=OFF -DSC_ED=OFF -DSC_EL=OFF -DSC_PATH=/tmp/sc3 .. \
    && make \
    && make install
#END: SC3 Plug-Ins
WORKDIR /tmp

RUN useradd -ms /bin/bash vscode
RUN usermod -aG audio vscode
RUN usermod -aG sudo vscode
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER vscode
