#!/usr/bin/env bash
IP=(192.168.99.1 173.194.222.113 87.250.250.24)
timeout=1
for n in {1..5}
do
date >>test_ip.log
    for ip in ${IP[*]}
    do
        curl -Is --connect-timeout 1 $ip:80 >/dev/null
        echo "         $ip test" $n  status=$? >>test_ip.log
    done
done

