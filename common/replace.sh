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
## �u�����Ώۂ̕������z��Ƃ��ēn��(�G�X�P�[�v���K�v�Ȃ��̂��u���\)
## Format��\"�u���O�̕�����#�u����̕�����\"
## args=(\"GalleryApplication#HogeApplication\" \"ImplGallery#HogeService\" \"\\.impl#.hoge\")
## �ϐ��̔z��ƁATarget�t�@�C�����A�ۑ��������t�@�C�����������œn��
## replace.sh "(${args[*]})" ImplGalleryService.java HogeService.java
