# Домашнее задание к занятию "3.9. Элементы безопасности информационных систем"

# Задание 1. Установите Bitwarden плагин для браузера. Зарегестрируйтесь и сохраните несколько паролей.

 ### Ответ:
  
https://drive.google.com/file/d/1HIidNfF5h6WO4mfoPGsh90N6-4nVqzWg/view?usp=sharing

# Задание 2. Установите Google authenticator на мобильный телефон. Настройте вход в Bitwarden акаунт через Google authenticator OTP.

 ### Ответ:

  https://drive.google.com/file/d/181GpSBIalLgLevluedl58k01KS-LdXDV/view?usp=sharing

  https://drive.google.com/file/d/1LXBUaGYxfzLW0PZ6cTe8rDB0oOJhJxGm/view?usp=sharing 

# Задание 3. Установите apache2, сгенерируйте самоподписанный сертификат, настройте тестовый сайт для работы по HTTPS.

 ### Ответ:
  ```bash
 https://drive.google.com/file/d/1fUqNAngL7n7pIkQyTtdU3L6Ts3I7xkwC/view?usp=sharing
  ```
# Задание 4. Проверьте на TLS уязвимости произвольный сайт в интернете (кроме сайтов МВД, ФСБ, МинОбр, НацБанк, РосКосмос, РосАтом, РосНАНО и любых госкомпаний, объектов КИИ, ВПК ... и тому подобное).

 ### Ответ:
  ```bash
khrom@srv-1:~$ cd testssl.sh
khrom@srv-1:~/testssl.sh$ ./testssl.sh -U --sneaky https://netology.ru/

###########################################################
    testssl.sh       3.1dev from https://testssl.sh/dev/
    (e35f0e8 2022-01-03 17:50:21 -- )

      This program is free software. Distribution and
             modification under GPLv2 permitted.
      USAGE w/o ANY WARRANTY. USE IT AT YOUR OWN RISK!

       Please file bugs @ https://testssl.sh/bugs/

###########################################################

 Using "OpenSSL 1.0.2-chacha (1.0.2k-dev)" [~183 ciphers]
 on srv-1:./bin/openssl.Linux.x86_64
 (built: "Jan 18 17:12:17 2019", platform: "linux-x86_64")


Testing all IPv4 addresses (port 443): 104.22.40.171 104.22.41.171 172.67.21.207
---------------------------------------------------------------------------------------------------------------------------------------------------
 Start 2022-01-05 18:41:53        -->> 104.22.40.171:443 (netology.ru) <<--

 Further IP addresses:   172.67.21.207 104.22.41.171 2606:4700:10::ac43:15cf 2606:4700:10::6816:29ab 2606:4700:10::6816:28ab
 rDNS (104.22.40.171):   --
 Service detected:       HTTP


 Testing vulnerabilities

 Heartbleed (CVE-2014-0160)                not vulnerable (OK), no heartbeat extension
 CCS (CVE-2014-0224)                       not vulnerable (OK)
 Ticketbleed (CVE-2016-9244), experiment.  not vulnerable (OK), no session tickets
 ROBOT                                     not vulnerable (OK)
 Secure Renegotiation (RFC 5746)           OpenSSL handshake didn't succeed
 Secure Client-Initiated Renegotiation     not vulnerable (OK)
 CRIME, TLS (CVE-2012-4929)                not vulnerable (OK)
 BREACH (CVE-2013-3587)                    potentially NOT ok, "gzip" HTTP compression detected. - only supplied "/" tested
                                           Can be ignored for static pages or if no secrets in the page
 POODLE, SSL (CVE-2014-3566)               not vulnerable (OK)
 TLS_FALLBACK_SCSV (RFC 7507)              Downgrade attack prevention supported (OK)
 SWEET32 (CVE-2016-2183, CVE-2016-6329)    VULNERABLE, uses 64 bit block ciphers
 FREAK (CVE-2015-0204)                     not vulnerable (OK)
 DROWN (CVE-2016-0800, CVE-2016-0703)      not vulnerable on this host and port (OK)
                                           make sure you don't use this certificate elsewhere with SSLv2 enabled services
                                           https://censys.io/ipv4?q=0E745E5E77A60345EB6E6B33B99A36286C2203D687F3377FBC685B2434518C53 could help you to find out
 LOGJAM (CVE-2015-4000), experimental      not vulnerable (OK): no DH EXPORT ciphers, no DH key detected with <= TLS 1.2
 BEAST (CVE-2011-3389)                     TLS1: ECDHE-RSA-AES128-SHA AES128-SHA ECDHE-RSA-AES256-SHA AES256-SHA DES-CBC3-SHA
                                           VULNERABLE -- but also supports higher protocols  TLSv1.1 TLSv1.2 (likely mitigated)
 LUCKY13 (CVE-2013-0169), experimental     potentially VULNERABLE, uses cipher block chaining (CBC) ciphers with TLS. Check patches
 Winshock (CVE-2014-6321), experimental    not vulnerable (OK)
 RC4 (CVE-2013-2566, CVE-2015-2808)        no RC4 ciphers detected (OK)


 Done 2022-01-05 18:42:26 [  36s] -->> 104.22.40.171:443 (netology.ru) <<--

---------------------------------------------------------------------------------------------------------------------------------------------------
 Start 2022-01-05 18:42:26        -->> 104.22.41.171:443 (netology.ru) <<--

 Further IP addresses:   172.67.21.207 104.22.40.171 2606:4700:10::ac43:15cf 2606:4700:10::6816:29ab 2606:4700:10::6816:28ab
 rDNS (104.22.41.171):   --
 Service detected:       HTTP


 Testing vulnerabilities

 Heartbleed (CVE-2014-0160)                not vulnerable (OK), no heartbeat extension
 CCS (CVE-2014-0224)                       not vulnerable (OK)
 Ticketbleed (CVE-2016-9244), experiment.  not vulnerable (OK), no session tickets
 ROBOT                                     not vulnerable (OK)
 Secure Renegotiation (RFC 5746)           OpenSSL handshake didn't succeed
 Secure Client-Initiated Renegotiation     not vulnerable (OK)
 CRIME, TLS (CVE-2012-4929)                not vulnerable (OK)
 BREACH (CVE-2013-3587)                    potentially NOT ok, "gzip" HTTP compression detected. - only supplied "/" tested
                                           Can be ignored for static pages or if no secrets in the page
 POODLE, SSL (CVE-2014-3566)               not vulnerable (OK)
 TLS_FALLBACK_SCSV (RFC 7507)              Downgrade attack prevention supported (OK)
 SWEET32 (CVE-2016-2183, CVE-2016-6329)    VULNERABLE, uses 64 bit block ciphers
 FREAK (CVE-2015-0204)                     not vulnerable (OK)
 DROWN (CVE-2016-0800, CVE-2016-0703)      not vulnerable on this host and port (OK)
                                           make sure you don't use this certificate elsewhere with SSLv2 enabled services
                                           https://censys.io/ipv4?q=0E745E5E77A60345EB6E6B33B99A36286C2203D687F3377FBC685B2434518C53 could help you to find out
 LOGJAM (CVE-2015-4000), experimental      not vulnerable (OK): no DH EXPORT ciphers, no DH key detected with <= TLS 1.2
 BEAST (CVE-2011-3389)                     TLS1: ECDHE-RSA-AES128-SHA AES128-SHA ECDHE-RSA-AES256-SHA AES256-SHA DES-CBC3-SHA
                                           VULNERABLE -- but also supports higher protocols  TLSv1.1 TLSv1.2 (likely mitigated)
 LUCKY13 (CVE-2013-0169), experimental     potentially VULNERABLE, uses cipher block chaining (CBC) ciphers with TLS. Check patches
 Winshock (CVE-2014-6321), experimental    not vulnerable (OK)
 RC4 (CVE-2013-2566, CVE-2015-2808)        no RC4 ciphers detected (OK)


 Done 2022-01-05 18:43:00 [  70s] -->> 104.22.41.171:443 (netology.ru) <<--

---------------------------------------------------------------------------------------------------------------------------------------------------
 Start 2022-01-05 18:43:00        -->> 172.67.21.207:443 (netology.ru) <<--

 Further IP addresses:   104.22.41.171 104.22.40.171 2606:4700:10::ac43:15cf 2606:4700:10::6816:29ab 2606:4700:10::6816:28ab
 rDNS (172.67.21.207):   --
 Service detected:       HTTP


 Testing vulnerabilities

 Heartbleed (CVE-2014-0160)                not vulnerable (OK), no heartbeat extension
 CCS (CVE-2014-0224)                       not vulnerable (OK)
 Ticketbleed (CVE-2016-9244), experiment.  not vulnerable (OK), no session tickets
 ROBOT                                     not vulnerable (OK)
 Secure Renegotiation (RFC 5746)           OpenSSL handshake didn't succeed
 Secure Client-Initiated Renegotiation     not vulnerable (OK)
 CRIME, TLS (CVE-2012-4929)                not vulnerable (OK)
 BREACH (CVE-2013-3587)                    potentially NOT ok, "gzip" HTTP compression detected. - only supplied "/" tested
                                           Can be ignored for static pages or if no secrets in the page
 POODLE, SSL (CVE-2014-3566)               not vulnerable (OK)
 TLS_FALLBACK_SCSV (RFC 7507)              Downgrade attack prevention supported (OK)
 SWEET32 (CVE-2016-2183, CVE-2016-6329)    VULNERABLE, uses 64 bit block ciphers
 FREAK (CVE-2015-0204)                     not vulnerable (OK)
 DROWN (CVE-2016-0800, CVE-2016-0703)      not vulnerable on this host and port (OK)
                                           make sure you don't use this certificate elsewhere with SSLv2 enabled services
                                           https://censys.io/ipv4?q=0E745E5E77A60345EB6E6B33B99A36286C2203D687F3377FBC685B2434518C53 could help you to find out
 LOGJAM (CVE-2015-4000), experimental      not vulnerable (OK): no DH EXPORT ciphers, no DH key detected with <= TLS 1.2
 BEAST (CVE-2011-3389)                     TLS1: ECDHE-RSA-AES128-SHA AES128-SHA ECDHE-RSA-AES256-SHA AES256-SHA DES-CBC3-SHA
                                           VULNERABLE -- but also supports higher protocols  TLSv1.1 TLSv1.2 (likely mitigated)
 LUCKY13 (CVE-2013-0169), experimental     potentially VULNERABLE, uses cipher block chaining (CBC) ciphers with TLS. Check patches
 Winshock (CVE-2014-6321), experimental    not vulnerable (OK)
 RC4 (CVE-2013-2566, CVE-2015-2808)        no RC4 ciphers detected (OK)


 Done 2022-01-05 18:43:35 [ 105s] -->> 172.67.21.207:443 (netology.ru) <<--

---------------------------------------------------------------------------------------------------------------------------------------------------
Done testing now all IP addresses (on port 443): 104.22.40.171 104.22.41.171 172.67.21.207
  ```
# Задание 5. Установите на Ubuntu ssh сервер, сгенерируйте новый приватный ключ. Скопируйте свой публичный ключ на другой сервер. Подключитесь к серверу по SSH-ключу.
 
 ### Ответ:
  ```bash
 login as: khrom
khrom@192.168.99.40's password:
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.11.0-44-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

0 updates can be applied immediately.

Your Hardware Enablement Stack (HWE) is supported until April 2025.

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

khrom@ubuntu:~$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/khrom/.ssh/id_rsa): /home/khrom/.ssh/id_rsa
Created directory '/home/khrom/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/khrom/.ssh/id_rsa
Your public key has been saved in /home/khrom/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:3zllcWHMqVzTj+44GsFRRKUdhRsQiDTcXiv4Gst+IWI khrom@ubuntu
The key's randomart image is:
+---[RSA 3072]----+
|       ooo +*+==+|
|        o.o..o+Bo|
|         o..o.=++|
|        ..o..ooo.|
|        S.o. .o  |
|      E o.oo +.  |
|     . o =o.+o   |
|        + ..o..  |
|       ..... .   |
+----[SHA256]-----+
khrom@ubuntu:~$ ssh-copy-id khrom@192.168.99.30
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/khrom/.ssh/id_rsa.pub"
The authenticity of host '192.168.99.30 (192.168.99.30)' can't be established.
ECDSA key fingerprint is SHA256:Dz+FgH542Jm4wS9rZeVL3QXbDhFoNPFCBj/dKzsUA9s.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
khrom@192.168.99.30's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'khrom@192.168.99.30'"
and check to make sure that only the key(s) you wanted were added.

khrom@ubuntu:~$  ssh khrom@192.168.99.30
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.11.0-43-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

32 updates can be applied immediately.
Чтобы просмотреть дополнительные обновления выполните: apt list --upgradable

Your Hardware Enablement Stack (HWE) is supported until April 2025.
*** System restart required ***
Last login: Wed Jan  5 22:23:15 2022 from 192.168.99.2
khrom@srv-1:~$

  ```
# Задание 6. Переименуйте файлы ключей из задания 5. Настройте файл конфигурации SSH клиента, так чтобы вход на удаленный сервер осуществлялся по имени сервера.

 ### Ответ:
  ```bash
khrom@srv-1:~$ mv ~/.ssh/id_rsa ~/.ssh/ub_virt.key
khrom@srv-1:~$ touch ~/.ssh/config && chmod 755 ~/.ssh/config
khrom@srv-1:~$ nano ~/.ssh/config

  ```

 ```bash
Host ub_virt
    HostName 192.168.99.40
    IdentityFile ~/.ssh/ub_virt.key
    User khrom
 ```

```bash
khrom@srv-1:~$ ssh ub_virt
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.11.0-44-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

0 updates can be applied immediately.

Your Hardware Enablement Stack (HWE) is supported until April 2025.
Last login: Wed Jan  5 12:05:32 2022 from 192.168.99.30
khrom@ubuntu:~$


```

# Задание 7. Соберите дамп трафика утилитой tcpdump в формате pcap, 100 пакетов. Откройте файл pcap в Wireshark.

```bash
khrom@srv-1:~$ sudo tcpdump -i enp4s0 -c 100 -w 0001.pcap
[sudo] пароль для khrom:
tcpdump: listening on enp4s0, link-type EN10MB (Ethernet), capture size 262144 bytes

```

https://drive.google.com/file/d/1Ib0-PrBUxZdfayXM-CJMx8Cih2MmyRP7/view?usp=sharing