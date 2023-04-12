#!/bin/bash

full="ts-uf6x8u0he9085cr6m.influxdata.tsdb.aliyuncs.com:8088"
echo "length is $l"
echo "l is $l"
partial=${full:0:$((${#full}-5))}
echo "partial is $partial"

# lessons: '#'' is length of string operator like python
# lesson ${} treats everything unquoted inside as a var
# arithmetic uses (())
# substring with :