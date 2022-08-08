#!/bin/bash

apt install iputils-ping busybox -y

#进入工作目录
cd /root/save


#启动gotty
if [ ! -f ttygo ];
then
  busybox wget -O ttygo.tar.gz https://github.com/yudai/gotty/releases/download/v2.0.0-alpha.3/gotty_2.0.0-alpha.3_linux_amd64.tar.gz
  tar -zxf ttygo.tar.gz
  mv gotty ttygo
fi
./ttygo -p 25001 -w -c wjm:okteto0529 bash


bash
