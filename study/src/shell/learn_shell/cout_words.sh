#!/bin/bash
# 统计指定单词出现次数

if [ $# -lt 1 ]	
then 
	echo -e "ERROR:You should input 2 words at least\n"
	echo -e "Usage:./count_word.sh filename word\n"
	exit -1
fi

FILE=$1
((words_num=$#-1))
for i in `seq $words_num`
do
# shift 命令每次都将命令行参数向左移动一个
# 因此，当前的命令行参数总为$1
	shift
	num=$(cat $FILE | sed -e 's/[^A-Za-z]/\n/g' | sed '/^$/d' | \
		 			grep "^$1$" | uniq -c | sed 's/[^0-9]//g')
	echo -e "the number of '$1' is $num\n"
done
