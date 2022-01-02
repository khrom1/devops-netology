# Домашнее задание к занятию "3.5. Файловые системы"

# Задание 1. Узнайте о [sparse](https://ru.wikipedia.org/wiki/%D0%A0%D0%B0%D0%B7%D1%80%D0%B5%D0%B6%D1%91%D0%BD%D0%BD%D1%8B%D0%B9_%D1%84%D0%B0%D0%B9%D0%BB) (разряженных) файлах.

 ### Ответ:

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

 ###Ответ:
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

 ###Ответ:
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

 ###Ответ:

# Задание 7. Соберите `mdadm` RAID0 на второй паре маленьких разделов.

 ### Ответ:

# Задание 8. Создайте 2 независимых PV на получившихся md-устройствах.

# Ответ:

# Задание 9. Создайте общую volume-group на этих двух PV.

# Ответ:

# Задание 10. Создайте LV размером 100 Мб, указав его расположение на PV с RAID0.

# Ответ:

# Задание 11. Создайте `mkfs.ext4` ФС на получившемся LV.

# Ответ:

# Задание 12. Смонтируйте этот раздел в любую директорию, например, `/tmp/new`.

# Ответ:

# Задание 13. Поместите туда тестовый файл, например `wget https://mirror.yandex.ru/ubuntu/ls-lR.gz -O /tmp/new/test.gz`.

# Ответ:

# Задание 14. Прикрепите вывод `lsblk`.

# Ответ:

# Задание 15. Протестируйте целостность файла:

     ```bash
     root@vagrant:~# gzip -t /tmp/new/test.gz
     root@vagrant:~# echo $?
     0
     ```

# Ответ:

# Задание 16. Используя pvmove, переместите содержимое PV с RAID0 на RAID1.

# Ответ:

# Задание 17. Сделайте `--fail` на устройство в вашем RAID1 md.

# Ответ:

# Задание 18. Подтвердите выводом `dmesg`, что RAID1 работает в деградированном состоянии.

# Ответ:

# Задание 19. Протестируйте целостность файла, несмотря на "сбойный" диск он должен продолжать быть доступен:

     ```bash
     root@vagrant:~# gzip -t /tmp/new/test.gz
     root@vagrant:~# echo $?
     0
     ```

# Ответ:

# Задание 20. Погасите тестовый хост, `vagrant destroy`.

# Ответ:

 
 ---

