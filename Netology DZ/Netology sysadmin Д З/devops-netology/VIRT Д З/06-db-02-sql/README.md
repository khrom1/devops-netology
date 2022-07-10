# Домашнее задание к занятию "6.2. SQL"

## Введение

Перед выполнением задания вы можете ознакомиться с 
[дополнительными материалами](https://github.com/netology-code/virt-homeworks/tree/master/additional/README.md).

## Задача 1

Используя docker поднимите инстанс PostgreSQL (версию 12) c 2 volume, 
в который будут складываться данные БД и бэкапы.

Приведите получившуюся команду или docker-compose манифест.


```

khrom@ubuntu:~$ sudo docker pull postgres:12





khrom@ubuntu:~$ sudo docker volume create post1
post1
khrom@ubuntu:~$ sudo docker volume create post2
post2


khrom@ubuntu:~$ sudo docker run --rm --name post -e POSTGRES_PASSWORD=123456 -ti -p 5432:5432 -v post1:/var/lib/postgresql/data -v post2:/var/lib/postgresql/data1 postgres:12

root@ubuntu:/home/khrom# docker ps 
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS          PORTS                                       NAMES
f95f0edca5d5   postgres:12   "docker-entrypoint.s…"   14 minutes ago   Up 14 minutes   0.0.0.0:5432->5432/tcp, :::5432->5432/tcp   post


root@ubuntu:/home/khrom# apt install postgresql-client

root@ubuntu:/home/khrom# psql -h 127.0.0.1 -U postgres -d postgres
Password for user postgres: 
psql (12.9 (Ubuntu 12.9-0ubuntu0.20.04.1), server 12.10 (Debian 12.10-1.pgdg110+1))
Type "help" for help.

postgres=# 





postgres=# \l
                                 List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   
-----------+----------+----------+------------+------------+-----------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
(3 rows)


``` 

## Задача 2

В БД из задачи 1: 
- создайте пользователя test-admin-user и БД test_db

```
root@ubuntu:/home/khrom# psql -h 127.0.0.1 -U postgres -d postgres
Password for user postgres: 
psql (12.9 (Ubuntu 12.9-0ubuntu0.20.04.1), server 12.10 (Debian 12.10-1.pgdg110+1))
Type "help" for help.

postgres=#  CREATE DATABASE test_db;
CREATE DATABASE
postgres=# \q

root@ubuntu:/home/khrom# psql -h 127.0.0.1 -U postgres -d test_db
Password for user postgres: 
psql (12.9 (Ubuntu 12.9-0ubuntu0.20.04.1), server 12.10 (Debian 12.10-1.pgdg110+1))
Type "help" for help.

CREATE ROLE "test-admin-user" SUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN;

```
- в БД test_db создайте таблицу orders и clients (спeцификация таблиц ниже)

orders

```
CREATE TABLE orders
 (
 Id integer,
 Наименование text,
 Цена integer,
 PRIMARY KEY (Id)
 );
CREATE TABLE
```

clients

```
 CREATE TABLE clients
(
 Id integer,
 Фамилия text,
 Страна_проживания text,
 Заказ integer,
 FOREIGN KEY (Заказ) REFERENCES orders (Id)
 );
CREATE TABLE
test_db=# 
```

- предоставьте привилегии на все операции пользователю test-admin-user на таблицы БД test_db
- создайте пользователя test-simple-user  
```
test_db=# CREATE ROLE "test-simple-user" NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN;
```
- предоставьте пользователю test-simple-user права на SELECT/INSERT/UPDATE/DELETE данных таблиц БД test_db


```
GRANT SELECT ON TABLE public.clients TO "test-simple-user";
GRANT INSERT ON TABLE public.clients TO "test-simple-user";
GRANT UPDATE ON TABLE public.clients TO "test-simple-user";
GRANT DELETE ON TABLE public.clients TO "test-simple-user";
GRANT SELECT ON TABLE public.orders TO "test-simple-user";
GRANT INSERT ON TABLE public.orders TO "test-simple-user";
GRANT UPDATE ON TABLE public.orders TO "test-simple-user";
GRANT DELETE ON TABLE public.orders TO "test-simple-user";
```

Таблица orders:
- id (serial primary key)
- наименование (string)
- цена (integer)

Таблица clients:
- id (serial primary key)
- фамилия (string)
- страна проживания (string, index)
- заказ (foreign key orders)


Приведите:
- итоговый список БД после выполнения пунктов выше,
- описание таблиц (describe)
```
test_db=# \dt

- 
          List of relations
 Schema |  Name   | Type  |  Owner   
--------+---------+-------+----------
 public | clients | table | postgres
 public | orders  | table | postgres
(2 rows)

```

- SQL-запрос для выдачи списка пользователей с правами над таблицами test_db
```
test_db=# \du
```
- список пользователей с правами над таблицами test_db
```
                                       List of roles
    Role name     |                         Attributes                         | Member of 
------------------+------------------------------------------------------------+-----------
 postgres         | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
 test-admin-user  | Superuser, No inheritance                                  | {}
 test-simple-user | No inheritance                                             | {}
```


## Задача 3

Используя SQL синтаксис - наполните таблицы следующими тестовыми данными:

Таблица orders

|Наименование|цена|
|------------|----|
|Шоколад| 10 |
|Принтер| 3000 |
|Книга| 500 |
|Монитор| 7000|
|Гитара| 4000|
```
test_db=# insert into orders VALUES (1, 'Шоколад', 10), (2, 'Принтер', 3000), (3, 'Книга', 500), (4, 'Монитор', 7000), (5, 'Гитара', 4000);
INSERT 0 5
test_db=# select * from orders;
 id | Наименование | Цена 
----+--------------+------
  1 | Шоколад      |   10
  2 | Принтер      | 3000
  3 | Книга        |  500
  4 | Монитор      | 7000
  5 | Гитара       | 4000
(5 rows)
```


Таблица clients

|ФИО|Страна проживания|
|------------|----|
|Иванов Иван Иванович| USA |
|Петров Петр Петрович| Canada |
|Иоганн Себастьян Бах| Japan |
|Ронни Джеймс Дио| Russia|
|Ritchie Blackmore| Russia|
```
test_db=# insert into clients VALUES (1, 'Иванов Иван Иванович', 'USA'), (2, 'Петров Петр Петрович', 'Canada'), (3, 'Иоганн Себастьян Бах', 'Japan'), (4, 'Ронни Джеймс Дио', 'Russia'), (5, 'Ritchie Blackmore', 'Russia');
INSERT 0 5
test_db=# select * from clients;
 id |       Фамилия        | Страна_проживания | Заказ 
----+----------------------+-------------------+-------
  1 | Иванов Иван Иванович | USA               |      
  2 | Петров Петр Петрович | Canada            |      
  3 | Иоганн Себастьян Бах | Japan             |      
  4 | Ронни Джеймс Дио     | Russia            |      
  5 | Ritchie Blackmore    | Russia            |      
(5 rows)

```

Используя SQL синтаксис:
- вычислите количество записей для каждой таблицы 
- приведите в ответе:
    - запросы 
```
select count(*) from orders;

select count(*) from clients;

```

   - результаты их выполнения.

```
test_db=# select count(*) from clients;
 count 
-------
     5
(1 row)
```


```
test_db=# select count(*) from orders;
 count 
-------
     5
(1 row)

```
## Задача 4

Часть пользователей из таблицы clients решили оформить заказы из таблицы orders.

Используя foreign keys свяжите записи из таблиц, согласно таблице:

|ФИО|Заказ|
|------------|----|
|Иванов Иван Иванович| Книга |
|Петров Петр Петрович| Монитор |
|Иоганн Себастьян Бах| Гитара |

Приведите SQL-запросы для выполнения данных операций.
```
test_db=# update  clients set Заказ = 3 where id = 1;
UPDATE 1
test_db=# update  clients set Заказ = 4 where id = 2;
UPDATE 1
test_db=# update  clients set Заказ = 5 where id = 3;
UPDATE 1
test_db=# 
```


Приведите SQL-запрос для выдачи всех пользователей, которые совершили заказ, а также вывод данного запроса.
```
test_db=# select c.Фамилия, o.Наименование from clients c, orders o where c.Заказ = o.id;
       Фамилия        | Наименование 
----------------------+--------------
 Иванов Иван Иванович | Книга
 Петров Петр Петрович | Монитор
 Иоганн Себастьян Бах | Гитара
(3 rows)
```

 
Подсказк - используйте директиву `UPDATE`.

## Задача 5

Получите полную информацию по выполнению запроса выдачи всех пользователей из задачи 4 
(используя директиву EXPLAIN).



Приведите получившийся результат и объясните что значат полученные значения.
```
test_db=# explain select c.Фамилия, o.Наименование from clients c, orders o where c.Заказ = o.id;
                               QUERY PLAN                                
-------------------------------------------------------------------------
 Hash Join  (cost=37.00..57.24 rows=810 width=64)
   Hash Cond: (c."Заказ" = o.id)
   ->  Seq Scan on clients c  (cost=0.00..18.10 rows=810 width=36)
   ->  Hash  (cost=22.00..22.00 rows=1200 width=36)
         ->  Seq Scan on orders o  (cost=0.00..22.00 rows=1200 width=36)
(5 rows)

```
Описание затрат на на операцию  и на каждый шаг операции

## Задача 6

Создайте бэкап БД test_db и поместите его в volume, предназначенный для бэкапов (см. Задачу 1).
```
khrom@ubuntu:~$ docker exec -t post pg_dump -U postgres test_db -f /var/lib/postgresql/data1/backup_post.sql
```

Остановите контейнер с PostgreSQL (но не удаляйте volumes).
```
khrom@ubuntu:~$ docker stop post
post
```

Поднимите новый пустой контейнер с PostgreSQL.

Восстановите БД test_db в новом контейнере.

Приведите список операций, который вы применяли для бэкапа данных и восстановления. 
```
hrom@ubuntu:~$ psql -h 127.0.0.1 -U postgres -d postgres
Password for user postgres: 
psql (12.9 (Ubuntu 12.9-0ubuntu0.20.04.1), server 12.10 (Debian 12.10-1.pgdg110+1))
Type "help" for help.

postgres=# CREATE DATABASE test_db;
CREATE DATABASE
postgres=# \q
khrom@ubuntu:~$ docker exec -i post-2 psql -U postgres -d test_db -f /var/lib/postgresql/data1/backup_post.sql
SET
SET
SET
SET
SET
 set_config 
------------
 
(1 row)

SET
SET
SET
SET
SET
SET
CREATE TABLE
ALTER TABLE
CREATE TABLE
ALTER TABLE
COPY 5
COPY 5
ALTER TABLE
ALTER TABLE
khrom@ubuntu:~$ 
```


---

### Как cдавать задание

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
