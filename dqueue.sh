#!/bin/bash

SENDER="$1"
RECIPIENT="$2"

[ "$1" = "-q" ] && /opt/zimbra/common/sbin/mailq && exit

#si un parametro es vacio - ERROR
if [[ -z $SENDER || -z $RECIPIENT ]]; then
	echo "Error de Parametros -> 1. sender(all) - 2. recipient(all)"
	exit 1
elif [[ $SENDER = "all" ]]; then
	VERIFY_PARAMS="\$8 ~ \"$RECIPIENT\""

elif [[ $RECIPIENT = "all" ]]; then
	VERIFY_PARAMS="\$7 == \"$SENDER\""

else
	VERIFY_PARAMS="(\$7 == \"$SENDER\") && (\$8 ~ \"$RECIPIENT\")"
fi


consult="/opt/zimbra/common/sbin/mailq | tail -n +2 | head -n -2 | grep -v '^ *(' | awk 'BEGIN { RS = \"\" } { if ( ${VERIFY_PARAMS} ) print \$1}' | tr -d '*!'"

filter=$( eval "${consult}")

for ID_Queue in $filter
do
	/opt/zimbra/common/sbin/postsuper -d $ID_Queue
done
