#!/bin/bash

if [[ -f task.list ]]
   then
      rm task.list
fi
COUNTER=0
FILES=$(find -maxdepth 2 -mindepth 2 -name "run.sh" | sort)
for i in $FILES
   do
      NAME=`basename $i`
      DIR=`dirname $i`
      echo "$DIR/$NAME"
      COUNTER=$[$COUNTER +1]
      echo "##### ${COUNTER} #####" >> task.list
      echo "$DIR/$NAME" >> task.list
done

