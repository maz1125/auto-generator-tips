#!/bin/sh

#${1}:start_line_number
#${2}:end_line_number
#${3}:target_file_name
# endから削除
for((i=${2}; i >= ${1}; i--)); do
  sed -i -e "${i}d" ${3}
done

#(example)
#delete-line.sh $start_line_number $end_line_number $target_file_name