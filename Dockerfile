FROM influxdb:1.8.10-alpine

COPY ./alicli/aliyun ./usr/local/bin

CMD ["sleep", "infinity"]
