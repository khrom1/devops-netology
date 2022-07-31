# Домашнее задание к занятию "08.02 Работа с Playbook"

## Подготовка к выполнению
1. Создайте свой собственный (или используйте старый) публичный репозиторий на github с произвольным именем.
2. Скачайте [playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.
3. Подготовьте хосты в соотвтествии с группами из предподготовленного playbook. 
4. Скачайте дистрибутив [java](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html) и положите его в директорию `playbook/files/`. 

## Основная часть
1. Приготовьте свой собственный inventory файл `prod.yml`.
2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает kibana.
3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.
4. Tasks должны: скачать нужной версии дистрибутив, выполнить распаковку в выбранную директорию, сгенерировать конфигурацию с параметрами.
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

root@ubuntu:/home/khrom/ansible# ansible-playbook -i inventory/prod.yml site.yml --check


```
PLAY [Install Java] ***************************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************
ok: [localhost]
ok: [kibana]
ok: [elastic]

TASK [Set facts for Java 11 vars] *************************************************************************************************************************************************************
ok: [localhost]
ok: [elastic]
ok: [kibana]

TASK [Upload .tar.gz file containing binaries from local storage] *****************************************************************************************************************************
changed: [kibana]
changed: [elastic]
ok: [localhost]

TASK [Ensure installation dir exists] *********************************************************************************************************************************************************
ok: [localhost]
changed: [elastic]
changed: [kibana]

TASK [Extract java in the installation directory] *********************************************************************************************************************************************
skipping: [localhost]
fatal: [kibana]: FAILED! => {"changed": false, "msg": "dest '/opt/jdk/11.0.11' must be an existing dir"}
fatal: [elastic]: FAILED! => {"changed": false, "msg": "dest '/opt/jdk/11.0.11' must be an existing dir"}

TASK [Export environment variables] ***********************************************************************************************************************************************************
ok: [localhost]

PLAY [Install Elasticsearch] ******************************************************************************************************************************************************************

PLAY [Install kibana] *************************************************************************************************************************************************************************

PLAY RECAP ************************************************************************************************************************************************************************************
elastic                    : ok=4    changed=2    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0
kibana                     : ok=4    changed=2    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0
localhost                  : ok=5    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

```
7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

```

root@ubuntu:/home/khrom/ansible#  ansible-playbook -i inventory/prod.yml site.yml --diff
[WARNING]: Found both group and host with same name: kibana

PLAY [Install Java] ***************************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************
ok: [localhost]
ok: [elastic]
ok: [kibana]

TASK [Set facts for Java 11 vars] *************************************************************************************************************************************************************
ok: [localhost]
ok: [elastic]
ok: [kibana]

TASK [Upload .tar.gz file containing binaries from local storage] *****************************************************************************************************************************
ok: [localhost]
diff skipped: source file size is greater than 104448
changed: [kibana]
diff skipped: source file size is greater than 104448
changed: [elastic]

TASK [Ensure installation dir exists] *********************************************************************************************************************************************************
ok: [localhost]
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/opt/jdk/11.0.11",
-    "state": "absent"
+    "state": "directory"
 }

changed: [elastic]
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/opt/jdk/11.0.11",
-    "state": "absent"
+    "state": "directory"
 }

changed: [kibana]

TASK [Extract java in the installation directory] *********************************************************************************************************************************************
skipping: [localhost]
changed: [elastic]
changed: [kibana]

TASK [Export environment variables] ***********************************************************************************************************************************************************
ok: [localhost]
--- before
+++ after: /root/.ansible/tmp/ansible-local-61326bkgcm7xd/tmp0hlas8nw/jdk.sh.j2
@@ -0,0 +1,5 @@
+# Warning: This file is Ansible Managed, manual changes will be overwritten on next playbook run.
+#!/usr/bin/env bash
+
+export JAVA_HOME=/opt/jdk/11.0.11
+export PATH=$PATH:$JAVA_HOME/bin
\ No newline at end of file

changed: [elastic]
--- before
+++ after: /root/.ansible/tmp/ansible-local-61326bkgcm7xd/tmpwt83ueyt/jdk.sh.j2
@@ -0,0 +1,5 @@
+# Warning: This file is Ansible Managed, manual changes will be overwritten on next playbook run.
+#!/usr/bin/env bash
+
+export JAVA_HOME=/opt/jdk/11.0.11
+export PATH=$PATH:$JAVA_HOME/bin
\ No newline at end of file

changed: [kibana]

PLAY [Install Elasticsearch] ******************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************
ok: [elastic]

TASK [Upload tar.gz Elasticsearch from remote URL] ********************************************************************************************************************************************
changed: [elastic]

TASK [Create directrory for Elasticsearch] ****************************************************************************************************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/opt/elastic/7.10.1",
-    "state": "absent"
+    "state": "directory"
 }

changed: [elastic]

TASK [Extract Elasticsearch in the installation directory] ************************************************************************************************************************************
changed: [elastic]

TASK [Set environment Elastic] ****************************************************************************************************************************************************************
--- before
+++ after: /root/.ansible/tmp/ansible-local-61326bkgcm7xd/tmp266utihk/elk.sh.j2
@@ -0,0 +1,5 @@
+# Warning: This file is Ansible Managed, manual changes will be overwritten on next playbook run.
+#!/usr/bin/env bash
+
+export ES_HOME=/opt/elastic/7.10.1
+export PATH=$PATH:$ES_HOME/bin
\ No newline at end of file

changed: [elastic]

PLAY [Install kibana] *************************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************
ok: [kibana]

TASK [Upload tar.gz kibana from remote URL] ***************************************************************************************************************************************************
changed: [kibana]

TASK [Create directrory for kibana] ***********************************************************************************************************************************************************
--- before
+++ after
@@ -1,4 +1,4 @@
 {
     "path": "/opt/kibana/7.17.4",
-    "state": "absent"
+    "state": "directory"
 }

changed: [kibana]

TASK [Extract kibana in the installation directory] *******************************************************************************************************************************************
changed: [kibana]

TASK [Set environment kibana] *****************************************************************************************************************************************************************
--- before
+++ after: /root/.ansible/tmp/ansible-local-61326bkgcm7xd/tmpknmc3d3l/kib.sh.j2
@@ -0,0 +1,5 @@
+# Warning: This file is Ansible Managed, manual changes will be overwritten on next playbook run.
+#!/usr/bin/env bash
+
+export ES_HOME=/opt/kibana/7.17.4
+export PATH=$PATH:$KB_HOME/bin

changed: [kibana]

PLAY RECAP ************************************************************************************************************************************************************************************
elastic                    : ok=11   changed=8    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
kibana                     : ok=11   changed=8    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
localhost                  : ok=5    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

root@ubuntu:/home/khrom/ansible#

```

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

root@ubuntu:/home/khrom/ansible# ansible-playbook -i inventory/prod.yml site.yml --diff
```
PLAY [Install Java] ***************************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************
ok: [localhost]
ok: [kibana]
ok: [elastic]

TASK [Set facts for Java 11 vars] *************************************************************************************************************************************************************
ok: [localhost]
ok: [elastic]
ok: [kibana]

TASK [Upload .tar.gz file containing binaries from local storage] *****************************************************************************************************************************
ok: [localhost]
ok: [elastic]
ok: [kibana]

TASK [Ensure installation dir exists] *********************************************************************************************************************************************************
ok: [localhost]
ok: [elastic]
ok: [kibana]

TASK [Extract java in the installation directory] *********************************************************************************************************************************************
skipping: [localhost]
skipping: [kibana]
skipping: [elastic]

TASK [Export environment variables] ***********************************************************************************************************************************************************
ok: [localhost]
ok: [elastic]
ok: [kibana]

PLAY [Install Elasticsearch] ******************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************
ok: [elastic]

TASK [Upload tar.gz Elasticsearch from remote URL] ********************************************************************************************************************************************
ok: [elastic]

TASK [Create directrory for Elasticsearch] ****************************************************************************************************************************************************
ok: [elastic]

TASK [Extract Elasticsearch in the installation directory] ************************************************************************************************************************************
skipping: [elastic]

TASK [Set environment Elastic] ****************************************************************************************************************************************************************
ok: [elastic]

PLAY [Install kibana] *************************************************************************************************************************************************************************

TASK [Gathering Facts] ************************************************************************************************************************************************************************
ok: [kibana]

TASK [Upload tar.gz kibana from remote URL] ***************************************************************************************************************************************************
ok: [kibana]

TASK [Create directrory for kibana] ***********************************************************************************************************************************************************
ok: [kibana]

TASK [Extract kibana in the installation directory] *******************************************************************************************************************************************
skipping: [kibana]

TASK [Set environment kibana] *****************************************************************************************************************************************************************
ok: [kibana]

PLAY RECAP ************************************************************************************************************************************************************************************
elastic                    : ok=9    changed=0    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0
kibana                     : ok=9    changed=0    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0
localhost                  : ok=5    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

root@ubuntu:/home/khrom/ansible#
```

9. Подготовьте README.md файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
10. Готовый playbook выложите в свой репозиторий, в ответ предоставьте ссылку на него.

## Необязательная часть

1. Приготовьте дополнительный хост для установки logstash.
2. Пропишите данный хост в `prod.yml` в новую группу `logstash`.
3. Дополните playbook ещё одним play, который будет исполнять установку logstash только на выделенный для него хост.
4. Все переменные для нового play определите в отдельный файл `group_vars/logstash/vars.yml`.
5. Logstash конфиг должен конфигурироваться в части ссылки на elasticsearch (можно взять, например его IP из facts или определить через vars).
6. Дополните README.md, протестируйте playbook, выложите новую версию в github. В ответ предоставьте ссылку на репозиторий.

---

### Как оформить ДЗ?

Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.

---
