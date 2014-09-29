#!/bin/bash
# 用Shell编程，判断一文件是不是字符设备文件，如果是将其拷贝到 /dev 目录下。
# 这里我们将检查字符设备改为检查普通文件

#echo $#
[ $# -lt 1 ] && echo "Usage:./mv_regfile.sh filename" && exit
fileinfo=$(ls -ld $1)
echo $fileinfo | grep "^-.*" > /dev/null
if [ $? -eq 0 ]
then
	echo "regular file"
fi
