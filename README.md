# devops-netology

Исключены будут все файлы и папки внутри /.terraform/
все файлы оканчивающиеся на .tfstate или содержащие .tfstate.
файл лога crash.log
все файлы оканчивающиеся на .tfvars
файлы override.tf override.tf.json а также оканчивающиеся на _override.tf и _override.tf.json
скрытый файл конфигурации .terraformrc а также файл terraform.rc

Новая сторока через PyCharm

Новая сторока через PyCharm
# Домашнее задание к занятию «2.4. Инструменты Git»
# Задание 1
Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea.

1 git clone https://github.com/hashicorp/terraform terraform_clone

2 git add terraform_clone/

3 git show aefea
 
Ответ: Полный хеш коммита aefea = aefead2207ef7e2aa5dc81a34aedf0cad4c32545
комментарий коммита Update CHANGELOG.md
# Задание 2
Какому тегу соответствует коммит 85024d3

1 git show 85024d3

 Ответ:Коммит 85024d3 соответствует тегу v0.12.23
 
# Задание 3 
Сколько родителей у коммита b8d720? Напишите их хеши.

1 git show b8d720^

2 git show b8d720^2

3 git show b8d720^3

Ответ: 
commit 56cd7859e05c36c06b56d013b55a252d0bb7e158

и 
        
commit 9ea88f22fc6269854151c571162c5bcf958bee2b

являются родителями у коммита b8d720

# Задание 4
Перечислите хеши и комментарии всех коммитов которые были сделаны между тегами v0.12.23 и v0.12.24

1  git log  --oneline  v0.12.24 -30

Ответ: 
33ff1c03b (tag: v0.12.24) v0.12.24

b14b74c49 [Website] vmc provider links

3f235065b Update CHANGELOG.md

6ae64e247 registry: Fix panic when server is unreachable

5c619ca1b website: Remove links to the getting started guide's old location

06275647e Update CHANGELOG.md

d5f9411f5 command: Fix bug when using terraform login on Windows

4b6d06cc5 Update CHANGELOG.md

dd01a3507 Update CHANGELOG.md

225466bc3 Cleanup after v0.12.23 release

85024d310 (tag: v0.12.23) v0.12.23

# Задание 5 

Найдите коммит в котором была создана функция func providerSource, ее определение в коде выглядит так func providerSource(...) (вместо троеточего перечислены аргументы).

1 git log -S"func providerSource" --oneline

2 git show 8c928e835

Ответ: функция func providerSource ,создана в коммите 8c928e835

# Задание 6

Найдите все коммиты в которых была изменена функция globalPluginDirs

1 git log -SglobalPluginDirs --oneline

2 git show 8364383c3

3 git show c0b176109

4 git show 35a058fb3

# Задание 7

Кто автор функции synchronizedWriters

1 git log -S'func synchronizedWriters'

Ответ:

Author: Martin Atkins <mart@degeneration.co.uk>
Date:   Wed May 3 16:25:41 2017 -0700

 
# Домашнее задание к занятию "3.1. Работа в терминале, лекция 1"
# Задание 1

Установите средство виртуализации Oracle VirtualBox.

Ответ:

sudo apt install virtualbox

# Задание 2

Установите средство автоматизации Hashicorp Vagrant.

Ответ:

sudo apt install vagrant

# Задание 3

В вашем основном окружении подготовьте удобный для дальнейшей работы терминал. 

Ответ:

Установлен PuTTY (64-bit) для доступа по ssh

# Задание 4

С помощью базового файла конфигурации запустите Ubuntu 20.04 в VirtualBox посредством Vagrant:

Ответ:

Установлена  виртуальная машина Ubuntu 20.04 
и выполненны её запуск ,выключение и отправка в сон

# Задание 5

Ознакомьтесь с графическим интерфейсом VirtualBox, посмотрите как выглядит виртуальная машина, которую создал для вас Vagrant, какие аппаратные ресурсы ей выделены. Какие ресурсы выделены по-умолчанию?

Ответ:

ОЗУ=1024 , CPU=1 , hdd=64 , video=8mb

# Задание 6

Ознакомьтесь с возможностями конфигурации VirtualBox через Vagrantfile: документация. Как добавить оперативной памяти или ресурсов процессора виртуальной машине?

Ответ:

добавить в Vagrantfile:

config.vm.provider "virtualbox" do |vb|
             vb.memory = 2048
             vb.cpus = 4
        end

# Задание 7

Команда vagrant ssh из директории, в которой содержится Vagrantfile, позволит вам оказаться внутри виртуальной машины без каких-либо дополнительных настроек.

Ответ:

vagrant@vagrant:~$

# Задание 8

Ознакомиться с разделами man bash, почитать о настройках самого bash:

8.1 

какой переменной можно задать длину журнала history, и на какой строчке manual это описывается?

Ответ:
 
  801        HISTFILESIZE
  802               The  maximum  number  of lines contained in the history file.

  815        HISTSIZE
  816               The  number  of  commands to remember in the command history (see HISTORY below)
  
8.2
что делает директива ignoreboth в bash?

792                 A value of ignoreboth is shorthand    
793               ignorespace and ignoredups. 

# Задание 9

Ответ:


В каких сценариях использования применимы скобки {} и на какой строчке man bash это описано?

 248        { list; }
    249               list  is  simply  executed in the current shell environment.  list must be terminated with a newline or semico

# Задание 10

 учётом ответа на предыдущий вопрос, как создать однократным вызовом touch 100000 файлов? Получится ли аналогичным образом создать 300000? Если нет, то почему?
 touch {000001..100000}.txt 300000 не создаст слижком много
 
# Задание 11
В man bash поищите по /\[\[. Что делает конструкция [[ -d /tmp ]]

проверяет -d /tmp и возвращает 0 или 1 ,наличие катаолга /tmp

# Задание 12

Основываясь на знаниях о просмотре текущих (например, PATH) и установке новых переменных; командах, которые мы рассматривали, добейтесь в выводе type -a bash в виртуальной машине наличия первым пунктом в списке:


vagrant@vagrant:~$ mkdir /tmp/new_path_dir/
vagrant@vagrant:~$ cp /bin/bash /tmp/new_path_dir/
vagrant@vagrant:~$ PATH=/tmp/new_path_dir/:$PATH
vagrant@vagrant:~$ type -a bash
bash is /tmp/new_path_dir/bash
bash is /tmp/test/bash
bash is /tmp/new_path_dir/bash
bash is /usr/bin/bash
bash is /bin/bash

# Задание 12

Чем отличается планирование команд с помощью batch и at

at-позволяет планировать выполнение команд в определенное время
batch-выполняет задачи во время периодов низкой загруженности системы; другими словами, когда средний уровень загрузки системы падает ниже значения 1.5 или того значения, которое задано при вызове atd.

# Задание 12

Завершите работу виртуальной машины чтобы не расходовать ресурсы компьютера и/или батарею ноутбука.

vagrant suspend



