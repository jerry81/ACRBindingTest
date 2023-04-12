#!/bin/bash

full="ts-uf6x8u0he9085cr6m.influxdata.tsdb.aliyuncs.com:8088"
l=${#full}
echo "length is $l"
l=$((l-5))
echo "l is $l"
partial=${full:0:$l}
echo "partial is $partial"