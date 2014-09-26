#/bin/bash
# 编写个shell脚本将当前目录下大于10K的文件转移到/tmp目录下
# 略过目录

files=`ls`
for i in $files
do
 	ls -ld $i | grep '^d' > /dev/null && continue
	length=`ls -l $i | cut -d " " -f 5`
	if [ $length -gt 10240 ] 
	then  
		echo $i:$length
	fi 
done
