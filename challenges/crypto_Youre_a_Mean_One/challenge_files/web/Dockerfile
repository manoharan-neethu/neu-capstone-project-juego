FROM httpd:latest

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libimage-exiftool-perl \
        git \
    && apt-get clean

EXPOSE 80
