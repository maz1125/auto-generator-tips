#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

#####
## propertiesファイルに値を反映させるための関数
## ${1} property_name
## ${2} property
## ${3} property_file_name
#####
function PropertyRegister(){
  propertyLine=$(grep $1 -n $3);
  PROPERTY_LINE_NUMBER=`echo $propertyLine | sed -e "s#:.*##g"`
  sed -i -e "${PROPERTY_LINE_NUMBER}a ${1}=${2}" $3
  sed -i -e "${PROPERTY_LINE_NUMBER}d" $3
}

#(example)
#layout.propertiesにapplication.contents_nameをNewServiceContentsとして登録
PropertyRegister application.contents_name NewServiceContents layout.properties
