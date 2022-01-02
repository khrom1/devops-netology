# Домашнее задание к занятию "3.5. Файловые системы"

# Задание 1. Узнайте о [sparse] (разряженных) файлах.

 ### Ответ:

Отличная идея для файлообменных сетей

# Задание 2. Могут ли файлы, являющиеся жесткой ссылкой на один объект, иметь разные права доступа и владельца? Почему?

 ### Ответ:
 
hardlink - это всего лишь ссылка на сам файл права доступа и владелец одинаковы 

 ```bash
khrom@srv-1:~/Netology/test$ rm 123_hl
khrom@srv-1:~/Netology/test$ touch 123_hl
khrom@srv-1:~/Netology/test$ ln 123_hl 123_link
khrom@srv-1:~/Netology/test$ ls -ilh
итого 4,0K
7099270 -rw-rw-r-- 2 khrom khrom 0 янв  2 14:24 123_hl
7099270 -rw-rw-r-- 2 khrom khrom 0 янв  2 14:24 123_link
7101172 -rw-rw-r-- 1 khrom khrom 5 дек  4 07:44 khrom.log


khrom@srv-1:~/Netology/test$ chmod 0711 123_hl
khrom@srv-1:~/Netology/test$ ls -ilh
итого 4,0K
7099270 -rwx--x--x 2 khrom khrom 0 янв  2 14:24 123_hl
7099270 -rwx--x--x 2 khrom khrom 0 янв  2 14:24 123_link
7101172 -rw-rw-r-- 1 khrom khrom 5 дек  4 07:44 khrom.log
 


     


  ```



# Задание 3. Сделайте `vagrant destroy` на имеющийся инстанс Ubuntu. Замените содержимое Vagrantfile следующим:

    ```bash
    Vagrant.configure("2") do |config|
      config.vm.box = "bento/ubuntu-20.04"
      config.vm.provider :virtualbox do |vb|
        lvm_experiments_disk0_path = "/tmp/lvm_experiments_disk0.vmdk"
        lvm_experiments_disk1_path = "/tmp/lvm_experiments_disk1.vmdk"
        vb.customize ['createmedium', '--filename', lvm_experiments_disk0_path, '--size', 2560]
        vb.customize ['createmedium', '--filename', lvm_experiments_disk1_path, '--size', 2560]
        vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', lvm_experiments_disk0_path]
        vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', lvm_experiments_disk1_path]
      end
    end
    ```

    Данная конфигурация создаст новую виртуальную машину с двумя дополнительными неразмеченными дисками по 2.5 Гб.

 ### Ответ:
```bash

vagrant@vagrant:~$ sudo lsblk
NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                    8:0    0   64G  0 disk
├─sda1                 8:1    0  512M  0 part /boot/efi
├─sda2                 8:2    0    1K  0 part
└─sda5                 8:5    0 63.5G  0 part
  ├─vgvagrant-root   253:0    0 62.6G  0 lvm  /
  └─vgvagrant-swap_1 253:1    0  980M  0 lvm  [SWAP]
sdb                    8:16   0  2.5G  0 disk
sdc                    8:32   0  2.5G  0 disk

```

# Задание 4. Используя `fdisk`, разбейте первый диск на 2 раздела: 2 Гб, оставшееся пространство.

 ### Ответ:
```bash
Welcome to fdisk (util-linux 2.34).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table.
Created a new DOS disklabel with disk identifier 0x4c206487.

Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-5242879, default 2048):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-5242879, default 5242879): +2G

Created a new partition 1 of type 'Linux' and of size 2 GiB.

Command (m for help): n
Partition type
   p   primary (1 primary, 0 extended, 3 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (2-4, default 2): 2
First sector (4196352-5242879, default 4196352):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (4196352-5242879, default 5242879):

Created a new partition 2 of type 'Linux' and of size 511 MiB.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.

vagrant@vagrant:~$ sudo lsblk                                                              NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                    8:0    0   64G  0 disk
├─sda1                 8:1    0  512M  0 part /boot/efi
├─sda2                 8:2    0    1K  0 part
└─sda5                 8:5    0 63.5G  0 part
  ├─vgvagrant-root   253:0    0 62.6G  0 lvm  /
  └─vgvagrant-swap_1 253:1    0  980M  0 lvm  [SWAP]
sdb                    8:16   0  2.5G  0 disk
├─sdb1                 8:17   0    2G  0 part
└─sdb2                 8:18   0  511M  0 part
sdc                    8:32   0  2.5G  0 disk

```

# Задание 5. Используя `sfdisk`, перенесите данную таблицу разделов на второй диск.

 ### Ответ:

```bash
 sudo sfdisk -d /dev/sdb| sudo sfdisk --force /dev/sdc

```
```bash
vagrant@vagrant:~$ sudo lsblk
NAME                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                    8:0    0   64G  0 disk
├─sda1                 8:1    0  512M  0 part /boot/efi
├─sda2                 8:2    0    1K  0 part
└─sda5                 8:5    0 63.5G  0 part
  ├─vgvagrant-root   253:0    0 62.6G  0 lvm  /
  └─vgvagrant-swap_1 253:1    0  980M  0 lvm  [SWAP]
sdb                    8:16   0  2.5G  0 disk
├─sdb1                 8:17   0    2G  0 part
└─sdb2                 8:18   0  511M  0 part
sdc                    8:32   0  2.5G  0 disk
├─sdc1                 8:33   0    2G  0 part
└─sdc2                 8:34   0  511M  0 part

```

# Задание 6. Соберите `mdadm` RAID1 на паре разделов 2 Гб.

 ### Ответ:

```bash
vagrant@vagrant:~$ sudo mdadm --create --verbose /dev/md1 -l 1 -n 2 /dev/sd{b1,c1}
mdadm: Note: this array has metadata at the start and
    may not be suitable as a boot device.  If you plan to
    store '/boot' on this device please ensure that
    your boot-loader understands md/v1.x metadata, or use
    --metadata=0.90
mdadm: size set to 2094080K
Continue creating array? y
mdadm: Defaulting to version 1.2 metadata
mdadm: array /dev/md1 started.
vagrant@vagrant:~$
    
    
  ```

# Задание 7. Соберите `mdadm` RAID0 на второй паре маленьких разделов.

 ### Ответ:
```bash
    
   vagrant@vagrant:~$ sudo mdadm --create --verbose /dev/md0 -l 1 -n 2 /dev/sd{b2,c2}
mdadm: Note: this array has metadata at the start and
    may not be suitable as a boot device.  If you plan to
    store '/boot' on this device please ensure that
    your boot-loader understands md/v1.x metadata, or use
    --metadata=0.90
mdadm: size set to 522240K
Continue creating array? y
mdadm: Defaulting to version 1.2 metadata
mdadm: array /dev/md0 started.
   ```
# Задание 8. Создайте 2 независимых PV на получившихся md-устройствах.

 ### Ответ:
```bash
vagrant@vagrant:~$ sudo pvcreate /dev/md1 /dev/md0
  Physical volume "/dev/md1" successfully created.
  Physical volume "/dev/md0" successfully created.
    
   ```

# Задание 9. Создайте общую volume-group на этих двух PV.

 ### Ответ:
```bash
 vagrant@vagrant:~$ sudo vgcreate vg1 /dev/md1 /dev/md0
  Volume group "vg1" successfully created
vagrant@vagrant:~$
   
   ```

# Задание 10. Создайте LV размером 100 Мб, указав его расположение на PV с RAID0.

 ### Ответ:
```bash
vagrant@vagrant:~$ sudo  lvcreate -L 100M vg1 /dev/md0
  Logical volume "lvol0" created.
    
   ```

# Задание 11. Создайте `mkfs.ext4` ФС на получившемся LV.

 ### Ответ:
```bash

 
    vagrant@vagrant:~$ sudo mkfs.ext4 /dev/vg1/lvol0
mke2fs 1.45.5 (07-Jan-2020)
Creating filesystem with 25600 4k blocks and 25600 inodes

Allocating group tables: done
Writing inode tables: done
Creating journal (1024 blocks): done
Writing superblocks and filesystem accounting information: done

   ```


# Задание 12. Смонтируйте этот раздел в любую директорию, например, `/tmp/new`.

 ### Ответ:

 ```bash
vagrant@vagrant:~$ sudo mkdir /tmp/new
vagrant@vagrant:~$ sudo mount /dev/vg1/lvol0 /tmp/new
 ```

# Задание 13. Поместите туда тестовый файл, например `wget https://mirror.yandex.ru/ubuntu/ls-lR.gz -O /tmp/new/test.gz`.

 ### Ответ:
 ```bash
 
vagrant@vagrant:~$ sudo  wget https://mirror.yandex.ru/ubuntu/ls-lR.gz -O /tmp/new/test.gz
--2022-01-02 13:18:26--  https://mirror.yandex.ru/ubuntu/ls-lR.gz
Resolving mirror.yandex.ru (mirror.yandex.ru)... 213.180.204.183, 2a02:6b8::183
Connecting to mirror.yandex.ru (mirror.yandex.ru)|213.180.204.183|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 21507191 (21M) [application/octet-stream]
Saving to: ‘/tmp/new/test.gz’

/tmp/new/test.gz       100%[===========================>]  20.51M  13.3MB/s    in 1.5s

2022-01-02 13:18:28 (13.3 MB/s) - ‘/tmp/new/test.gz’ saved [21507191/21507191]
vagrant@vagrant:~$ ll /tmp/new
total 21028
drwxr-xr-x  3 root root     4096 Jan  2 13:18 ./
drwxrwxrwt 10 root root     4096 Jan  2 13:14 ../
drwx------  2 root root    16384 Jan  2 13:09 lost+found/
-rw-r--r--  1 root root 21507191 Jan  2 12:15 test.gz



  ```
# Задание 14. Прикрепите вывод `lsblk`.


 ### Ответ:
 ```bash
 vagrant@vagrant:~$ lsblk
NAME                 MAJ:MIN RM  SIZE RO TYPE  MOUNTPOINT
sda                    8:0    0   64G  0 disk
├─sda1                 8:1    0  512M  0 part  /boot/efi
├─sda2                 8:2    0    1K  0 part
└─sda5                 8:5    0 63.5G  0 part
  ├─vgvagrant-root   253:0    0 62.6G  0 lvm   /
  └─vgvagrant-swap_1 253:1    0  980M  0 lvm   [SWAP]
sdb                    8:16   0  2.5G  0 disk
├─sdb1                 8:17   0    2G  0 part
│ └─md1                9:1    0    2G  0 raid1
└─sdb2                 8:18   0  511M  0 part
  └─md0                9:0    0  510M  0 raid1
    └─vg1-lvol0      253:2    0  100M  0 lvm   /tmp/new
sdc                    8:32   0  2.5G  0 disk
├─sdc1                 8:33   0    2G  0 part
│ └─md1                9:1    0    2G  0 raid1
└─sdc2                 8:34   0  511M  0 part
  └─md0                9:0    0  510M  0 raid1
    └─vg1-lvol0      253:2    0  100M  0 lvm   /tmp/new

  ```
# Задание 15. Протестируйте целостность файла:

     ```bash

     root@vagrant:~# gzip -t /tmp/new/test.gz
     root@vagrant:~# echo $?
     0
     ```

# Ответ:
 ```bash
 root@vagrant:~# gzip -t /tmp/new/test.gz && echo $?
0

  ```
# Задание 16. Используя pvmove, переместите содержимое PV с RAID0 на RAID1.

# Ответ:
 ```bash
 root@vagrant:~#  pvmove /dev/md0
  /dev/md0: Moved: 12.00%
  /dev/md0: Moved: 100.00%

  ```
# Задание 17. Сделайте `--fail` на устройство в вашем RAID1 md.

# Ответ:
 ```bash
 root@vagrant:~# mdadm /dev/md1 --fail /dev/sdb1
mdadm: set /dev/sdb1 faulty in /dev/md1
root@vagrant:~# mdadm -D /dev/md1
/dev/md1:
           Version : 1.2
     Creation Time : Sun Jan  2 12:54:43 2022
        Raid Level : raid1
        Array Size : 2094080 (2045.00 MiB 2144.34 MB)
     Used Dev Size : 2094080 (2045.00 MiB 2144.34 MB)
      Raid Devices : 2
     Total Devices : 2
       Persistence : Superblock is persistent

       Update Time : Sun Jan  2 13:35:02 2022
             State : clean, degraded
    Active Devices : 1
   Working Devices : 1
    Failed Devices : 1
     Spare Devices : 0

Consistency Policy : resync

              Name : vagrant:1  (local to host vagrant)
              UUID : ba284d0c:1c486acf:db272832:e4e02ffb
            Events : 19

    Number   Major   Minor   RaidDevice State
       -       0        0        0      removed
       1       8       33        1      active sync   /dev/sdc1

       0       8       17        -      faulty   /dev/sdb1

  ```
# Задание 18. Подтвердите выводом `dmesg`, что RAID1 работает в деградированном состоянии.

# Ответ:
 ```bash
 root@vagrant:~# dmesg |grep md1
[ 2562.214818] md/raid1:md1: not clean -- starting background reconstruction
[ 2562.214821] md/raid1:md1: active with 2 out of 2 mirrors
[ 2562.214844] md1: detected capacity change from 0 to 2144337920
[ 2562.215014] md: resync of RAID array md1
[ 2572.792399] md: md1: resync done.
[ 4981.048732] md/raid1:md1: Disk failure on sdb1, disabling device.
               md/raid1:md1: Operation continuing on 1 devices.

  ```
# Задание 19. Протестируйте целостность файла, несмотря на "сбойный" диск он должен продолжать быть доступен:

     ```bash
     root@vagrant:~# gzip -t /tmp/new/test.gz
     root@vagrant:~# echo $?
     0
     ```

# Ответ:
 ```bash
 root@vagrant:~# gzip -t /tmp/new/test.gz && echo $?
0

  ```
# Задание 20. Погасите тестовый хост, `vagrant destroy`.

# Ответ:

  ```bash
 vagrant@vagrant:~$ logout
Connection to 127.0.0.1 closed.
khrom@srv-1:~/Netology$ vagrant destroy
    default: Are you sure you want to destroy the 'default' VM? [y/N] y
==> default: Forcing shutdown of VM...
==> default: Destroying VM and associated drives...
khrom@srv-1:~/Netology$

  ```
 ---

