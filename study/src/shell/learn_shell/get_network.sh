#!/bin/bash
# 编写shell脚本获取本机的网络地址

#得到包含IP地址和子网掩码的那一行
ip_and_mask=`ifconfig | grep "inet addr" | head -n 1`

#提取ip地址
ip=`echo $ip_and_mask | cut -d " " -f 2 | cut -d ":" -f 2`
#将ip地址各个字段分割为数组,数组下标从0开始
ip_arr=($(echo $ip | sed 's/\./ /g'))

#获取掩码的地址
mask=`echo $ip_and_mask | cut -d " " -f 4 | cut -d ":" -f 2`
#将mask的各个字段分割开
mask_arr=($(echo $mask | sed 's/\./ /g'))

#获取网络地址
for i in `seq 0 3`
do
	network_arr[$i]=$((${ip_arr[$i]}&${mask_arr[$i]}))
done
#组装网络地址
network=`echo ${network_arr[@]} | sed 's/ /\./g'`
#echo $network

#输出最终的结果
echo $network/$mask
