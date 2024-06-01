FROM debian

RUN apt-get -y update && \
    apt-get -y install wget zlib1g libglpk40 libarmadillo11

WORKDIR /app

RUN wget -O /tmp/seidr.sh https://github.com/bschiffthaler/seidr/releases/download/0.14.2/seidr-0.14.2-Linux.sh && \
    chmod +x /tmp/seidr.sh && \
    /tmp/seidr.sh --skip-license --prefix=/app

USER 1000

ENTRYPOINT ["/app/launcher.sh"]
