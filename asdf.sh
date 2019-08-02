#!/bin/bash

cat << EOF >> /root/.mastercorecoincore/mastercorecoin.conf
addnode=45.32.36.18
addnode=202.182.101.162
addnode=149.28.31.156
addnode=45.63.121.56
addnode=149.28.19.210
addnode=107.191.53.220
addnode=45.77.183.241
addnode=45.76.52.233
addnode=198.13.37.49
addnode=45.77.29.239
addnode=128.199.171.192
addnode=45.77.21.70
addnode=198.13.38.119
addnode=45.32.39.247
addnode=95.179.154.9
addnode=157.230.123.11
addnode=104.248.141.211
addnode=178.128.54.41
addnode=204.48.26.40
addnode=207.154.201.240
addnode=159.89.151.147
addnode=167.99.206.80
addnode=138.68.103.119
addnode=134.209.225.16
addnode=159.65.139.78
addnode=68.183.64.70
addnode=104.248.157.119:34652
addnode=104.248.39.113:29871
addnode=112.162.233.135:50514
addnode=113.10.36.11:60418
addnode=128.199.155.59:55256
addnode=128.199.167.13:29871
addnode=128.199.171.192:37988
addnode=128.199.175.9:42000
addnode=128.199.251.99:47266
addnode=134.209.108.46:60394
addnode=134.209.108.51:49510
addnode=134.209.225.16:58492
addnode=134.209.233.131:52286
addnode=134.209.240.245:51216
addnode=134.209.246.108:42116
EOF


tmpIPv6=$(curl -s6 icanhazip.com)
setIPv6=`echo ${tmpIPv6} | cut -d':' -f -4`
for (( i = 1; i <= $SET_NUM; i++)); do  #NODEIPv6에 포트셋팅  /etc/network/interfaces에서 쓰일 변수 생성
  mn_IPv6[$i]=${setIPv6}::$i            #mn_IPv6[1~6]에   IPv6:1 ~ 6 값 생성
  #echo "mn_IPv6[$i] : ${mn_IPv6[$i]}"
done
for (( i = 1; i <= 6; i++)); do
  sed -i "9cexternalip=[${mn_IPv6[$i]}]:29871"  /root/.mastercorecoincore$i/mastercorecoin.conf
done
