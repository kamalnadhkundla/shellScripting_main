# write a script to check if a perticular p[ackage is installed or not

#!/bin/bash
PACKAGE=$1
$PACKAGE -h >>/dev/null
if [ $? -eq 0]:; then
    echo "$PACKAGE IS INSTALLED"
else
    echo "$PACKAGE IS NOT INSTALLED"
fi

#checking multiple apps with a single script

#!/bin/bash
for item in unzip giridhara jq venkat tree rebelstar; do
    bash package.sh $item
    echo '-----------------------------------'
done
