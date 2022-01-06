# Домашнее задание к занятию "3.7. Компьютерные сети, лекция 2"

# Задание 1. Проверьте список доступных сетевых интерфейсов на вашем компьютере. Какие команды есть для этого в Linux и в Windows?

## Ответ:

### Windows

```bash

C:\Users\khrom1>ipconfig

Настройка протокола IP для Windows


Адаптер Ethernet Ethernet 3:

   DNS-суффикс подключения . . . . . :
   Локальный IPv6-адрес канала . . . : fe80::1129:4348:940a:a3f6%5
   IPv4-адрес. . . . . . . . . . . . : 192.168.99.2
   Маска подсети . . . . . . . . . . : 255.255.255.0
   Основной шлюз. . . . . . . . . : 192.168.99.1

Адаптер Ethernet VMware Network Adapter VMnet1:

   DNS-суффикс подключения . . . . . :
   Локальный IPv6-адрес канала . . . : fe80::1468:f74f:c575:4726%7
   IPv4-адрес. . . . . . . . . . . . : 192.168.202.1
   Маска подсети . . . . . . . . . . : 255.255.255.0
   Основной шлюз. . . . . . . . . :

Адаптер Ethernet VMware Network Adapter VMnet8:

   DNS-суффикс подключения . . . . . :
   Локальный IPv6-адрес канала . . . : fe80::e912:e00c:6021:6814%36
   IPv4-адрес. . . . . . . . . . . . : 192.168.168.1
   Маска подсети . . . . . . . . . . : 255.255.255.0
   Основной шлюз. . . . . . . . . :

Адаптер Ethernet Сетевое подключение Bluetooth 10:

   Состояние среды. . . . . . . . : Среда передачи недоступна.
   DNS-суффикс подключения . . . . . :

C:\Users\khrom1>

```


### Linux



```bash


khrom@srv-1:~$ ifconfig
enp4s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.99.30  netmask 255.255.255.0  broadcast 192.168.99.255
        inet6 fe80::540f:ea44:8897:824a  prefixlen 64  scopeid 0x20<link>
        ether c8:60:00:e0:b6:83  txqueuelen 1000  (Ethernet)
        RX packets 858844  bytes 1099703801 (1.0 GB)
        RX errors 0  dropped 1013  overruns 0  frame 0
        TX packets 217800  bytes 26059865 (26.0 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Локальная петля (Loopback))
        RX packets 3882  bytes 448775 (448.7 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 3882  bytes 448775 (448.7 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

khrom@srv-1:~$

khrom@srv-1:~$ ip link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: enp4s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether c8:60:00:e0:b6:83 brd ff:ff:ff:ff:ff:ff
khrom@srv-1:~$ ^


```


# Задание 2. Какой протокол используется для распознавания соседа по сетевому интерфейсу? Какой пакет и команды есть в Linux для этого?

## Ответ:

Протокол LLDP

```bash
root@srv-1:/home/khrom# lldpctl
-------------------------------------------------------------------------------
LLDP neighbors:
-------------------------------------------------------------------------------
Interface:    enp4s0, via: CDPv1, RID: 1, Time: 0 day, 00:01:52
  Chassis:
    ChassisID:    local MikroTik
    SysName:      MikroTik
    SysDescr:     MikroTik running on
                  6.49.2 (stable)
    MgmtIP:       192.168.0.1
    Capability:   Router, on
  Port:
    PortID:       ifname bridge/ether2
    PortDescr:    bridge/ether2
    TTL:          120
-------------------------------------------------------------------------------



```

# Задание 3. Какая технология используется для разделения L2 коммутатора на несколько виртуальных сетей? Какой пакет и команды есть в Linux для этого? Приведите пример конфига.

## Ответ:

Технология : VLAN 

Пакет vlan


```bash

auto enp4s0.100
iface enp4s0.100 inet static
        address 192.168.101.1
        netmask 255.255.255.0
        vlan_raw_device enp4s0


```

# Задание 4. Какие типы агрегации интерфейсов есть в Linux? Какие опции есть для балансировки нагрузки? Приведите пример конфига.

## Ответ:

```bash



```

# Задание 5. Сколько IP адресов в сети с маской /29 ? Сколько /29 подсетей можно получить из сети с маской /24. Приведите несколько примеров /29 подсетей внутри сети 10.10.10.0/24.

## Ответ:

В сети с маской /29 - 8 ip адресов 

32 сети можно получить из сети с маской /24

10.10.10.1/29

10.10.10.8/29

10.10.10.16/29

10.10.10.24/29

# Задание 6. Задача: вас попросили организовать стык между 2-мя организациями. Диапазоны 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16 уже заняты. Из какой подсети допустимо взять частные IP адреса? Маску выберите из расчета максимум 40-50 хостов внутри подсети.

## Ответ:

  100.64.0.0/26

# Задание 7. Как проверить ARP таблицу в Linux, Windows? Как очистить ARP кеш полностью? Как из ARP таблицы удалить только один нужный IP?


## Ответ:

### Windows
 
arp -a - проверить ARP таблицу

arp -d - эта команда используется, когда вы хотите удалить запись из таблицы ARP для определенного интерфейса. 

arp -d * - Эта команда удалит или очистит все записи из таблицы.


### Linux

ip neigh show - проверить ARP таблицу

ip neigh show all - Эта команда удалит или очистит все записи из таблицы.

ip neigh del {IPAddress} dev {DEVICE} - эта команда используется, когда вы хотите удалить запись из таблицы ARP для определенного интерфейса. 


