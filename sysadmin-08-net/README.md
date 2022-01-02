# Домашнее задание к занятию "3.8. Компьютерные сети, лекция 3"

# Задание 1. Подключитесь к публичному маршрутизатору в интернет. Найдите маршрут к вашему публичному IP
```
telnet route-views.routeviews.org
Username: rviews
show ip route x.x.x.x/32
show bgp x.x.x.x/32
```
 ### Ответ:
  ```bash
 route-views>show ip route  95.165.27.58
Routing entry for 95.165.0.0/16
  Known via "bgp 6447", distance 20, metric 0
  Tag 3356, type external
  Last update from 4.68.4.46 1w6d ago
  Routing Descriptor Blocks:
  * 4.68.4.46, from 4.68.4.46, 1w6d ago
      Route metric is 0, traffic share count is 1
      AS Hops 3
      Route tag 3356
      MPLS label: none
route-views>show bgp  95.165.27.58
BGP routing table entry for 95.165.0.0/16, version 1957709908
Paths: (23 available, best #9, table default)
  Not advertised to any peer
  Refresh Epoch 1
  53767 14315 6453 6453 3356 8359 25513
    162.251.163.2 from 162.251.163.2 (162.251.162.3)
      Origin IGP, localpref 100, valid, external
      Community: 14315:5000 53767:5000
      path 7FE0CDC49D10 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  3333 8359 25513
    193.0.0.56 from 193.0.0.56 (193.0.0.56)
      Origin IGP, localpref 100, valid, external
      Community: 0:151 8359:100 8359:5500 8359:55277
      path 7FE09B906118 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  6939 8359 25513
    64.71.137.241 from 64.71.137.241 (216.218.252.164)
      Origin IGP, localpref 100, valid, external
      path 7FE0C2FA7188 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  1351 8359 25513
    132.198.255.253 from 132.198.255.253 (132.198.255.253)
      Origin IGP, localpref 100, valid, external
      path 7FE036E35668 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  20912 3257 3356 8359 25513
    212.66.96.126 from 212.66.96.126 (212.66.96.126)
      Origin IGP, localpref 100, valid, external
      Community: 3257:8070 3257:30515 3257:50001 3257:53900 3257:53902 20912:65004
      path 7FE03CAA4170 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 2
  8283 8359 25513
    94.142.247.3 from 94.142.247.3 (94.142.247.3)
      Origin IGP, metric 0, localpref 100, valid, external
      Community: 0:151 8283:1 8283:101 8359:100 8359:5500 8359:55277
      unknown transitive attribute: flag 0xE0 type 0x20 length 0x18
        value 0000 205B 0000 0000 0000 0001 0000 205B
              0000 0005 0000 0001
      path 7FE0FE2B41D8 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  57866 3356 8359 25513
    37.139.139.17 from 37.139.139.17 (37.139.139.17)
      Origin IGP, metric 0, localpref 100, valid, external
      Community: 0:151 3356:2 3356:22 3356:100 3356:123 3356:519 3356:903 3356:2094 8359:100 8359:5500 8359:55277
      path 7FE114A61350 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  3549 3356 8359 25513
    208.51.134.254 from 208.51.134.254 (67.16.168.191)
      Origin IGP, metric 0, localpref 100, valid, external
      Community: 0:151 3356:2 3356:22 3356:100 3356:123 3356:519 3356:903 3356:2094 3549:2581 3549:30840 8359:100 8359:5500 8359:55277
      path 7FE11A1489E0 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  3356 8359 25513
    4.68.4.46 from 4.68.4.46 (4.69.184.201)
      Origin IGP, metric 0, localpref 100, valid, external, best
      Community: 0:151 3356:2 3356:22 3356:100 3356:123 3356:519 3356:903 3356:2094 8359:100 8359:5500 8359:55277
      path 7FE149F1BFC8 RPKI State not found
      rx pathid: 0, tx pathid: 0x0
  Refresh Epoch 1
  20130 6939 8359 25513
    140.192.8.16 from 140.192.8.16 (140.192.8.16)
      Origin IGP, localpref 100, valid, external
      path 7FE1779FF2C8 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  101 3356 8359 25513
    209.124.176.223 from 209.124.176.223 (209.124.176.223)
      Origin IGP, localpref 100, valid, external
      Community: 0:151 101:20100 101:20110 101:22100 3356:2 3356:22 3356:100 3356:123 3356:519 3356:903 3356:2094 8359:100 8359:5500 8359:55277
      Extended Community: RT:101:22100
      path 7FE11387B5A8 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  852 3356 8359 25513
    154.11.12.212 from 154.11.12.212 (96.1.209.43)
      Origin IGP, metric 0, localpref 100, valid, external
      path 7FE16EBB5F80 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  2497 8359 25513
    202.232.0.2 from 202.232.0.2 (58.138.96.254)
      Origin IGP, localpref 100, valid, external
      path 7FE0EF49C900 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 3
  3303 8359 25513
    217.192.89.50 from 217.192.89.50 (138.187.128.158)
      Origin IGP, localpref 100, valid, external
      Community: 0:151 3303:1004 3303:1006 3303:1030 3303:3054 8359:100 8359:5500 8359:55277
      path 7FE114A0E0F0 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  7018 3356 8359 25513
    12.0.1.63 from 12.0.1.63 (12.0.1.63)
      Origin IGP, localpref 100, valid, external
      Community: 7018:5000 7018:37232
      path 7FE0DEEE2610 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  3561 3910 3356 8359 25513
    206.24.210.80 from 206.24.210.80 (206.24.210.80)
      Origin IGP, localpref 100, valid, external
      path 7FE11EBA3498 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  4901 6079 8359 25513
    162.250.137.254 from 162.250.137.254 (162.250.137.254)
      Origin IGP, localpref 100, valid, external
      Community: 65000:10100 65000:10300 65000:10400
      path 7FE03A37A528 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  7660 2516 1299 8359 25513
    203.181.248.168 from 203.181.248.168 (203.181.248.168)
      Origin IGP, localpref 100, valid, external
      Community: 2516:1030 7660:9003
      path 7FE115379470 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  49788 12552 8359 25513
    91.218.184.60 from 91.218.184.60 (91.218.184.60)
      Origin IGP, localpref 100, valid, external
      Community: 12552:12000 12552:12100 12552:12101 12552:22000
      Extended Community: 0x43:100:1
      path 7FE0FC0C0050 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  1221 4637 3356 8359 25513
    203.62.252.83 from 203.62.252.83 (203.62.252.83)
      Origin IGP, localpref 100, valid, external
      path 7FE164D88E08 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  701 3356 8359 25513
    137.39.3.55 from 137.39.3.55 (137.39.3.55)
      Origin IGP, localpref 100, valid, external
      path 7FE0351DC0E8 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  3257 3356 8359 25513
    89.149.178.10 from 89.149.178.10 (213.200.83.26)
      Origin IGP, metric 10, localpref 100, valid, external
      Community: 3257:8794 3257:30043 3257:50001 3257:54900 3257:54901
      path 7FE161560D88 RPKI State not found
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  19214 3257 3356 8359 25513
    208.74.64.40 from 208.74.64.40 (208.74.64.40)
      Origin IGP, localpref 100, valid, external
      Community: 3257:8108 3257:30048 3257:50002 3257:51200 3257:51203
      path 7FE00ADFDF28 RPKI State not found
      rx pathid: 0, tx pathid: 0
route-views>


  ```

# Задание 2. Создайте dummy0 интерфейс в Ubuntu. Добавьте несколько статических маршрутов. Проверьте таблицу маршрутизации.

 ### Ответ:
  ```bash
 khrom@srv-1:~$ ifconfig -a | grep dummy
dummy0: flags=130<BROADCAST,NOARP>  mtu 1500
dummy1: flags=130<BROADCAST,NOARP>  mtu 1500
khrom@srv-1:~$ ifconfig -a
dummy0: flags=130<BROADCAST,NOARP>  mtu 1500
        ether ce:cf:93:6e:6c:57  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

dummy1: flags=130<BROADCAST,NOARP>  mtu 1500
        ether 06:d2:f4:1a:71:bb  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enp4s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.99.30  netmask 255.255.255.0  broadcast 192.168.99.255
        inet6 fe80::540f:ea44:8897:824a  prefixlen 64  scopeid 0x20<link>
        ether c8:60:00:e0:b6:83  txqueuelen 1000  (Ethernet)
        RX packets 144610  bytes 103597948 (103.5 MB)
        RX errors 0  dropped 696  overruns 0  frame 0
        TX packets 52865  bytes 12027728 (12.0 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Локальная петля (Loopback))
        RX packets 8711  bytes 805631 (805.6 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 8711  bytes 805631 (805.6 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 
        

  ```
 ```bash

khrom@srv-1:~$ sudo ip route add 192.168.110.0/24 via 192.168.99.1
khrom@srv-1:~$ sudo ip route add 172.28.37.0/24 dev enp4s0

khrom@srv-1:~$ routel
         target            gateway          source    proto    scope    dev tbl
        default       192.168.99.1                   static          enp4s0
   169.254.0.0/ 16                                              link enp4s0
   172.28.37.0/ 24                                              link enp4s0
  192.168.99.0/ 24                   192.168.99.30   kernel     link enp4s0
 192.168.110.0/ 24    192.168.99.1                                   enp4s0
      127.0.0.0          broadcast       127.0.0.1   kernel     link     lo local
     127.0.0.0/ 8            local       127.0.0.1   kernel     host     lo local
      127.0.0.1              local       127.0.0.1   kernel     host     lo local
127.255.255.255          broadcast       127.0.0.1   kernel     link     lo local
   192.168.99.0          broadcast   192.168.99.30   kernel     link enp4s0 local
  192.168.99.30              local   192.168.99.30   kernel     host enp4s0 local
 192.168.99.255          broadcast   192.168.99.30   kernel     link enp4s0 local
            ::1                                      kernel              lo
        fe80::/ 64                                   kernel          enp4s0
            ::1              local                   kernel              lo local
fe80::540f:ea44:8897:824a              local                   kernel          enp4s0 local
/usr/bin/routel: 48: shift: can't shift that many

  ```



# Задание 3. Проверьте открытые TCP порты в Ubuntu, какие протоколы и приложения используют эти порты? Приведите несколько примеров.

 ### Ответ:
  ```bash
khrom@srv-1:~$ sudo ss -lnpt
State      Recv-Q     Send-Q           Local Address:Port            Peer Address:Port     Process
LISTEN     0          5                    127.0.0.1:5901                 0.0.0.0:*         users:(("Xtightvnc",pid=5629,fd=3))
LISTEN     0          4096                   0.0.0.0:40525                0.0.0.0:*         users:(("rpc.mountd",pid=812,fd=17))
LISTEN     0          5                    127.0.0.1:5902                 0.0.0.0:*         users:(("Xtightvnc",pid=5925,fd=3))
LISTEN     0          4096                   0.0.0.0:111                  0.0.0.0:*         users:(("rpcbind",pid=659,fd=4),("systemd",pid=1,fd=34))
LISTEN     0          511                    0.0.0.0:80                   0.0.0.0:*         users:(("nginx",pid=877,fd=6),("nginx",pid=876,fd=6),("nginx",pid=875,fd=6),("nginx",pid=874,fd=6),("nginx",pid=873,fd=6),("nginx",pid=872,fd=6),("nginx",pid=871,fd=6),("nginx",pid=870,fd=6),("nginx",pid=869,fd=6))
LISTEN     0          128                    0.0.0.0:6001                 0.0.0.0:*         users:(("Xtightvnc",pid=5629,fd=0))
LISTEN     0          128                    0.0.0.0:6002                 0.0.0.0:*         users:(("Xtightvnc",pid=5925,fd=0))
LISTEN     0          4096                   0.0.0.0:48371                0.0.0.0:*         users:(("rpc.mountd",pid=812,fd=13))
LISTEN     0          4096             127.0.0.53%lo:53                   0.0.0.0:*         users:(("systemd-resolve",pid=660,fd=13))
LISTEN     0          128                    0.0.0.0:22                   0.0.0.0:*         users:(("sshd",pid=836,fd=3))
LISTEN     0          5                    127.0.0.1:631                  0.0.0.0:*         users:(("cupsd",pid=8711,fd=7))
LISTEN     0          64                     0.0.0.0:42939                0.0.0.0:*        
LISTEN     0          4096                   0.0.0.0:57723                0.0.0.0:*         users:(("rpc.mountd",pid=812,fd=9))
LISTEN     0          64                     0.0.0.0:2049                 0.0.0.0:*        
LISTEN     0          4096                      [::]:58439                   [::]:*         users:(("rpc.mountd",pid=812,fd=15))
LISTEN     0          4096                      [::]:39305                   [::]:*         users:(("rpc.mountd",pid=812,fd=11))
LISTEN     0          64                        [::]:42445                   [::]:*        
LISTEN     0          4096                      [::]:39503                   [::]:*         users:(("rpc.mountd",pid=812,fd=19))
LISTEN     0          4096                      [::]:111                     [::]:*         users:(("rpcbind",pid=659,fd=6),("systemd",pid=1,fd=36))
LISTEN     0          511                       [::]:80                      [::]:*         users:(("nginx",pid=877,fd=7),("nginx",pid=876,fd=7),("nginx",pid=875,fd=7),("nginx",pid=874,fd=7),("nginx",pid=873,fd=7),("nginx",pid=872,fd=7),("nginx",pid=871,fd=7),("nginx",pid=870,fd=7),("nginx",pid=869,fd=7))
LISTEN     0          128                       [::]:22                      [::]:*         users:(("sshd",pid=836,fd=4))
LISTEN     0          5                        [::1]:631                     [::]:*         users:(("cupsd",pid=8711,fd=6))
LISTEN     0          64                        [::]:2049                    [::]:*        
khrom@srv-1:~$ State      Recv-Q     Send-Q           Local Address:Port            Peer Address:Port     Process
LISTEN     0          4096                      [::]:39305                   [::]:*         users:(("rpc.mountd",pid=812,fd=11))
LISTEN     0          64                        [::]:42445                   [::]:*
LISTEN     0          4096                      [::]:39503                   [::]:*         users:(("rpc.mountd",pid=812,fd=19))
LISTEN     0          4096                      [::]:111                     [::]:*         users:(("rpcbind",pid=659,fd=6),("systemd",pid=1,fd=36))
LISTEN     0          511                       [::]:80                      [::]:*         users:(("nginx",pid=877,fd=7),("nginx",pid=876,fd=7),("nginx",pid=875,fd=7),("nginx",pid=874,fd=7),("nginx",pid=873,fd=7),("nginx",pid=872,fd=7),("nginx",pid=871,fd=7),("nginx",pid=870,fd=7),("nginx",pid=869,fd=7))
LISTEN     0          128                       [::]:22                      [::]:*         users:(("sshd",pid=836,fd=4))
LISTEN     0          5                        [::1]:631                     [::]:*         users:(("cupsd",pid=8711,fd=6))
LISTEN     0          64                        [::]:2049                    [::]:* 
 

  ```

# Задание 4. Проверьте используемые UDP сокеты в Ubuntu, какие протоколы и приложения используют эти порты?

 ### Ответ:
  ```bash
khrom@srv-1:~$ sudo ss -lpnu
State      Recv-Q     Send-Q           Local Address:Port            Peer Address:Port     Process
UNCONN     0          0                      0.0.0.0:56529                0.0.0.0:*        
UNCONN     0          0                      0.0.0.0:5353                 0.0.0.0:*         users:(("avahi-daemon",pid=685,fd=12))
UNCONN     0          0                      0.0.0.0:46538                0.0.0.0:*         users:(("rpc.mountd",pid=812,fd=16))
UNCONN     0          0                      0.0.0.0:34490                0.0.0.0:*         users:(("avahi-daemon",pid=685,fd=14))
UNCONN     0          0                      0.0.0.0:46904                0.0.0.0:*         users:(("rpc.mountd",pid=812,fd=12))
UNCONN     0          0                      0.0.0.0:2049                 0.0.0.0:*        
UNCONN     0          0                127.0.0.53%lo:53                   0.0.0.0:*         users:(("systemd-resolve",pid=660,fd=12))
UNCONN     0          0                      0.0.0.0:59449                0.0.0.0:*         users:(("rpc.mountd",pid=812,fd=8))
UNCONN     0          0                      0.0.0.0:111                  0.0.0.0:*         users:(("rpcbind",pid=659,fd=5),("systemd",pid=1,fd=35))
UNCONN     0          0                      0.0.0.0:631                  0.0.0.0:*         users:(("cups-browsed",pid=8713,fd=7))
UNCONN     0          0                         [::]:5353                    [::]:*         users:(("avahi-daemon",pid=685,fd=13))
UNCONN     0          0                         [::]:46917                   [::]:*         users:(("rpc.mountd",pid=812,fd=14))
UNCONN     0          0                         [::]:2049                    [::]:*        
UNCONN     0          0                         [::]:111                     [::]:*         users:(("rpcbind",pid=659,fd=7),("systemd",pid=1,fd=37))
UNCONN     0          0                         [::]:41371                   [::]:*         users:(("rpc.mountd",pid=812,fd=10))
UNCONN     0          0                         [::]:51695                   [::]:*         users:(("rpc.mountd",pid=812,fd=18))
UNCONN     0          0                         [::]:50065                   [::]:*        
UNCONN     0          0                         [::]:33797                   [::]:*         users:(("avahi-daemon",pid=685,fd=15))

  ```

# Задание 5. Используя diagrams.net, создайте L3 диаграмму вашей домашней сети или любой другой сети, с которой вы работали. 

 ### Ответ:

https://drive.google.com/file/d/1kBUP_MWqAbiEQvBBHJnDxISvPgSUXyDF/view?usp=sharing