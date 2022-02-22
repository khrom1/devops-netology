
# Домашнее задание к занятию "5.3. Введение. Экосистема. Архитектура. Жизненный цикл Docker контейнера"


## Задача 1

Сценарий выполения задачи:

- создайте свой репозиторий на https://hub.docker.com;
- выберете любой образ, который содержит веб-сервер Nginx;
- создайте свой fork образа;
- реализуйте функциональность:
запуск веб-сервера в фоне с индекс-страницей, содержащей HTML-код ниже:
```
<html>
<head>
Hey, Netology
</head>
<body>
<h1>I’m DevOps Engineer!</h1>
</body>
</html>
```
Опубликуйте созданный форк в своем репозитории и предоставьте ответ в виде ссылки на https://hub.docker.com/username_repo.

#Загрузил и запустил контейнер 
```
khrom@ubuntu:~$ sudo docker run  -d --name nginx-khrom  -p 8080:80 nginx

2fb38782705c47d1a12ce907430ce86bc65691f8502391ff74c5de684fb08ade

khrom@ubuntu:~$  sudo docker ps

CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                                   NAMES
2fb38782705c   nginx     "/docker-entrypoint.…"   21 seconds ago   Up 20 seconds   0.0.0.0:8080->80/tcp, :::8080->80/tcp   nginx-khrom
```
#Зашёл в контейнер
```
khrom@ubuntu:~$ docker exec -it  nginx-khrom bash



root@2fb38782705c:/# apt update


root@2fb38782705c:/# apt install nano

root@2fb38782705c:/# cd /usr/share/nginx/html/
root@2fb38782705c:/usr/share/nginx/html# nano index.html

root@2fb38782705c:~# exit
exit
khrom@ubuntu:~$

khrom@ubuntu:~$ sudo docker login -u khrom1
Password:

Login Succeeded


khrom@ubuntu:~$ sudo docker commit nginx-khrom khrom1/nginx-khrom:v1.0

khrom@ubuntu:~$ sudo docker push  khrom1/nginx:v1.0
The push refers to repository [docker.io/khrom1/nginx]
9bc394594fc2: Pushed
762b147902c0: Mounted from library/nginx
235e04e3592a: Mounted from library/nginx
6173b6fa63db: Mounted from library/nginx
9a94c4a55fe4: Mounted from library/nginx
9a3a6af98e18: Mounted from library/nginx
7d0ebbe3f5d2: Mounted from library/nginx
v1.0: digest: sha256:50dd515fe438c0d734bc49eb4cb0cc7f55f457e4776fa407bc5d3b0213a95f28 size: 1782

```
https://hub.docker.com/repository/docker/khrom1/nginx


## Задача 2

Посмотрите на сценарий ниже и ответьте на вопрос:
"Подходит ли в этом сценарии использование Docker контейнеров или лучше подойдет виртуальная машина, физическая машина? Может быть возможны разные варианты?"

Детально опишите и обоснуйте свой выбор.

--

Сценарий:

##Высоконагруженное монолитное java веб-приложение;

Для высоконагруженных приложений скорее подойдёт физический сервер , а не виртуализация уровня ОС к которым относится docker
##Nodejs веб-приложение;

Для этих задач подойдёт Docker

##Мобильное приложение c версиями для Android и iOS;

Для этих задач лучше использовать физическое устройство с графическим интерфейсом

##Шина данных на базе Apache Kafka;

Думаю подойдёт Docker но лучше полноценная виртуалка 

##Elasticsearch кластер для реализации логирования продуктивного веб-приложения - три ноды elasticsearch, два logstash и две ноды kibana;

Думаю подойдёт Docker Swarm но лучше полноценные виртуалки

##Мониторинг-стек на базе Prometheus и Grafana;

Для этих задач подойдёт Docker


##MongoDB, как основное хранилище данных для java-приложения;

Сама база не хранится в контейнере 

##Gitlab сервер для реализации CI/CD процессов и приватный (закрытый) Docker Registry.

Для этих задач подойдёт Docker

## Задача 3

- Запустите первый контейнер из образа ***centos*** c любым тэгом в фоновом режиме, подключив папку ```/data``` из текущей рабочей директории на хостовой машине в ```/data``` контейнера;
- Запустите второй контейнер из образа ***debian*** в фоновом режиме, подключив папку ```/data``` из текущей рабочей директории на хостовой машине в ```/data``` контейнера;
- Подключитесь к первому контейнеру с помощью ```docker exec``` и создайте текстовый файл любого содержания в ```/data```;
- Добавьте еще один файл в папку ```/data``` на хостовой машине;
- Подключитесь во второй контейнер и отобразите листинг и содержание файлов в ```/data``` контейнера.

## Задача 4 (*)

Воспроизвести практическую часть лекции самостоятельно.

Соберите Docker образ с Ansible, загрузите на Docker Hub и пришлите ссылку вместе с остальными ответами к задачам.


---

### Как cдавать задание

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
