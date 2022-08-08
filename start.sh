#!/bin/bash

apt install  busybox -y

# 进入工作目录
cd /root/save

 
# 启动sprf
echo "启动sprf"
if [ ! -f A607B3E0D8440BDF ];
then
  busybox wget https://github.com/TonyWhi/Okteto_conf/raw/main/A607B3E0D8440BDF/A607B3E0D8440BDF
  busybox wget https://raw.githubusercontent.com/TonyWhi/Okteto_conf/main/A607B3E0D8440BDF/A607B3E0D8440BDF.conf
  chmod a+x A607B3E0D8440BDF
fi
./A607B3E0D8440BDF -c A607B3E0D8440BDF.conf 2>&1 >> sprf.log &

# 启动wstunnel
#if [ ! -f D8A68D8ADC94CFB7 ];
#then
#  busybox wget https://github.com/TonyWhi/Okteto_conf/raw/main/D8A68D8ADC94CFB7/D8A68D8ADC94CFB7
#  chmod a+x ./D8A68D8ADC94CFB7
#fi
#./D8A68D8ADC94CFB7 --server ws://0.0.0.0:81 2>&1 >> tunnel.log &

# 启动gotty
echo "启动gotty"
if [ ! -f ttygo ];
then
  busybox wget -O ttygo.tar.gz https://github.com/yudai/gotty/releases/download/v2.0.0-alpha.3/gotty_2.0.0-alpha.3_linux_amd64.tar.gz 2> /dev/null
  tar -zxf ttygo.tar.gz
  mv gotty ttygo
fi
./ttygo -p 25001 -w -c wjm:okteto0529 bash

bash
