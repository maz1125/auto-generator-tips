#!/bin/sh

OUTPUT_TEXT_NAME=output.text
eval args=$1
sed_args=
sed_head="-e s#"
sed_end="#g "
for ((i = 0; i < ${#args[@]}; i++)) {
    sed_args=${sed_args}${sed_head}
    sed_args=${sed_args}${args[i]}
    sed_args=${sed_args}${sed_end}
}
sed ${sed_args} $2 > $OUTPUT_TEXT_NAME
rm $2
mv $OUTPUT_TEXT_NAME $3
echo Created ${3}
echo ${CURRENT_DIR}/${3} >>$LOGFILE_PATH/$LOGFILE_NAME

#(example)
## 置換え対象の文字列を配列として渡す(エスケープが必要なものも置換可能)
## Formatは\"置換前の文字列#置換後の文字列\"
## args=(\"GalleryApplication#HogeApplication\" \"ImplGallery#HogeService\" \"\\.impl#.hoge\")
## 変数の配列と、Targetファイル名、保存したいファイル名を引数で渡す
## replace.sh "(${args[*]})" ImplGalleryService.java HogeService.java
