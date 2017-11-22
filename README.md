# Dockerfile PDF generation from doxygen

## Installation

Note: This image use tex distribution texlive

```
git clone https://github.com/arialwhite/docker-doxygen-to-pdf.git
cd docker-doxygen-to-pdf
docker build . -t doxy
```
## Usage

```

// for example ./doxygen-demo is a directory that contains Doxyfile
docker run -it -v "$PWD/doxygen-demo:/usr/src/project" --rm doxy /bin/bash

doxy> cd /usr/src/project
doxy> doxygen // generate doc.tex for example
doxy> cd latex
doxy> pdflatex doc.tex