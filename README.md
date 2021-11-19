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

 






