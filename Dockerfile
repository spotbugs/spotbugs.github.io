# This Dockerfile is to build Docker image,
# which can generate sphinx documents with Markdown (commonmark) support.
# Run `docker build -t spotbugs-sphinx .` to build docker image,
# and run `docker run -it -v $(pwd):/documents spotbugs-sphinx` to generate documents.

FROM ubuntu:latest
MAINTAINER skypencil@gmail.com
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir documents
RUN apt-get update
RUN apt-get install -y python-sphinx texlive texlive-latex-extra pandoc build-essential python-pip

# CommonMark 0.6 has broken compatibility, so we should specify version as below
# https://github.com/rtfd/recommonmark/issues/24
RUN pip install commonmark==0.5.4 recommonmark==0.4.0

WORKDIR /documents
VOLUME /documents

CMD ["/usr/bin/make", "html"]
