#!/bin/bash

aliyun configure set --mode AK --region cn-shanghai --access-key-id $OSS_AK --access-key-secret $OSS_AK_SECRET

curDate=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

touch "./scripts/$curDate.txt"

$curdate > ./scripts/$curDate.txt

aliyun oss cp ./scripts/$curDate.txt ${OSS_BASE_URL}