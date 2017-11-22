FROM ubuntu:xenial

LABEL Description="Docker image to generate PDF from doxygen" Vendor="Julian Guillotel" Version="1.0"

RUN apt-get update -y\
    && apt-get -y install apt-transport-https curl\
    && apt-get install -y texlive-full\
    && apt-get install -y perl make g++ cmake\
    && apt-get install -y pandoc\
    && apt-get install -y doxygen flex bison graphviz flex ghostscript