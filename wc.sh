# 计算一共有多少文件，包含 htm css js
file_count=`find ./ -regextype "posix-egrep" -iregex ".*/.*(css|html|js)" | wc -l`

# 查找过程模拟
find ./ -type f -regextype "posix-egrep" -iregex ".*/.*\.(css|html|js)" -exec wc -l {} \;

# 这些文件分别有多少行，保存到文件
find ./ -type f -regextype "posix-egrep" -iregex ".*/.*\.(css|html|js)" -exec wc -l {} \; > wc.txt

# 计算一共有多少行
total_lines=`awk 'BEGIN{res=0;}{res+=$1}END{print res}' wc.txt`



# 删除中间文件
rm -rf wc.txt

echo "===================="
echo
date +"%F %H:%M"
echo
echo "Total Files: $file_count"
echo -e "Total Lines: \033[31m$total_lines\033[0m"
echo "===================="


# 结果保存到文件
echo "====================" >> hangshu.txt
date +"%F %H:%M" >> hangshu.txt
echo >> hangshu.txt
echo "Total Files: $file_count" >> hangshu.txt
echo -e "Total Lines: $total_lines" >> hangshu.txt
echo "====================" >> hangshu.txt

