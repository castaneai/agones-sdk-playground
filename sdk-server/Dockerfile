FROM alpine as downloader
ENV AGONES_VERSION 1.1.0
RUN apk add wget zip \
    && wget https://github.com/googleforgames/agones/releases/download/v${AGONES_VERSION}/agonessdk-server-${AGONES_VERSION}.zip \
    && unzip agonessdk-server-${AGONES_VERSION}.zip

FROM alpine
COPY --from=downloader /sdk-server.linux.amd64 /bin/sdk-server.linux.amd64
ENTRYPOINT /bin/sdk-server.linux.amd64 --local
