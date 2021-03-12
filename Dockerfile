FROM golang:1.16.2-alpine3.13 as build
LABEL maintainer="Ryan Schlesinger <ryan@outstand.com>"

RUN apk add --no-cache git

COPY . /opt/registrator

RUN set -eux; \
  \
  cd /opt/registrator; \
  go build -o /bin/registrator


FROM alpine:3.13
COPY --from=build /bin/registrator /bin/registrator

ENTRYPOINT ["/bin/registrator"]
