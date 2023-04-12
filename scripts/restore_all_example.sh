#!/bin/bash

aliyun configure set --mode AK --region cn-shanghai --access-key-id $OSS_AK --access-key-secret $OSS_AK_SECRET


mkdir tmp
cd tmp

aliyun oss cp oss://influx-backup-staging -r .

for d in */ ; do
    influxd restore -host $INFLUX_HOST -db lcm -rp asset_values_retention_policy -portable -newdb tmp $d
    influx -host $INFLUX_HOST -ssl -username $INFLUX_USERNAME -password $INFLUX_PASSWORD -execute 'SELECT * INTO "fullrestoretest".asset_values_retention_policy.:MEASUREMENT FROM "tmp".asset_values_retention_policy./.*/ GROUP BY *'
    influx -host $IH -ssl -username $INFLUX_USERNAME -password $INFLUX_PASSWORD -execute 'DROP DATABASE "tmp"'
done
cd ..
rm -rf tmp
echo "rm rf complete"