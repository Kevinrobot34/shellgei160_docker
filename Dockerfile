FROM ubuntu:20.04

RUN apt-get update && \
    yes | unminimize && \
    apt-get install -y man bc sudo locales gawk && \
    locale-gen ja_JP.UTF-8

# Language setting
ENV LANG=ja_JP.UTF-8

# Settings of user
ARG USERNAME=docker
ARG GROUPNAME=docker
ARG UID=1000
ARG GID=1000
ARG PASSWORD=docker
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd
USER $USERNAME

WORKDIR /shellgei