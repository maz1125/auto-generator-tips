#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

#####
## properties�t�@�C������w�肵���ϐ����擾���邽�߂̊֐�
## ${1} property_name
## ${2} property_file_name
#####
function PropertyLoader(){
  #propertyLine=$(grep ${1} -n ${2});
  propertyLine=$(grep $1 -n $2);
  PROPERTY_VALUE=`echo $propertyLine | sed -e "s#.*=##g"`
  echo $PROPERTY_VALUE
}

#(example)
# layout.properties����application.contents_name���擾����
CONTENTS_NAME=`PropertyLoader application.contents_name layout.properties`
