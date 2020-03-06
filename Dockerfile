FROM ubuntu:18.04

WORKDIR /root

RUN apt update \
 && apt install -y git curl wget unzip vim


