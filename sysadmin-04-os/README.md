# Домашнее задание к занятию "3.4. Операционные системы, лекция 2"

# Задание 1
 На лекции мы познакомились с  [node_exporter](https://github.com/prometheus/node_exporter/releases). В демонстрации его исполняемый файл запускался в background. Этого достаточно для демо, но не для настоящей production-системы, где процессы должны находиться под внешним управлением. Используя знания из лекции по systemd, создайте самостоятельно простой [unit-файл](https://www.freedesktop.org/software/systemd/man/systemd.service.html) для node_exporter:

    * поместите его в автозагрузку,
    * предусмотрите возможность добавления опций к запускаемому процессу через внешний файл (посмотрите, например, на `systemctl cat cron`),
    * удостоверьтесь, что с помощью systemctl процесс корректно стартует, завершается, а после перезагрузки автоматически поднимается.

# Задание 2.

Ознакомьтесь с опциями node_exporter и выводом `/metrics` по-умолчанию. Приведите несколько опций, которые вы бы выбрали для базового мониторинга хоста по CPU, памяти, диску и сети.

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



khrom@srv-1:~/Netology$  /sbin/sysctl -n fs.nr_open
1048576

# Задание 6.

Запустите любой долгоживущий процесс (не `ls`, который отработает мгновенно, а, например, `sleep 1h`) в отдельном неймспейсе процессов; покажите, что ваш процесс работает под PID 1 через `nsenter`. Для простоты работайте в данном задании под root (`sudo -i`). Под обычным пользователем требуются дополнительные опции (`--map-root-user`) и т.д.

# Задание 7.

Найдите информацию о том, что такое `:(){ :|:& };:`. Запустите эту команду в своей виртуальной машине Vagrant с Ubuntu 20.04 (**это важно, поведение в других ОС не проверялось**). Некоторое время все будет "плохо", после чего (минуты) – ОС должна стабилизироваться. Вызов `dmesg` расскажет, какой механизм помог автоматической стабилизации. Как настроен этот механизм по-умолчанию, и как изменить число процессов, которое можно создать в сессии?

 
 ---

