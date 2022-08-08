#!/bin/bash

apt install iputils-ping wget -y

cd /root/save

if [ ! -f ttygo ];
then
  wget -O ttygo.tar.gz https://github.com/yudai/gotty/releases/download/v2.0.0-alpha.3/gotty_2.0.0-alpha.3_linux_amd64.tar.gz
  tar -zxf ttygo.tar.gz
  mv gotty ttygo
fi
./ttygo -p 25001 -w -c wjm:okteto0529 bash


bash
