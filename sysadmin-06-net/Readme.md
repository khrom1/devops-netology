# Домашнее задание к занятию "3.6. Компьютерные сети, лекция 1"

# Задание 1. Работа c HTTP через телнет.
- Подключитесь утилитой телнет к сайту stackoverflow.com
`telnet stackoverflow.com 80`
- отправьте HTTP запрос
```bash
GET /questions HTTP/1.0
HOST: stackoverflow.com
[press enter]
[press enter]
```
- В ответе укажите полученный HTTP код, что он означает?

# Ответ:

```bash
Trying 151.101.1.69...
Connected to stackoverflow.com.
Escape character is '^]'.
GET /questions HTTP/1.0
HOST: stackoverflow.com

HTTP/1.1 301 Moved Permanently
cache-control: no-cache, no-store, must-revalidate
location: https://stackoverflow.com/questions
x-request-guid: d15c3db3-f249-4286-92b2-58ad72134ab7
feature-policy: microphone 'none'; speaker 'none'
content-security-policy: upgrade-insecure-requests; frame-ancestors 'self' https://stackexchange.com
Accept-Ranges: bytes
Date: Sat, 18 Dec 2021 22:39:47 GMT
Via: 1.1 varnish
Connection: close
X-Served-By: cache-fra19136-FRA
X-Cache: MISS
X-Cache-Hits: 0
X-Timer: S1639867187.962254,VS0,VE92
Vary: Fastly-SSL
X-DNS-Prefetch-Control: off
Set-Cookie: prov=2974766d-27b1-6814-3bd0-a24167af88ee; domain=.stackoverflow.com; expires=Fri, 01-Jan-2055 00:00:00 GMT; path=/; HttpOnly

Connection closed by foreign host.

```

код ответа 301





# Задание 2. Повторите задание 1 в браузере, используя консоль разработчика F12.
- откройте вкладку `Network`
- отправьте запрос http://stackoverflow.com
- найдите первый ответ HTTP сервера, откройте вкладку `Headers`
- укажите в ответе полученный HTTP код.
- проверьте время загрузки страницы, какой запрос обрабатывался дольше всего?
- приложите скриншот консоли браузера в ответ.

# Ответ:

Код ответа 200

https://drive.google.com/file/d/1Q4iiUAJJxDikwOQy5jRxsat4K1YwEI1K/view?usp=sharing

# Задание 3. Какой IP адрес у вас в интернете?

# Ответ:

95.165.27.58

# Задание 4. Какому провайдеру принадлежит ваш IP адрес? Какой автономной системе AS? Воспользуйтесь утилитой `whois`

# Ответ:

Провайдер Moscow Local Telephone Network (OAO MGTS)

автономная система AS25513

```bash
root@srv-1:~# whois 95.165.27.58
% This is the RIPE Database query service.
% The objects are in RPSL format.
%
% The RIPE Database is subject to Terms and Conditions.
% See http://www.ripe.net/db/support/db-terms-conditions.pdf

% Note: this output has been filtered.
%       To receive output for a database update, use the "-B" flag.

% Information related to '95.165.0.0 - 95.165.127.255'

% Abuse contact for '95.165.0.0 - 95.165.127.255' is 'abuse@spd-mgts.ru'

inetnum:        95.165.0.0 - 95.165.127.255
netname:        MGTS-PPPOE
descr:          Moscow Local Telephone Network (OAO MGTS)
country:        RU
admin-c:        USPD-RIPE
tech-c:         USPD-RIPE
status:         ASSIGNED PA
mnt-by:         MGTS-USPD-MNT
created:        2009-11-27T18:33:25Z
last-modified:  2009-11-27T18:33:25Z
source:         RIPE

role:           PJSC Moscow City Telephone Network NOC
address:        USPD MGTS
address:        Moscow, Russia
address:        Khachaturyana 5
admin-c:        AGS9167-RIPE
admin-c:        AVK103-RIPE
admin-c:        GIA45-RIPE
tech-c:         AVK103-RIPE
tech-c:         VMK
tech-c:         ANO3-RIPE
abuse-mailbox:  abuse@spd-mgts.ru
nic-hdl:        USPD-RIPE
mnt-by:         MGTS-USPD-MNT
created:        2006-09-11T07:56:01Z
last-modified:  2021-04-13T10:41:35Z
source:         RIPE # Filtered

% Information related to '95.165.0.0/16AS25513'

route:          95.165.0.0/16
descr:          Moscow Local Telephone Network (OAO MGTS)
descr:          Moscow, Russia
origin:         AS25513
mnt-by:         MGTS-USPD-MNT
created:        2009-01-27T13:52:05Z
last-modified:  2009-01-27T13:52:05Z
source:         RIPE

% This query was served by the RIPE Database Query Service version 1.102.1 (ANGUS)

```
# Задание 5. Через какие сети проходит пакет, отправленный с вашего компьютера на адрес 8.8.8.8? Через какие AS? Воспользуйтесь утилитой `traceroute`

# Ответ:
```bash
khrom@srv-1:~$ traceroute -An 8.8.8.8
traceroute to 8.8.8.8 (8.8.8.8), 30 hops max, 60 byte packets
 1  192.168.99.1 [*]  0.355 ms  0.333 ms  339.909 ms
 2  192.168.1.1 [*]  339.900 ms  339.880 ms  339.865 ms
 3  95.165.24.1 [AS25513]  2.336 ms  2.284 ms  2.725 ms
 4  212.188.1.106 [AS8359]  3.505 ms  3.532 ms  3.463 ms
 5  212.188.1.105 [AS8359]  2.711 ms  2.946 ms  3.465 ms
 6  212.188.56.13 [AS8359]  4.993 ms  3.702 ms  3.596 ms
 7  195.34.50.74 [AS8359]  3.154 ms  3.534 ms  3.472 ms
 8  212.188.29.82 [AS8359]  3.199 ms  3.396 ms  3.375 ms
 9  108.170.250.130 [AS15169]  5.390 ms 108.170.250.66 [AS15169]  4.462 ms 108.170.250.83 [AS15169]  4.045 ms
10  172.253.66.116 [AS15169]  20.120 ms 209.85.255.136 [AS15169]  22.440 ms *
11  172.253.65.82 [AS15169]  20.023 ms  20.256 ms  34.347 ms
12  142.250.56.125 [AS15169]  20.199 ms 216.239.49.113 [AS15169]  20.673 ms 142.250.56.131 [AS15169]  22.063 ms
13  * * *
14  * * *
15  * * *
16  * * *
17  * * *
18  * * *
19  * 8.8.8.8 [AS15169]  20.616 ms *

root@srv-1:~#

```
# Задание 6. Повторите задание 5 в утилите `mtr`. На каком участке наибольшая задержка - delay?

# Ответ:
```bash
                          My traceroute  [v0.93]
srv-1 (192.168.99.30)                                             2021-12-19T02:37:49+0300
Keys:  Help   Display mode   Restart statistics   Order of fields   quit
                                                  Packets               Pings
 Host                                           Loss%   Snt   Last   Avg  Best  Wrst StDev
 1. AS???    192.168.99.1                        0.0%    19    0.3   0.3   0.2   0.4   0.0
 2. AS???    192.168.1.1                         0.0%    19    0.7   0.6   0.6   0.7   0.0
 3. AS25513  95.165.24.1                         0.0%    19    3.6   3.0   1.4   3.8   0.7
 4. AS8359   212.188.1.106                       0.0%    19    2.8   3.6   2.4   4.7   0.6
 5. AS8359   212.188.1.105                       0.0%    18    4.5   4.0   2.6   4.5   0.4
 6. AS8359   212.188.56.13                       0.0%    18    6.0   5.7   3.5   9.1   1.5
 7. AS8359   195.34.50.74                        0.0%    18    5.1   4.8   3.5   5.9   0.8
 8. AS8359   212.188.29.82                       0.0%    18    3.0   4.8   3.0   5.5   0.6
 9. AS15169  108.170.250.113                     0.0%    18    4.1   5.8   3.9  16.6   2.8
 10. AS15169  216.239.51.32                      52.9%    18   21.3  22.8  21.3  23.5   0.7
 11. AS15169  74.125.253.109                      0.0%    18   20.0  22.4  18.2  37.6   5.2
 12. AS15169  142.250.56.217                      0.0%    18   23.2  22.9  21.7  27.3   1.6
 13. (waiting for reply)
 14. (waiting for reply)
 15. (waiting for reply)
 16. (waiting for reply)
 17. (waiting for reply)
 18. (waiting for reply)
 19. (waiting for reply)
 20. (waiting for reply)
 21. (waiting for reply)
 22. AS15169  8.8.8.8                            66.7%    18   20.4  21.1  18.1  23.0   2.0

```

на участке между 74.125.253.109  и   142.250.56.217 самая большая задержка

# Задание 7. Какие DNS сервера отвечают за доменное имя dns.google? Какие A записи? воспользуйтесь утилитой `dig`

# Ответ:
```bash

;; ANSWER SECTION:
      A       8.8.8.8
     A       8.8.4.4

```
# Задание 8. Проверьте PTR записи для IP адресов из задания 7. Какое доменное имя привязано к IP? воспользуйтесь утилитой `dig`

В качестве ответов на вопросы можно приложите лог выполнения команд в консоли или скриншот полученных результатов.

# Ответ:
---
```bash
root@vagrant:~# dig -x 8.8.8.8

; <<>> DiG 9.16.1-Ubuntu <<>> -x 8.8.8.8
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 20449
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;8.8.8.8.in-addr.arpa.          IN      PTR

;; ANSWER SECTION:
8.8.8.8.in-addr.arpa.   5691    IN      PTR     dns.google.

;; Query time: 4 msec
;; SERVER: 127.0.0.53#53(127.0.0.53)
;; WHEN: Sat Dec 18 23:54:19 UTC 2021
;; MSG SIZE  rcvd: 73
```

PTR     dns.google


```bash
root@vagrant:~# dig -x 8.8.4.4

; <<>> DiG 9.16.1-Ubuntu <<>> -x 8.8.4.4
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 16400
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;4.4.8.8.in-addr.arpa.          IN      PTR

;; ANSWER SECTION:
4.4.8.8.in-addr.arpa.   19942   IN      PTR     dns.google.

;; Query time: 28 msec
;; SERVER: 127.0.0.53#53(127.0.0.53)
;; WHEN: Sat Dec 18 23:55:51 UTC 2021
;; MSG SIZE  rcvd: 73
```


PTR     dns.google.