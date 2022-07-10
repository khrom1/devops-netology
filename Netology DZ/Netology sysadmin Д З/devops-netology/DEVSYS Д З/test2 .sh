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


#!/usr/bin/env bash
IP=(192.168.0.1 173.194.222.113 87.250.250.24)
timeout=1
stat=0
while [$stat == 0]
do
    for ip in ${IP[*]}
    do
        curl -Is --connect-timeout 1 $ip:80 >/dev/null
        echo  date "       ERROR $ip "  status=$? >>2_test_ip.log
    done
done

#!/usr/bin/env bash
IP=(192.168.0.1 173.194.222.113 87.250.250.24)
timeout=1
stat=0
while (($stat == 0))
do
    for ip in ${IP[*]}
    do
        curl -Is --connect-timeout 1 $ip:80 >/dev/null
        echo $date "      ERROR $ip "  status=$? >>2_test_ip.log

      fi
   done
done
