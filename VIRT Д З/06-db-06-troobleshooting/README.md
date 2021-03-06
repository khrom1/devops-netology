# Домашнее задание к занятию "6.6. Troubleshooting"

## Задача 1

Перед выполнением задания ознакомьтесь с документацией по [администрированию MongoDB](https://docs.mongodb.com/manual/administration/).

Пользователь (разработчик) написал в канал поддержки, что у него уже 3 минуты происходит CRUD операция в MongoDB и её 
нужно прервать. 

Вы как инженер поддержки решили произвести данную операцию:
- напишите список операций, которые вы будете производить для остановки запроса пользователя
- предложите вариант решения проблемы с долгими (зависающими) запросами в MongoDB
- 
### Ответ:

Выведу список всех операций базы (xxx) свыше 180 сек
```
db.currentOp(
   {
     "active" : true,
     "secs_running" : { "$gt" : 180 },
     "ns" : /^xxx\./
   }
)
```
получу opid (к примеру "shardB:79014")

остановлю запрос 

```
db.killOp("shardB:79014");
 ```
Настройка шардинга и изменение количества индексов поможет минимизировать задержки БД также можно настроить параметр maxTimeMS автоматически удаляющий долгие процессы. 

## Задача 2

Перед выполнением задания познакомьтесь с документацией по [Redis latency troobleshooting](https://redis.io/topics/latency).

Вы запустили инстанс Redis для использования совместно с сервисом, который использует механизм TTL. 
Причем отношение количества записанных key-value значений к количеству истёкших значений есть величина постоянная и
увеличивается пропорционально количеству реплик сервиса. 

При масштабировании сервиса до N реплик вы увидели, что:
- сначала рост отношения записанных значений к истекшим
- Redis блокирует операции записи

Как вы думаете, в чем может быть проблема?

### Ответ:

Предполагаю недостаток оперативной памяти . Вариант решения проблемы  
1 В файле конфигурации Redis redis.conf есть атрибут "hz", который по умолчанию равен 10, что означает, что он будет удален 10 раз за 1 с, то есть будет выполняться каждые 100 мсек. Это значение конфигурации можно изменить
2 Ленивое удаление - это не активное удаление, но когда вы хотите получить ключ, redis сначала проверит, истек ли срок действия ключа, если он не истек, он вернется к вам, если он истек, тогда redis удалит ключ , Не вернусь к вам.
 
«Регулярное удаление + отложенное удаление» может гарантировать, что ключи с истекшим сроком действия будут в конечном итоге удалены

## Задача 3

Перед выполнением задания познакомьтесь с документацией по [Common Mysql errors](https://dev.mysql.com/doc/refman/8.0/en/common-errors.html).

Вы подняли базу данных MySQL для использования в гис-системе. При росте количества записей, в таблицах базы,
пользователи начали жаловаться на ошибки вида:
```python
InterfaceError: (InterfaceError) 2013: Lost connection to MySQL server during query u'SELECT..... '
```

Как вы думаете, почему это начало происходить и как локализовать проблему?

Какие пути решения данной проблемы вы можете предложить?

### Ответ:

Как вариант проблема может быть с длинными запросами 

Предлагаю увеличить

connect_timeout — количество секунд, в течение которых сервер mysql ожидает пакет подключения, прежде чем прервать соединение.

wait_timeout — Количество секунд, в течение которых сервер ждет активности в неинтерактивном соединении, прежде чем закрыть его.
В момент соединения значение wait_timeout берется из глобального значения wait_timeout или interactive_timeout в зависимости от типа клиента (как определено опцией CLIENT_INTERACTIVE connect для mysql_real_connect ())

net_read_timeout – Количество времени в секундах, на протяжении которого ожидаются дополнительные данные от соединения, пока не будет отменено чтение. 


Может быть подключается слишком большое количество пользователей тогда нужно увеличить

max_connections — максимальное количество параллельных соединений к серверу.

Так же можно увеличить 


max_allowed_packet — максимальный размер данных, которые могут быть переданы за один запрос. 
Следует увеличить значение при появлении ошибки «Packet too large», чтобы подключение не обрывалось.

## Задача 4

Перед выполнением задания ознакомтесь со статьей [Common PostgreSQL errors](https://www.percona.com/blog/2020/06/05/10-common-postgresql-errors/) из блога Percona.

Вы решили перевести гис-систему из задачи 3 на PostgreSQL, так как прочитали в документации, что эта СУБД работает с 
большим объемом данных лучше, чем MySQL.

После запуска пользователи начали жаловаться, что СУБД время от времени становится недоступной. В dmesg вы видите, что:

`postmaster invoked oom-killer`

Как вы думаете, что происходит?

Как бы вы решили данную проблему?

---

Проблема с недостатком ОЗУ 


Решение: сбалансировать работу текущей системы настройками СУБД если не удасться увеличить ОЗУ 
shared_buffers - Задаёт объём памяти, который будет использовать сервер баз данных для буферов в разделяемой памяти
Если вы используете выделенный сервер с объёмом ОЗУ 1 ГБ и более, разумным начальным значением shared_buffers будет 25% от объёма памяти.


work_mem -Специальная память, используется для сортировки и кэширования таблиц, для одного запроса.
При задании этого параметра следует учитывать количество конкурентных запросов, выполняемых в один момент времени (для каждого запроса используется своя память размером до work_mem).
При памяти 1-4Gb рекомендуется устанавливать 32-128MB


maintenance_work_mem- Память использующаяся для операций VACUUM, CREATE INDEX, ALTER TABLE и FOREGIN KEY.
Следует устанавливать большее значение, чем для work_mem. Слишком большие значения приведут к использованию свопа.
При памяти 1-4Gb рекомендуется устанавливать 128-512MB

Также средствами ОС установить лимил ОЗУ для postgresql.service  
```

systemctl set-property postgresql.service MemoryLimit=


```




### Как cдавать задание

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

