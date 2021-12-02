# Домашнее задание к занятию "3.2. Работа в терминале, лекция 2"

# Задание 1

Какого типа команда cd? Попробуйте объяснить, почему она именно такого типа; опишите ход своих мыслей, если считаете что она могла бы быть другого типа. типа команда cd

Ответ:

cd-встроенная команда .
Без этой команды невозможно работать.
Зачем создавать лишние внешние модули и лишние связи необходимый минимум должен быть в ядре

## Задание 2
Какая альтернатива без pipe команде grep <some_string> <some_file> | wc -l? man grep поможет в ответе на этот вопрос. Ознакомьтесь с документом о других подобных некорректных вариантах использования pipe.

Ответ:

khrom@srv-1:~/Netology/test$ nano test.txt

khrom@srv-1:~/Netology/test$ grep 123 test.txt -c

1

khrom@srv-1:~/Netology/test$ grep 1243 test.txt -c

0

khrom@srv-1:~/Netology/test$ grep 123 test.txt |wc -l

1

khrom@srv-1:~/Netology/test$ grep 1243 test.txt |wc -l

0

khrom@srv-1:~/Netology/test$

## Задание 3

Какой процесс с PID 1 является родителем для всех процессов в вашей виртуальной машине Ubuntu 20.04?

Ответ:

Процесс с PID 1 - systemd
vagrant@vagrant:~$ pstree -p
systemd(1)─┬─VBoxService(798)─┬─{VBoxService}(800)

## Задание 4

Как будет выглядеть команда, которая перенаправит вывод stderr ls на другую сессию терминала?

из pts/0

ls -a test 2>/dev/pts/1

в pts/1

ls: cannot access 'test': No such file or directory

## Задание 5

Получится ли одновременно передать команде файл на stdin и вывести ее stdout в другой файл? Приведите работающий пример.


vagrant@vagrant:~/test1$  cat <test1.txt >test2.txt
vagrant@vagrant:~/test1$ cat test2.txt
test12123

## Задание 6

Получится ли вывести находясь в графическом режиме данные из PTY в какой-либо из эмуляторов TTY? Сможете ли вы наблюдать выводимые данные?

Отправить можно но ничего не увидешь

khrom@srv-1:~$ echo Hello >/dev/tty2

