#!/bin/bash

aliyun configure set --mode AK --region cn-shanghai --access-key-id $OSS_AK --access-key-secret $OSS_AK_SECRET

lastUpdatedTime=$(aliyun oss cat ${OSS_BASE_URL}/lastUpdate.txt | head -1)

backupresult=$(influxd backup -portable -host $INFLUX_HOST -start $lastUpdatedTime tmp | grep "backup complete:

if [ -z "$backupresult" ]
then
  echo "backup failed"
  exit -1
fi

curDate=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

aliyun oss mkdir ${OSS_BASE_URL}//$curDate

aliyun oss cp ./tmp ${OSS_BASE_URL}//$curDate -r -f

touch ./scripts/curDate.txt

$curdate > ./scripts/curDate.txt

aliyun oss cp ./scripts/curDate.txt ${OSS_BASE_URL}//lastUpdate.txt

echo "done"