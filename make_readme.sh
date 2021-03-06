#!/bin/bash


> README.md

IFS=''
active='0';
cat  hot-autocomplete.html | while read -r "line";do


  echo $line | grep '\-\->' > /dev/null
  if [ $active = '1' -a $? = '0' ];then 
    exit 0;
  fi;

  suppress=0;
  echo $line | grep '^ *@' > /dev/null
  if [ $? = '0' ];then suppress='1'; fi;
  

  if [ $active = '1' -a $suppress = '0' ];then echo $line >> README.md;fi;

  echo $line | grep "<!--" > /dev/null
  if [ $? = '0' ];then active='1'; fi;

done
