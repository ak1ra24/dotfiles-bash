FROM ubuntu:18.04

WORKDIR /root

RUN apt update \
 && apt install -y git curl wget unzip vim

RUN git clone https://github.com/ak1ra24/dotfiles-bash.git dotfiles

RUN ./dotfiles/install.sh

