# Домашнее задание к занятию "3.4. Операционные системы, лекция 2"

# Задание 1
 На лекции мы познакомились с  [node_exporter](https://github.com/prometheus/node_exporter/releases). В демонстрации его исполняемый файл запускался в background. Этого достаточно для демо, но не для настоящей production-системы, где процессы должны находиться под внешним управлением. Используя знания из лекции по systemd, создайте самостоятельно простой [unit-файл](https://www.freedesktop.org/software/systemd/man/systemd.service.html) для node_exporter:

    * поместите его в автозагрузку,
    * предусмотрите возможность добавления опций к запускаемому процессу через внешний файл (посмотрите, например, на `systemctl cat cron`),
    * удостоверьтесь, что с помощью systemctl процесс корректно стартует, завершается, а после перезагрузки автоматически поднимается.
Ответ 

https://drive.google.com/file/d/19-62IX1Q-Js3tNTQVeHx1YgmZJVLoCLY/view?usp=sharing

```bash

vagrant@vagrant:~$ ps aux |grep node_exporter
node_ex+     630  0.0  2.3 715024 11452 ?        Ssl  18:28   0:00 /usr/local/bin/node_exporter
vagrant     1319  0.0  0.1   9032   736 pts/0    S+   18:33   0:00 grep --color=auto node_exporter

vagrant@vagrant:~$ ps aux |grep node_exporter
node_ex+     630  0.0  2.3 715024 11452 ?        Ssl  18:28   0:00 /usr/local/bin/node_exporter
vagrant     1319  0.0  0.1   9032   736 pts/0    S+   18:33   0:00 grep --color=auto node_exporter
vagrant@vagrant:~$
vagrant@vagrant:~$ vagrant@vagrant:~$ ps aux |grep node_exporter
-bash: vagrant@vagrant:~$: command not found
vagrant@vagrant:~$ node_ex+     630  0.0  2.3 715024 11452 ?        Ssl  18:28   0:00 /usr/local/bin/node_exporter
-bash: node_ex+: command not found
vagrant@vagrant:~$ vagrant     1319  0.0  0.1   9032   736 pts/0    S+   18:33   0:00 grep --color=auto node_exporter
-bash: vagrant: command not found
vagrant@vagrant:~$ sudo -s
root@vagrant:/home/vagrant# systemctl stop node_exporter
root@vagrant:/home/vagrant# systemctl status  node_exporter
● node_exporter.service - Node Exporter
     Loaded: loaded (/etc/systemd/system/node_exporter.service; enabled; vendor preset: enabled)
     Active: inactive (dead) since Thu 2021-12-16 18:35:44 UTC; 22s ago
    Process: 630 ExecStart=/usr/local/bin/node_exporter $OPTIONS (code=killed, signal=TERM)
   Main PID: 630 (code=killed, signal=TERM)

Dec 16 18:28:35 vagrant node_exporter[630]: level=info ts=2021-12-16T18:28:35.171Z caller=node_exporter.go:115 collector=udp_queues
Dec 16 18:28:35 vagrant node_exporter[630]: level=info ts=2021-12-16T18:28:35.171Z caller=node_exporter.go:115 collector=uname
Dec 16 18:28:35 vagrant node_exporter[630]: level=info ts=2021-12-16T18:28:35.171Z caller=node_exporter.go:115 collector=vmstat
Dec 16 18:28:35 vagrant node_exporter[630]: level=info ts=2021-12-16T18:28:35.171Z caller=node_exporter.go:115 collector=xfs
Dec 16 18:28:35 vagrant node_exporter[630]: level=info ts=2021-12-16T18:28:35.171Z caller=node_exporter.go:115 collector=zfs
Dec 16 18:28:35 vagrant node_exporter[630]: level=info ts=2021-12-16T18:28:35.171Z caller=node_exporter.go:199 msg="Listening on" address=:9100
Dec 16 18:28:35 vagrant node_exporter[630]: level=info ts=2021-12-16T18:28:35.171Z caller=tls_config.go:191 msg="TLS is disabled." http2=false
Dec 16 18:35:44 vagrant systemd[1]: Stopping Node Exporter...
Dec 16 18:35:44 vagrant systemd[1]: node_exporter.service: Succeeded.
Dec 16 18:35:44 vagrant systemd[1]: Stopped Node Exporter.
root@vagrant:/home/vagrant# systemctl start node_exporter
root@vagrant:/home/vagrant# systemctl status  node_exporter
● node_exporter.service - Node Exporter
     Loaded: loaded (/etc/systemd/system/node_exporter.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2021-12-16 18:36:37 UTC; 26s ago
   Main PID: 1357 (node_exporter)
      Tasks: 5 (limit: 466)
     Memory: 3.0M
     CGroup: /system.slice/node_exporter.service
             └─1357 /usr/local/bin/node_exporter

Dec 16 18:36:37 vagrant node_exporter[1357]: level=info ts=2021-12-16T18:36:37.068Z caller=node_exporter.go:115 collector=thermal_zone
Dec 16 18:36:37 vagrant node_exporter[1357]: level=info ts=2021-12-16T18:36:37.068Z caller=node_exporter.go:115 collector=time
Dec 16 18:36:37 vagrant node_exporter[1357]: level=info ts=2021-12-16T18:36:37.068Z caller=node_exporter.go:115 collector=timex
Dec 16 18:36:37 vagrant node_exporter[1357]: level=info ts=2021-12-16T18:36:37.068Z caller=node_exporter.go:115 collector=udp_queues
Dec 16 18:36:37 vagrant node_exporter[1357]: level=info ts=2021-12-16T18:36:37.068Z caller=node_exporter.go:115 collector=uname
Dec 16 18:36:37 vagrant node_exporter[1357]: level=info ts=2021-12-16T18:36:37.068Z caller=node_exporter.go:115 collector=vmstat
Dec 16 18:36:37 vagrant node_exporter[1357]: level=info ts=2021-12-16T18:36:37.068Z caller=node_exporter.go:115 collector=xfs
Dec 16 18:36:37 vagrant node_exporter[1357]: level=info ts=2021-12-16T18:36:37.068Z caller=node_exporter.go:115 collector=zfs
Dec 16 18:36:37 vagrant node_exporter[1357]: level=info ts=2021-12-16T18:36:37.068Z caller=node_exporter.go:199 msg="Listening on" address=:9100
Dec 16 18:36:37 vagrant node_exporter[1357]: level=info ts=2021-12-16T18:36:37.069Z caller=tls_config.go:191 msg="TLS is disabled." http2=false
root@vagrant:/home/vagrant#

```

 прописан файл конфигурации /etc/systemd/system/node_exporter.service


[Unit]
Description=Node Exporter

[Service]
User=node_exporter
Group=node_exporter
EnvironmentFile=-/etc/sysconfig/node_exporter
ExecStart=/usr/local/bin/node_exporter $OPTIONS

[Install]
WantedBy=multi-user.target





# Задание 2.

Ознакомьтесь с опциями node_exporter и выводом `/metrics` по-умолчанию. Приведите несколько опций, которые вы бы выбрали для базового мониторинга хоста по CPU, памяти, диску и сети.


CPU 

node_cpu_seconds_total{cpu="0",mode="idle"} 10493.04

node_cpu_seconds_total{cpu="0",mode="iowait"} 2.26

node_cpu_seconds_total{cpu="0",mode="irq"} 0

node_cpu_seconds_total{cpu="0",mode="nice"} 0

node_cpu_seconds_total{cpu="0",mode="softirq"} 2.71

node_cpu_seconds_total{cpu="0",mode="steal"} 0

node_cpu_seconds_total{cpu="0",mode="system"} 22.41

node_cpu_seconds_total{cpu="0",mode="user"} 16.15

node_cpu_seconds_total{cpu="1",mode="idle"} 10500.56

node_cpu_seconds_total{cpu="1",mode="iowait"} 1.94

node_cpu_seconds_total{cpu="1",mode="irq"} 0

node_cpu_seconds_total{cpu="1",mode="nice"} 0

node_cpu_seconds_total{cpu="1",mode="softirq"} 2.17

node_cpu_seconds_total{cpu="1",mode="steal"} 0

node_cpu_seconds_total{cpu="1",mode="system"} 16.07

node_cpu_seconds_total{cpu="1",mode="user"} 11.87

memory

node_memory_Active_anon_bytes 6.4794624e+07

node_memory_Active_file_bytes 1.17792768e+08

disk


node_disk_io_time_weighted_seconds_total{device="dm-0"} 27.088

node_disk_io_time_weighted_seconds_total{device="dm-1"} 2.848

node_disk_io_time_weighted_seconds_total{device="sda"} 5.22

network

node_network_address_assign_type{device="eth0"} 0

node_network_address_assign_type{device="lo"} 0

# Задание 3.

Установите в свою виртуальную машину [Netdata](https://github.com/netdata/netdata). Воспользуйтесь [готовыми пакетами](https://packagecloud.io/netdata/netdata/install) для установки (`sudo apt install -y netdata`). После успешной установки:
    * в конфигурационном файле `/etc/netdata/netdata.conf` в секции [web] замените значение с localhost на `bind to = 0.0.0.0`,
    * добавьте в Vagrantfile проброс порта Netdata на свой локальный компьютер и сделайте `vagrant reload`:

    ```bash
    config.vm.network "forwarded_port", guest: 19999, host: 19999
    ```

    После успешной перезагрузки в браузере *на своем ПК* (не в виртуальной машине) вы должны суметь зайти на `localhost:19999`. Ознакомьтесь с метриками, которые по умолчанию собираются Netdata и с комментариями, которые даны к этим метрикам.

Ответ


khrom@srv-1:~/Netology$ sudo lsof -i :19999
[sudo] пароль для khrom:
COMMAND    PID  USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
VBoxHeadl 3046 khrom   21u  IPv4  56096      0t0  TCP *:19999 (LISTEN)
VBoxHeadl 3046 khrom   28u  IPv4  60447      0t0  TCP srv-1:19999->192.168.99.2:50539 (ESTABLISHED)


vagrant@vagrant:~$ sudo lsof -i :19999
COMMAND PID    USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
netdata 813 netdata    4u  IPv4  25041      0t0  TCP *:19999 (LISTEN)
netdata 813 netdata   20u  IPv4  26223      0t0  TCP vagrant:19999->_gateway:50539 (ESTABLISHED)

https://drive.google.com/file/d/1smi3uc3VhHugy1qvR5oNb7DWxdBaGDYi/view?usp=sharing

# Задание 4. 

Можно ли по выводу `dmesg` понять, осознает ли ОС, что загружена не на настоящем оборудовании, а на системе виртуализации? 

Ответ

Да можно 

khrom@srv-1:~$ dmesg |grep virtual
[    0.030128] Booting paravirtualized kernel on bare hardware

vagrant@vagrant:~$ dmesg |grep virtual
[    0.003557] CPU MTRRs all blank - virtualized system.
[    0.089566] Booting paravirtualized kernel on KVM
[    3.240033] systemd[1]: Detected virtualization oracle.



# Задание 5. 

Как настроен sysctl `fs.nr_open` на системе по-умолчанию? Узнайте, что означает этот параметр. Какой другой существующий лимит не позволит достичь такого числа (`ulimit --help`)?

Ответ

Это лимит на количество открытых дескрипторов для пользователя 

khrom@srv-1:~/Netology$  /sbin/sysctl -n fs.nr_open
1048576

khrom@srv-1:~$ ulimit -n
1024


khrom@srv-1:~$ ulimit -Hn
1048576

# Задание 6.

Запустите любой долгоживущий процесс (не `ls`, который отработает мгновенно, а, например, `sleep 1h`) в отдельном неймспейсе процессов; покажите, что ваш процесс работает под PID 1 через `nsenter`. Для простоты работайте в данном задании под root (`sudo -i`). Под обычным пользователем требуются дополнительные опции (`--map-root-user`) и т.д.

Ответ 

```bash

khrom@srv-1:~$ sudo -i
root@srv-1:~# ps aux | grep sleep
khrom       3909  0.0  0.0  16716   588 pts/1    S+   02:10   0:00 sleep 1h
root        3991  0.0  0.0  17696   660 pts/0    S+   02:13   0:00 grep --color=auto sleep

root@srv-1:~# nsenter --target 3909 --pid --mount
root@srv-1:/# ps aux

root@srv-1:/# ps
    PID TTY          TIME CMD
   3980 pts/0    00:00:00 sudo
   3981 pts/0    00:00:00 bash
   4082 pts/0    00:00:00 nsenter
   4083 pts/0    00:00:00 bash
   4093 pts/0    00:00:00 ps
   
   ```

# Задание 7.

Найдите информацию о том, что такое `:(){ :|:& };:`. Запустите эту команду в своей виртуальной машине Vagrant с Ubuntu 20.04 (**это важно, поведение в других ОС не проверялось**). Некоторое время все будет "плохо", после чего (минуты) – ОС должна стабилизироваться. Вызов `dmesg` расскажет, какой механизм помог автоматической стабилизации. Как настроен этот механизм по-умолчанию, и как изменить число процессов, которое можно создать в сессии?

Ответ

```bash

-bash: fork: retry: Resource temporarily unavailable
-bash: fork: Resource temporarily unavailable
-bash: fork: Resource temporarily unavailable
-bash: fork: Resource temporarily unavailable
-bash: fork: Resource temporarily unavailable
-bash: fork: retry: Resource temporarily unavailable
-bash: fork: Resource temporarily unavailable
-bash: fork: Resource temporarily unavailable
-bash: fork: retry: Resource temporarily unavailable
-bash: fork: Resource temporarily unavailable

[ 3066.276899] cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-8.scope

```



Как понял на bash'e просходит бесконечное создание шелов . ограничить можно ulimit -u 
 
 ---

