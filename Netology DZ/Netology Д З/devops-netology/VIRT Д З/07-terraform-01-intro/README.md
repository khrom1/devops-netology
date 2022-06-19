# Домашнее задание к занятию "7.1. Инфраструктура как код"

## Задача 1. Выбор инструментов. 
 
### Легенда
 
Через час совещание на котором менеджер расскажет о новом проекте. Начать работу над которым надо 
будет уже сегодня. 
На данный момент известно, что это будет сервис, который ваша компания будет предоставлять внешним заказчикам.
Первое время, скорее всего, будет один внешний клиент, со временем внешних клиентов станет больше.

Так же по разговорам в компании есть вероятность, что техническое задание еще не четкое, что приведет к большому
количеству небольших релизов, тестирований интеграций, откатов, доработок, то есть скучно не будет.  
   
Вам, как девопс инженеру, будет необходимо принять решение об инструментах для организации инфраструктуры.
На данный момент в вашей компании уже используются следующие инструменты: 
- остатки Сloud Formation, 
- некоторые образы сделаны при помощи Packer,
- год назад начали активно использовать Terraform, 
- разработчики привыкли использовать Docker, 
- уже есть большая база Kubernetes конфигураций, 
- для автоматизации процессов используется Teamcity, 
- также есть совсем немного Ansible скриптов, 
- и ряд bash скриптов для упрощения рутинных задач.  

Для этого в рамках совещания надо будет выяснить подробности о проекте, что бы в итоге определиться с инструментами:

### 1. Какой тип инфраструктуры будем использовать для этого проекта: изменяемый или не изменяемый?

### Ответ:

Рекомендую изменяемый тип так как ТЗ не определённое, а со временем можно и перейти на неизменяемый тип.

### 2. Будет ли центральный сервер для управления инфраструктурой?

### Ответ:

Необходимости в центральном сервере не вижу.


### 3. Будут ли агенты на серверах?

### Ответ:

Необходимости в агентах не вижу.


### 4. Будут ли использованы средства для управления конфигурацией или инициализации ресурсов? 

### Ответ:

Предлагаю использовать для инициализации Terraform, а для управления конфигурацией Ansible.
 
В связи с тем, что проект стартует уже сегодня, в рамках совещания надо будет определиться со всеми этими вопросами.

### В результате задачи необходимо

1. Ответить на четыре вопроса представленных в разделе "Легенда". 
1. Какие инструменты из уже используемых вы хотели бы использовать для нового проекта? 
1. Хотите ли рассмотреть возможность внедрения новых инструментов для этого проекта? 

Если для ответа на эти вопросы недостаточно информации, то напишите какие моменты уточните на совещании.


## Задача 2. Установка терраформ. 

Официальный сайт: https://www.terraform.io/

Установите терраформ при помощи менеджера пакетов используемого в вашей операционной системе.
В виде результата этой задачи приложите вывод команды `terraform --version`.

```
khrom@ubuntu:~/Downloads$ wget https://hashicorp-releases.website.yandexcloud.net/terraform/1.1.6/terraform_1.1.6_linux_amd64.zip
--2022-04-02 14:49:27--  https://hashicorp-releases.website.yandexcloud.net/terraform/1.1.6/terraform_1.1.6_linux_amd64.zip
Resolving hashicorp-releases.website.yandexcloud.net (hashicorp-releases.website.yandexcloud.net)... 213.180.193.247, 2a02:6b8::1da
Connecting to hashicorp-releases.website.yandexcloud.net (hashicorp-releases.website.yandexcloud.net)|213.180.193.247|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 18751464 (18M) [application/zip]
Saving to: ‘terraform_1.1.6_linux_amd64.zip’

terraform_1.1.6_lin 100%[===================>]  17,88M  62,5MB/s    in 0,3s    

Last-modified header invalid -- time-stamp ignored.
2022-04-02 14:49:28 (62,5 MB/s) - ‘terraform_1.1.6_linux_amd64.zip’ saved [18751464/18751464]

khrom@ubuntu:~/Downloads$ unzip terraform_1.1.6_linux_amd64.zip 
Archive:  terraform_1.1.6_linux_amd64.zip
  inflating: terraform 
  
khrom@ubuntu:~/Downloads$ sudo mv terraform /usr/local/bin/
[sudo] password for khrom: 
khrom@ubuntu:~/Downloads$ cd
```
### Ответ:

```

khrom@ubuntu:~$ terraform -v
Terraform v1.1.6
on linux_amd64

Your version of Terraform is out of date! The latest version
is 1.1.7. You can update by downloading from https://www.terraform.io/downloads.html
khrom@ubuntu:~$ 
 

```

## Задача 3. Поддержка легаси кода. 

В какой-то момент вы обновили терраформ до новой версии, например с 0.12 до 0.13. 
А код одного из проектов настолько устарел, что не может работать с версией 0.13. 
В связи с этим необходимо сделать так, чтобы вы могли одновременно использовать последнюю версию терраформа установленную при помощи
штатного менеджера пакетов и устаревшую версию 0.12. 

В виде результата этой задачи приложите вывод `--version` двух версий терраформа доступных на вашем компьютере 
или виртуальной машине.



```
khrom@ubuntu:~/Downloads/1.1.5$ wget https://hashicorp-releases.website.yandexcloud.net/terraform/1.1.5/terraform_1.1.5_linux_amd64.zip
--2022-04-02 15:15:32--  https://hashicorp-releases.website.yandexcloud.net/terraform/1.1.5/terraform_1.1.5_linux_amd64.zip
Resolving hashicorp-releases.website.yandexcloud.net (hashicorp-releases.website.yandexcloud.net)... 213.180.193.247, 2a02:6b8::1da
Connecting to hashicorp-releases.website.yandexcloud.net (hashicorp-releases.website.yandexcloud.net)|213.180.193.247|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 18748879 (18M) [application/zip]
Saving to: ‘terraform_1.1.5_linux_amd64.zip’

terraform_1.1.5_lin 100%[===================>]  17,88M  53,2MB/s    in 0,3s    

Last-modified header invalid -- time-stamp ignored.
2022-04-02 15:15:33 (53,2 MB/s) - ‘terraform_1.1.5_linux_amd64.zip’ saved [18748879/18748879]

khrom@ubuntu:~/Downloads/1.1.5$ unzip terraform_1.1.5_linux_amd64.zip 
Archive:  terraform_1.1.5_linux_amd64.zip
  inflating: terraform 
khrom@ubuntu:~/Downloads/1.1.5$ mv terraform terraform_v1.1.5
khrom@ubuntu:~/Downloads/1.1.5$ sudo mv terraform_v1.1.5 /usr/local/bin/
khrom@ubuntu:~/Downloads/1.1.5$ cd
```
### Ответ:

```
khrom@ubuntu:~$ terraform_v1.1.5 -v
Terraform v1.1.5
on linux_amd64

Your version of Terraform is out of date! The latest version
is 1.1.7. You can update by downloading from https://www.terraform.io/downloads.html
khrom@ubuntu:~$ terraform -v
Terraform v1.1.6
on linux_amd64

Your version of Terraform is out of date! The latest version
is 1.1.7. You can update by downloading from https://www.terraform.io/downloads.html
khrom@ubuntu:~$ 

```

---

### Как cдавать задание

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
