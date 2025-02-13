#!/bin/bash
: << 'COMMENT'
pwd 
ls
echo "what is your name"
read PERSON
echo "hello, $PERSON"
today=$(date)
echo "$today" '
COMMENT
#name="giri"
#readonly name
#unset name

: << 'COMMENT'
echo $0
echo "$1"
echo $2
echo $3
echo $n
echo $#
echo $*
echo $@
echo $$
echo $!
echo $?
COMMENT

for name in $*
do 
  echo $name
done