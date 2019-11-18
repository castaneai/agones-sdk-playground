FROM golang:1.13-alpine AS builder
ENV GO111MODULE=on
RUN apk add --no-cache git
WORKDIR /go/src/agones-sdk-playground
COPY . /go/src/agones-sdk-playground
RUN go build -o /bin/agones-sdk-playground cmd/main.go

FROM alpine
RUN apk add --no-cache ca-certificates && update-ca-certificates
ENV SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
ENV SSL_CERT_DIR=/etc/ssl/certs
WORKDIR /run
COPY --from=builder /bin/agones-sdk-playground /bin/agones-sdk-playground
ENTRYPOINT ["/bin/agones-sdk-playground"]
