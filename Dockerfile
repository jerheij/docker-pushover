FROM docker.io/alpine:latest
COPY root /
RUN apk update && \
    apk add openssl curl bash && \
    rm -rf /var/cache/apk/* 

ENTRYPOINT ["pushover.sh"]

CMD ["/bin/sh"]