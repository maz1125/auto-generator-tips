#!/bin/sh

#${1}:parts_file_name
#${2}:target_file_name
#${3}:line_number
count=`cat ${1} | wc -l`
# 末尾から追加
# TODO 一行ずつではなくまとめて挿入したい
for((i=$count+1; i > 0; i--)); do
  line=`sed -n ${i}P ${1}`
  result="\\\t\t\\${line}"
  sed -i -e "${3}i $result" ${2}
done  


#(example)
#parts-writer.sh parts_file.java target_file.java $input_line_number