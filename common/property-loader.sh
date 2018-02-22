#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)

#####
## propertiesファイルから指定した変数を取得するための関数
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
# layout.propertiesからapplication.contents_nameを取得する
CONTENTS_NAME=`PropertyLoader application.contents_name layout.properties`
