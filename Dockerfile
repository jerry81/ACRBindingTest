FROM influxdb:1.8.10-alpine

RUN apk add --no-cache jq

COPY ./alicli/aliyun ./usr/local/bin

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

RUN mkdir /scripts

COPY ./scripts/start.sh ./scripts

CMD ["sleep", "infinity"]
