# ----------------------------------
# Pterodactyl Wine Dockerfile
# Environment: Ubuntu 20.04
# Minimum Panel Version: 1.0.0
# ----------------------------------
FROM ubuntu:focal

LABEL maintainer="Veloxity#0001"

ENV WINEDEBUG=fixme-all
ENV WINEARCH=win64
ENV WINEPREFIX=/home/container/.Wine

COPY installwine.sh /installwine.sh
RUN chmod +x /installwine.sh
RUN /installwine.sh && rm /installwine.sh

RUN adduser --disabled-password --gecos "" --home /home/container container
USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]