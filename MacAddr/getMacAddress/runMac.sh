#!/bin/bash
cd `dirname $0`
echo $(cd `dirname $0`; pwd)
port_array=(18090 18091 18092 18093 18094)
is_port_free(){
if ! lsof -i:$1
then
    return 0
else
    return 1
fi
}
start_up()
{
./Contents/Home/bin/java -jar macaddr-1.0.jar --server.port=$1
}
errorLog()
{
echo "18090,18091,18092,18093,18094端口都已被占用！"
}
for((i=0;i<${#port_array[*]};i++))
do
    is_port_free ${port_array[i]}
    if [ $? -eq 0 ];then
start_up ${port_array[i]}
break
    fi
    if [ $i -eq 4 ];then
errorLog
    fi
done
