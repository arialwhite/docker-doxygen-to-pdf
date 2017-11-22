FROM ubuntu:xenial

LABEL Description="Docker image to generate PDF from doxygen" Vendor="Julian Guillotel" Version="1.0"

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889\
    && echo "deb http://miktex.org/download/ubuntu xenial universe" | tee /etc/apt/sources.list.d/miktex.list\
    && apt-get update -y\
    && apt-get -y install apt-transport-https curl\
    && apt-get install -y perl cmake\
    && apt-get install -y miktex\
    && apt-get install -y doxygen flex bison graphviz flex\
    && apt-get install -y make g++ texlive-latex-base ghostscript\
    && initexmf --admin --force --mklinks\
    && mpm --admin --install amsfonts\
    && initexmf --admin --mkmaps\
    && initexmf --admin --update-fndb\
    && useradd -md /miktex miktex
RUN mkdir /miktex/work
RUN mkdir /miktex/.miktex
WORKDIR /miktex/work