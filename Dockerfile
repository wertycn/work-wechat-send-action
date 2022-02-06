FROM alpine:3.10
COPY bin/ /opt/bin/
COPY template/ /opt/template/
RUN apk update \
    && apk add --no-cache curl jq  \
    && rm -rf /var/cache/apk/* \
ENTRYPOINT ["/opt/bin/entrypoint.sh"]

