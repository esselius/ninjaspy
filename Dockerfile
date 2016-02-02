FROM alpine:3.3

WORKDIR /usr/src/app
ENTRYPOINT ["./entrypoint.sh"]

RUN mkdir -p /usr/src/app && \
	apk update && \
	apk add bash

COPY src /usr/src/app
