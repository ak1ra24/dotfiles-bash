FROM ubuntu:18.04

WORKDIR /root

ENV LANG="ja_JP.UTF8"\
    LC_NUMERIC="ja_JP.UTF8"\
    LC_TIME="ja_JP.UTF8"\
    LC_MONETARY="ja_JP.UTF8"\
    LC_PAPER="ja_JP.UTF8"\
    LC_MEASUREMENT="ja_JP.UTF8"

RUN apt update \
 && apt install -y git curl wget unzip vim language-pack-ja

RUN git clone https://github.com/ak1ra24/dotfiles-bash.git dotfiles

RUN ./dotfiles/install.sh

