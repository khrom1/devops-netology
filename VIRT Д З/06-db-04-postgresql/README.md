# Домашнее задание к занятию "6.4. PostgreSQL"

## Задача 1

Используя docker поднимите инстанс PostgreSQL (версию 13). Данные БД сохраните в volume.

Подключитесь к БД PostgreSQL используя `psql`.

Воспользуйтесь командой `\?` для вывода подсказки по имеющимся в `psql` управляющим командам.

```
khrom@ubuntu:~$ docker pull postgres:13
13: Pulling from library/postgres
ae13dd578326: Pull complete 



khrom@ubuntu:~$ docker volume create vol-post
vol-post



khrom@ubuntu:~$ docker run --rm --name post-doc -e POSTGRES_PASSWORD=123456 -ti -p 5432:5432 -v post-vol:/var/lib/postgresql/data postgres:13

khrom@ubuntu:~$ docker exec -it post-doc bash


root@1c38503bfa08:/#  psql -h 127.0.0.1 -p 5432 -U postgres -W


root@1c38503bfa08:/#  psql -h localhost -p 5432 -U postgres -W
Password: 
psql (13.6 (Debian 13.6-1.pgdg110+1))
Type "help" for help.

postgres=# 

```

**Найдите и приведите** управляющие команды для:
- вывода списка БД  `\l`

```
postgres=# \l
                                 List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
   
-----------+----------+----------+------------+------------+--------------------
---
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres        
  +
           |          |          |            |            | postgres=CTc/postgr
es
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres        
  +
           |          |          |            |            | postgres=CTc/postgr
es
(3 rows)
```
- подключения к БД  `\connect`

```
template1-# \connect postgres
Password: 
You are now connected to database "postgres" as user "postgres".


```

- вывода списка таблиц  `\dt`

```
test_database=# \dt
         List of relations
 Schema |  Name  | Type  |  Owner   
--------+--------+-------+----------
 public | orders | table | postgres

```

- вывода описания содержимого таблиц  `\d+`

```
test_database=# \d+ orders 
                                                       Table "public.orders"
 Column |         Type          | Collation | Nullable |              Default               | St
orage  | Stats target | Description 
--------+-----------------------+-----------+----------+------------------------------------+---
-------+--------------+-------------
 id     | integer               |           | not null | nextval('orders_id_seq'::regclass) | pl
ain    |              | 
 title  | character varying(80) |           | not null |                                    | ex
tended |              | 
 price  | integer               |           |          | 0                                  | pl
ain    |              | 
Indexes:
    "orders_pkey" PRIMARY KEY, btree (id)
Access method: heap

```
- выхода из psql  `\q`

```
postgres-# \q
root@1c38503bfa08:/# 
```

## Задача 2

Используя `psql` создайте БД `test_database`.

Изучите [бэкап БД](https://github.com/netology-code/virt-homeworks/tree/master/06-db-04-postgresql/test_data).

Восстановите бэкап БД в `test_database`.

Перейдите в управляющую консоль `psql` внутри контейнера.

Подключитесь к восстановленной БД и проведите операцию ANALYZE для сбора статистики по таблице.

Используя таблицу [pg_stats](https://postgrespro.ru/docs/postgresql/12/view-pg-stats), найдите столбец таблицы `orders` 
с наибольшим средним значением размера элементов в байтах.

**Приведите в ответе** команду, которую вы использовали для вычисления и полученный результат.

```
root@1c38503bfa08:/# psql -h localhost -p 5432 -U postgres -W
Password: 

postgres=# CREATE DATABASE test_database;
CREATE DATABASE


root@1c38503bfa08:~# psql -U postgres -f /var/lib/postgresql/data/test_dump.sql test_database
SET
SET
SET
SET
SET
 set_config 
------------
 
root@1c38503bfa08:~#  psql -h localhost -p 5432 -U postgres -W
Password: 


postgres=# \c test_database
Password: 
You are now connected to database "test_database" as user "postgres".
test_database=# 


test_database=# ANALYZE VERBOSE public.orders;
INFO:  analyzing "public.orders"
INFO:  "orders": scanned 1 of 1 pages, containing 8 live rows and 0 dead rows; 8 rows in sample, 8 estimated total rows
ANALYZE



test_database=# select avg_width from pg_stats where tablename='orders';
 avg_width 
-----------
         4
        16
         4
(3 rows)



```
## Задача 3

Архитектор и администратор БД выяснили, что ваша таблица orders разрослась до невиданных размеров и
поиск по ней занимает долгое время. Вам, как успешному выпускнику курсов DevOps в нетологии предложили
провести разбиение таблицы на 2 (шардировать на orders_1 - price>499 и orders_2 - price<=499).

Предложите SQL-транзакцию для проведения данной операции.

Можно ли было изначально исключить "ручное" разбиение при проектировании таблицы orders?

```
test_database=# ALTER TABLE orders RENAME to orders_old;
ALTER TABLE
test_database=# CREATE TABLE orders (id integer, title varchar(80), price integer) PARTITION BY RANGE (price);
CREATE TABLE
test_database=# CREATE TABLE orders_1 PARTITION OF orders FOR VALUES FROM (500) TO (MAXVALUE);
CREATE TABLE
test_database=# CREATE TABLE orders_2 PARTITION OF orders FOR VALUES FROM (0) TO (500);
CREATE TABLE
test_database=# INSERT INTO orders (id, title, price) SELECT * FROM orders_old;
INSERT 0 8
test_database=# SELECT * FROM orders_2;
 id |        title         | price 
----+----------------------+-------
  1 | War and peace        |   100
  3 | Adventure psql time  |   300
  4 | Server gravity falls |   300
  5 | Log gossips          |   123
  7 | Me and my bash-pet   |   499
(5 rows)

test_database=# SELECT * FROM orders_1;
 id |       title        | price 
----+--------------------+-------
  2 | My little database |   500
  6 | WAL never lies     |   900
  8 | Dbiezdmin          |   501
(3 rows)

test_database=# 


```
 Изначальное разбиение таблицы на несколько меньших физических секций решило бы проблему. Такое разбиение называется секционированием. 

## Задача 4

Используя утилиту `pg_dump` создайте бекап БД `test_database`.


```
root@1c38503bfa08:/# pg_dump -U postgres > /var/lib/postgresql/data/test_dump_v2.sql
root@1c38503bfa08:/# cd /var/lib/postgresql/data/
root@1c38503bfa08:/var/lib/postgresql/data# ls
base	       pg_multixact  pg_subtrans	   postgresql.conf
global	       pg_notify     pg_tblspc		   postmaster.opts
pg_commit_ts   pg_replslot   pg_twophase	   postmaster.pid
pg_dynshmem    pg_serial     PG_VERSION		   test_dump.sql
pg_hba.conf    pg_snapshots  pg_wal		   test_dump_v2.sql
pg_ident.conf  pg_stat	     pg_xact
pg_logical     pg_stat_tmp   postgresql.auto.conf
root@1c38503bfa08:/var/lib/postgresql/data# 


```

Как бы вы доработали бэкап-файл, чтобы добавить уникальность значения столбца `title` для таблиц `test_database`?

```

CREATE TABLE public.orders (
    id integer,
    title character varying(80),
    price integer,
    UNIQUE(title)
);

```




---

### Как cдавать задание

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
