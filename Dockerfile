FROM golang:1 AS build-env

RUN go get github.com/google/skicka
WORKDIR /go/src/github.com/google/skicka
RUN CGO_ENABLED=0 go build

FROM alpine
COPY --from=build-env /go/src/github.com/google/skicka/skicka /usr/local/bin/skicka

WORKDIR /

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
