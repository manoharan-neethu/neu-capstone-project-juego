FROM ubuntu:latest

USER root

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libimage-exiftool-perl \
        git \
    && apt-get clean

ENTRYPOINT ["/usr/local/apache2/htdocs/init.sh"]

EXPOSE 80
