#!/bin/bash
echo "=========================="
echo "= 批量修改文件后缀的脚本 ="
echo "=========================="
read -p "请输入原后缀：" src
if [ -z $src ];then
	echo "您未输入后缀！Bye-bye!"
	sleep 2
	exit 1	
fi
ls *.$src > /dev/null
if [ $? -eq 0 ];then
	echo "符合条件的文件如下："
	ls *.$src
else
	sleep 2
	exit 2
fi
echo "=========================="
read -p "请输入目标后缀：" des
sleep 0.3
echo "=========================="
for file in `ls *.$src`
do
	no_houzhui=${file%$src}
	result=$no_houzhui$des
	mv $file $result
	echo "$file ==> $result"
done
echo
echo "===========结果==========="
echo
ls *.$des
echo
sleep 2
