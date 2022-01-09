# Курсовая работа по итогам модуля "DevOps и системное администрирование"

Курсовая работа необходима для проверки практических навыков, полученных в ходе прохождения курса "DevOps и системное администрирование".

Мы создадим и настроим виртуальное рабочее место. Позже вы сможете использовать эту систему для выполнения домашних заданий по курсу

## Задание

# Задание 1. Создайте виртуальную машину Linux.
 

### Ответ:

```bash
login as: khrom
khrom@192.168.99.40's password:
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.11.0-44-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

0 updates can be applied immediately.

Your Hardware Enablement Stack (HWE) is supported until April 2025.
Last login: Wed Jan  5 12:10:09 2022 from 192.168.99.30
khrom@ubuntu:~$



```
# Задание 2. Установите ufw и разрешите к этой машине сессии на порты 22 и 443, при этом трафик на интерфейсе localhost (lo) должен ходить свободно на все порты.
 

### Ответ:

По умолчанию пакет уже установлен запускаем 

```bash
root@ubuntu:/home/khrom# ufw enable
Command may disrupt existing ssh connections. Proceed with operation (y|n)? y
Firewall is active and enabled on system startup

```

Разрешаем 22 порт по имени службы и проверяем статус

```bash
root@ubuntu:/home/khrom# ufw allow ssh
root@ubuntu:/home/khrom#  ufw status
Status: active

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW       Anywhere
22/tcp (v6)                ALLOW       Anywhere (v6)



```
Разрешаем 443 порт по имени службы и проверяем статус


```bash
root@ubuntu:/home/khrom# sudo ufw allow https
Rule added
Rule added (v6)

root@ubuntu:/home/khrom# ufw status
Status: active

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW       Anywhere
443/tcp                    ALLOW       Anywhere
22/tcp (v6)                ALLOW       Anywhere (v6)
443/tcp (v6)               ALLOW       Anywhere (v6)


```
Добавляем правила для хождения трафика через интерфейс localhost

```bash
root@ubuntu:/home/khrom# sudo ufw allow in on lo0
Rule added
Rule added (v6)
root@ubuntu:/home/khrom# sudo ufw allow out on lo0
Rule added
Rule added (v6)
root@ubuntu:/home/khrom# ufw status
Status: active

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW       Anywhere
443/tcp                    ALLOW       Anywhere
Anywhere on lo0            ALLOW       Anywhere
22/tcp (v6)                ALLOW       Anywhere (v6)
443/tcp (v6)               ALLOW       Anywhere (v6)
Anywhere (v6) on lo0       ALLOW       Anywhere (v6)

Anywhere                   ALLOW OUT   Anywhere on lo0
Anywhere (v6)              ALLOW OUT   Anywhere (v6) on lo0



```


# Задание 3. Установите hashicorp vault ([инструкция по ссылке](https://learn.hashicorp.com/tutorials/vault/getting-started-install?in=vault/getting-started#install-vault)).
 

### Ответ:

```bash
root@ubuntu:/home/khrom# curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
OK
root@ubuntu:/home/khrom# apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
Get:1 https://apt.releases.hashicorp.com focal InRelease [9,495 B]
Hit:2 http://us.archive.ubuntu.com/ubuntu focal InRelease
Get:3 http://us.archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
Get:4 https://apt.releases.hashicorp.com focal/main amd64 Packages [41.2 kB]
Get:5 http://us.archive.ubuntu.com/ubuntu focal-backports InRelease [108 kB]
Get:6 http://us.archive.ubuntu.com/ubuntu focal-updates/main amd64 Packages [1,445 kB]
Get:7 http://us.archive.ubuntu.com/ubuntu focal-updates/main i386 Packages [581 kB]
Get:8 http://us.archive.ubuntu.com/ubuntu focal-updates/main Translation-en [289 kB]
Get:9 http://us.archive.ubuntu.com/ubuntu focal-updates/main amd64 c-n-f Metadata [14.7 kB]
Get:10 http://us.archive.ubuntu.com/ubuntu focal-updates/restricted amd64 Packages [663 kB]
Get:11 http://us.archive.ubuntu.com/ubuntu focal-updates/restricted Translation-en [94.6 kB]
Get:12 http://us.archive.ubuntu.com/ubuntu focal-updates/universe amd64 Packages [892 kB]
Get:13 http://us.archive.ubuntu.com/ubuntu focal-updates/universe i386 Packages [662 kB]
Get:14 http://us.archive.ubuntu.com/ubuntu focal-updates/universe Translation-en [195 kB]
Get:15 http://us.archive.ubuntu.com/ubuntu focal-updates/universe amd64 c-n-f Metadata [20.0 kB]
Get:16 http://us.archive.ubuntu.com/ubuntu focal-backports/universe amd64 Packages [19.2 kB]
Get:17 http://us.archive.ubuntu.com/ubuntu focal-backports/universe i386 Packages [10.9 kB]
Get:18 http://us.archive.ubuntu.com/ubuntu focal-backports/universe Translation-en [13.3 kB]
Get:19 http://us.archive.ubuntu.com/ubuntu focal-backports/universe amd64 c-n-f Metadata [656 B]
Err:20 http://security.ubuntu.com/ubuntu focal-security InRelease
  Temporary failure resolving 'security.ubuntu.com'
Fetched 5,172 kB in 15s (343 kB/s)
Reading package lists... Done
W: Failed to fetch http://security.ubuntu.com/ubuntu/dists/focal-security/InRelease  Temporary failure resolving 'security.ubuntu.com'
W: Some index files failed to download. They have been ignored, or old ones used instead.
root@ubuntu:/home/khrom#


```


Проверка обновлений и установка vault


```bash
root@ubuntu:/home/khrom# apt update && sudo apt install vault

```
Проверяем установку vault

```bash
root@ubuntu:/home/khrom# vault
Usage: vault <command> [args]

Common commands:
    read        Read data and retrieves secrets
    write       Write data, configuration, and secrets
    delete      Delete secrets and configuration
    list        List data or secrets
    login       Authenticate locally
    agent       Start a Vault agent
    server      Start a Vault server
    status      Print seal and HA status
    unwrap      Unwrap a wrapped secret

Other commands:
    audit          Interact with audit devices
    auth           Interact with auth methods
    debug          Runs the debug command
    kv             Interact with Vault's Key-Value storage
    lease          Interact with leases
    monitor        Stream log messages from a Vault server
    namespace      Interact with namespaces
    operator       Perform operator-specific tasks
    path-help      Retrieve API help for paths
    plugin         Interact with Vault plugins and catalog
    policy         Interact with policies
    print          Prints runtime configurations
    secrets        Interact with secrets engines
    ssh            Initiate an SSH session
    token          Interact with tokens

```

# Задание 4. Cоздайте центр сертификации по инструкции ([ссылка](https://learn.hashicorp.com/tutorials/vault/pki-engine?in=vault/secrets-management)) и выпустите сертификат для использования его в настройке веб-сервера nginx (срок жизни сертификата - месяц).
 

### Ответ:

Запуск сервера

```bash
khrom@ubuntu:~$ vault server -dev -dev-root-token-id root
==> Vault server configuration:

             Api Address: http://127.0.0.1:8200
                     Cgo: disabled
         Cluster Address: https://127.0.0.1:8201
              Go Version: go1.17.5
              Listener 1: tcp (addr: "127.0.0.1:8200", cluster address: "127.0.0.1:8201", max_request_duration: "1m30s", max_request_size: "33554432", tls: "disabled")
               Log Level: info
                   Mlock: supported: true, enabled: false
           Recovery Mode: false
                 Storage: inmem
                 Version: Vault v1.9.2
             Version Sha: f4c6d873e2767c0d6853b5d9ffc77b0d297bfbdf

```
 Экспорт переменных и выпуск корневого сертификата

```bash
khrom@ubuntu:~$ export VAULT_ADDR='http://127.0.0.1:8200'
khrom@ubuntu:~$ export VAULT_TOKEN=root
khrom@ubuntu:~$ vault secrets enable pki
Success! Enabled the pki secrets engine at: pki/
khrom@ubuntu:~$ vault secrets tune -max-lease-ttl=87600h pki
Success! Tuned the secrets engine at: pki/
khrom@ubuntu:~$ vault write -field=certificate pki/root/generate/internal \
>      common_name="example.com" \
>      ttl=87600h > CA_cert.crt
khrom@ubuntu:~$ vault write pki/config/urls \
>      issuing_certificates="$VAULT_ADDR/v1/pki/ca" \
>      crl_distribution_points="$VAULT_ADDR/v1/pki/crl"
Success! Data written to: pki/config/urls
khrom@ubuntu:~$

```

 Выпуск промежуточного сертификата

```bash
khrom@ubuntu:~$ vault secrets enable -path=pki_int pki
Success! Enabled the pki secrets engine at: pki_int/
khrom@ubuntu:~$ vault secrets tune -max-lease-ttl=43800h pki_int
Success! Tuned the secrets engine at: pki_int/
khrom@ubuntu:~$ vault write -format=json pki_int/intermediate/generate/internal \
>      common_name="example.com Intermediate Authority" \
>      | jq -r '.data.csr' > pki_intermediate.csr

Command 'jq' not found, but can be installed with:

sudo snap install jq  # version 1.5+dfsg-1, or
sudo apt  install jq  # version 1.6-1ubuntu0.20.04.1

See 'snap info jq' for additional versions.

khrom@ubuntu:~$ sudo apt  install jq

khrom@ubuntu:~$ vault write -format=json pki_int/intermediate/generate/internal \
>      common_name="example.com Intermediate Authority" \
>      | jq -r '.data.csr' > pki_intermediate.csr
khrom@ubuntu:~$ vault write -format=json pki/root/sign-intermediate csr=@pki_intermediate.csr \
>      format=pem_bundle ttl="43800h" \
>      | jq -r '.data.certificate' > intermediate.cert.pem
khrom@ubuntu:~$ vault write pki_int/intermediate/set-signed certificate=@intermediate.cert.pem
Success! Data written to: pki_int/intermediate/set-signed
khrom@ubuntu:~$


```
 Создание роли

```bash

khrom@ubuntu:~$ vault write pki_int/roles/example-dot-com \
>      allowed_domains="example.com" \
>      allow_subdomains=true \
>      max_ttl="720h"
Success! Data written to: pki_int/roles/example-dot-com
khrom@ubuntu:~$


```
Запрос сертификата на месяц

```bash


``````bash
khrom@ubuntu:~$ vault write pki_int/issue/example-dot-com common_name="test.example.com" ttl="720h"
Key                 Value
---                 -----
ca_chain            [-----BEGIN CERTIFICATE-----
MIIDpjCCAo6gAwIBAgIUH8J2p51WqS3q6HXievWHe2cKL8MwDQYJKoZIhvcNAQEL
BQAwFjEUMBIGA1UEAxMLZXhhbXBsZS5jb20wHhcNMjIwMTA5MTAyMjQ0WhcNMjcw
MTA4MTAyMzE0WjAtMSswKQYDVQQDEyJleGFtcGxlLmNvbSBJbnRlcm1lZGlhdGUg
QXV0aG9yaXR5MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzkS0t+Kb
O8DuKGUeXn8Pp0ylQJjjZHFJUNK8ylw4PMaZ8HeT5ImtZRdRO0vfaymDynD3QH9J
zJ21RGSVN2Dfyu+Q4p0ujV/vvizEXbkBBALeMGoO97klLlyw3ChHpaxYp/txiDmH
03vkg0k4twOmV7QLYHT3VKvwFI5WZqFbCdxAkc5GfGbA0ejZqpQm5ZIVfUDeOsLd
fgbQATHxhO/PmUPxCm+BwtmcsQ3HqEQeosZUy542wjwMNW6F7wTaS56/zoTMKDZC
6gxIQkOPrWg2Y60htxScVq5HaIo8xvnsc+d0kkb52g1Bj5nB5J5eXRVOmUlNxCp/
YsQJxn7wHV7hFwIDAQABo4HUMIHRMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8E
BTADAQH/MB0GA1UdDgQWBBRvu93MyEFNy04TOVj9qvlbGMIk5jAfBgNVHSMEGDAW
gBR4sIg1gfXsBHcgcoMTXDpPeIs2ojA7BggrBgEFBQcBAQQvMC0wKwYIKwYBBQUH
MAKGH2h0dHA6Ly8xMjcuMC4wLjE6ODIwMC92MS9wa2kvY2EwMQYDVR0fBCowKDAm
oCSgIoYgaHR0cDovLzEyNy4wLjAuMTo4MjAwL3YxL3BraS9jcmwwDQYJKoZIhvcN
AQELBQADggEBABn4cXi5hYVilvYkjMNFVSbbsVabAps8Eq9PirTiEuZbnm0v30Rv
c3VDMTLXTGYNDYOHvQb8giLF6pdnCkgqN9EebhHod+ZWqiyCC3l7RSe3eX9vi57D
f7PAFoYj4GbMhTgXzWb15BcWgc5EvTlzIiYaKGbKDxNtB2qFCIogpuE5UCF6rPQ8
CvC0TuNvywPdctkljAJO/hDPqJoq+DDw/aQwXHLzyQtNABvm2M5iOCcpxo/Li6FK
barmddM2Qkki/qoTuxsfSXLkm3PTKjMUVo/JYoFhhuLf5LwR4v85+SEL2aOX3vCT
ueza0fdfQzWGrumpoRh0//evegSCKIHr37E=
-----END CERTIFICATE-----]
certificate         -----BEGIN CERTIFICATE-----
MIIDZjCCAk6gAwIBAgIURaFFJdyMAC7JzHNtPDLHm9ft29swDQYJKoZIhvcNAQEL
BQAwLTErMCkGA1UEAxMiZXhhbXBsZS5jb20gSW50ZXJtZWRpYXRlIEF1dGhvcml0
eTAeFw0yMjAxMDkxMDI4MTBaFw0yMjAyMDgxMDI4NDBaMBsxGTAXBgNVBAMTEHRl
c3QuZXhhbXBsZS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC9
ZK+OFUIh0GukyXiH5Jqi6rhW5+Ah5w23Q5WuAvW2g4OYghO9bL336i6WwvznkoOL
KeI9k69NpyioNR0MFDrh05FTNLBBFM8Q6sN2/2uh+JofbizeXNdWQ/A8V/3b3cKn
b6zGSRzMNILe1k1Cs5PaK/9+eZxFJo4ithHRu9Qeor4MiJpCE/mV75lw+mTylUsh
Czu6+vSUkbLfpFwBIK/LHzgtxMoU/1fQ+W5BnEZ3341c/0Q97pXW9XWRpeSIfRfb
2cJgFuguHk5x8xStaNRRokftmJ16DL9nOSWJCjq5Y3v+AN/HMahkBC37vevCJyFT
iet0w9HUtI+2QI1l0Ao7AgMBAAGjgY8wgYwwDgYDVR0PAQH/BAQDAgOoMB0GA1Ud
JQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjAdBgNVHQ4EFgQUAOjWxyiZ9ntNMskU
GkSczjar4SAwHwYDVR0jBBgwFoAUb7vdzMhBTctOEzlY/ar5WxjCJOYwGwYDVR0R
BBQwEoIQdGVzdC5leGFtcGxlLmNvbTANBgkqhkiG9w0BAQsFAAOCAQEAZ5LFXEUH
r/aNBHA3OPGJMUBf4yemedXH7bNuXl30hDJlOx9EKV2x8VliKNqyaXjqNuku/Ctz
1x5x6z/D69GuQ6dLTDEXEfac1idMFqBF5QHzl+0vvU0VoBCK1wD+Pdx3/c+jvxYu
wlR81S+ViV2an6cZ/EF9RGYEWzk2bNcRtYlqSp6MtGo7mpbsRe+/Eb+T6MvzfNu9
oK4tUff0X1Qrp8rg5f/c8BFdSEaUSJChs4ncw+zjJZ5MiF9bBhS8C38Se9MYeF/g
1E2DZSKEEIxVJGg/r/t17wfAJEdmtcrdNlJtr8DndGCX6AUArrmpWAZNudmGnLKh
PtVD8SnoHWhGDA==
-----END CERTIFICATE-----
expiration          1644316120
issuing_ca          -----BEGIN CERTIFICATE-----
MIIDpjCCAo6gAwIBAgIUH8J2p51WqS3q6HXievWHe2cKL8MwDQYJKoZIhvcNAQEL
BQAwFjEUMBIGA1UEAxMLZXhhbXBsZS5jb20wHhcNMjIwMTA5MTAyMjQ0WhcNMjcw
MTA4MTAyMzE0WjAtMSswKQYDVQQDEyJleGFtcGxlLmNvbSBJbnRlcm1lZGlhdGUg
QXV0aG9yaXR5MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzkS0t+Kb
O8DuKGUeXn8Pp0ylQJjjZHFJUNK8ylw4PMaZ8HeT5ImtZRdRO0vfaymDynD3QH9J
zJ21RGSVN2Dfyu+Q4p0ujV/vvizEXbkBBALeMGoO97klLlyw3ChHpaxYp/txiDmH
03vkg0k4twOmV7QLYHT3VKvwFI5WZqFbCdxAkc5GfGbA0ejZqpQm5ZIVfUDeOsLd
fgbQATHxhO/PmUPxCm+BwtmcsQ3HqEQeosZUy542wjwMNW6F7wTaS56/zoTMKDZC
6gxIQkOPrWg2Y60htxScVq5HaIo8xvnsc+d0kkb52g1Bj5nB5J5eXRVOmUlNxCp/
YsQJxn7wHV7hFwIDAQABo4HUMIHRMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8E
BTADAQH/MB0GA1UdDgQWBBRvu93MyEFNy04TOVj9qvlbGMIk5jAfBgNVHSMEGDAW
gBR4sIg1gfXsBHcgcoMTXDpPeIs2ojA7BggrBgEFBQcBAQQvMC0wKwYIKwYBBQUH
MAKGH2h0dHA6Ly8xMjcuMC4wLjE6ODIwMC92MS9wa2kvY2EwMQYDVR0fBCowKDAm
oCSgIoYgaHR0cDovLzEyNy4wLjAuMTo4MjAwL3YxL3BraS9jcmwwDQYJKoZIhvcN
AQELBQADggEBABn4cXi5hYVilvYkjMNFVSbbsVabAps8Eq9PirTiEuZbnm0v30Rv
c3VDMTLXTGYNDYOHvQb8giLF6pdnCkgqN9EebhHod+ZWqiyCC3l7RSe3eX9vi57D
f7PAFoYj4GbMhTgXzWb15BcWgc5EvTlzIiYaKGbKDxNtB2qFCIogpuE5UCF6rPQ8
CvC0TuNvywPdctkljAJO/hDPqJoq+DDw/aQwXHLzyQtNABvm2M5iOCcpxo/Li6FK
barmddM2Qkki/qoTuxsfSXLkm3PTKjMUVo/JYoFhhuLf5LwR4v85+SEL2aOX3vCT
ueza0fdfQzWGrumpoRh0//evegSCKIHr37E=
-----END CERTIFICATE-----
private_key         -----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAvWSvjhVCIdBrpMl4h+Saouq4VufgIecNt0OVrgL1toODmIIT
vWy99+oulsL855KDiyniPZOvTacoqDUdDBQ64dORUzSwQRTPEOrDdv9rofiaH24s
3lzXVkPwPFf9293Cp2+sxkkczDSC3tZNQrOT2iv/fnmcRSaOIrYR0bvUHqK+DIia
QhP5le+ZcPpk8pVLIQs7uvr0lJGy36RcASCvyx84LcTKFP9X0PluQZxGd9+NXP9E
Pe6V1vV1kaXkiH0X29nCYBboLh5OcfMUrWjUUaJH7Zidegy/ZzkliQo6uWN7/gDf
xzGoZAQt+73rwichU4nrdMPR1LSPtkCNZdAKOwIDAQABAoIBAHF+abmCQbwTsr3w
QbtlockpUUg68dQ/Krf81zCM84Po8a4tnPixtnFfM4YC2R1Ibm2xrrLp0m59Ul7i
XULEyLhVWUv8UfbeKmvf0zx3OZ+5Y1qcYmTqS9yVH9x5elYMYT6HLIkyfQBeI2K4
F1p2VI60OQoohB3oSdrBMpJ1tVqZb7kfSP9JdWiHBkOjgdsl4DpLCOJICVp4de3b
zY03qmI6cFtlRm5aFK5axea4ZHmoNJTldpJgAXik+z+jZClfNd3mTPG7DTWDvdW6
FJFqs+XpqFxx0jQ70aMCK2gMc8yoIiNlUCVdCeUTqzK+lcBWp+CQvPmHwzERyGRj
4BjRUUkCgYEA+dSDcgTIl/cF4eOnEdF5+K16zlhQf5FQdYVUncPHVCzWJw6pVkL/
fH4dsxjgv0zc9ab4rsPk+HOMWgzQILEkKb00LuOeUVEUF8BbKWMoTdU506AYnRDi
OWdm41gjb5cJjcHMOi7SHLChmOvC3HJOShjuN28skaNY2viUsoDU7K0CgYEAwhIT
eJHCA1TE3pLmeDITeKy1vOVL7AsSWy+NU7VGRj6zHl49tUgAAaZCXN9pLB4eYRrp
biOG8kzcN8kUSqAOJg9/K5g2tR5V9L5HaFL8K6qlfdNXtpUMXqyqmp6EYOo6SOWt
LtSq+3jkIphoQQkKbORCsJ+8IKhTuXI0h/6Yh4cCgYBmYktELOWwMZH9kvhi+wAL
g7zyV4sV3I2mu++DgDpuKrnQ49dN/MMLV/v/69AfVfavza/Yn3t0vpXkSZ/55d62
JE4AcVPua1XargAuI+7ehuXd7pxnsgWkFNY7kWFkV/eYWrXBmnKNQ23WZ7hB865V
+4WUvkD7pn/BrWHzDY01OQKBgQCh2K9SSsRxQL2aHQqFTMW+StKZgORrKuSZFTQY
jkHYDSwV9GQkDbKrrXsEtvCf8VJGi0oHJyvAYGb7Qv9gKNED3sKgmaVuMKlgnVsx
3psc04iGQb2RsAWL4xW4MuCVbmFDL//Y4VTiuXQQgefX7PE71LTlVaFv3tFMA7lZ
fPK5ewKBgEX7HNKy4yaMM4jYXw9YvD8YM6Hrv4hoCRbVrpkjSFW9SxqX4TaBlg+8
qDlheCzvvqVHZ8bKMG6bKixDpGiUrE4wZuEx+WE48CstcZxB576yJO5u0AvqQfSA
Iq+xelSEstdRYj5pJ5nm48456aUZ/Ls8SqH6OIu2vL2yWan6H4G4
-----END RSA PRIVATE KEY-----
private_key_type    rsa
serial_number       45:a1:45:25:dc:8c:00:2e:c9:cc:73:6d:3c:32:c7:9b:d7:ed:db:db


``````bash


```

# Задание 5. Установите корневой сертификат созданного центра сертификации в доверенные в хостовой системе.
 

### Ответ:

```bash
khrom@srv-1:/usr/local/share/ca-certificates$ cd
khrom@srv-1:~$ cd /usr/local/share/ca-certificates
khrom@srv-1:/usr/local/share/ca-certificates$ sudo scp khrom@192.168.99.40:/home/khrom/CA_cert.crt .
khrom@srv-1:~$ sudo dpkg-reconfigure ca-certificates

```
# Задание 6. Установите nginx.
 

### Ответ:

```bash
khrom@srv-1:~$ sudo apt install nginx
Чтение списков пакетов… Готово
Построение дерева зависимостей

khrom@srv-1:~$ systemctl status nginx
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Sun 2022-01-09 15:17:32 MSK; 1min 39s ago
       Docs: man:nginx(8)
   Main PID: 9099 (nginx)
      Tasks: 9 (limit: 4298)
     Memory: 5.8M
     CGroup: /system.slice/nginx.service
             ├─9099 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
             ├─9100 nginx: worker process
             ├─9101 nginx: worker process
             ├─9102 nginx: worker process
             ├─9103 nginx: worker process
             ├─9104 nginx: worker process
             ├─9105 nginx: worker process
             ├─9106 nginx: worker process
             └─9107 nginx: worker process

```
# Задание 7. По инструкции ([ссылка](https://nginx.org/en/docs/http/configuring_https_servers.html)) настройте nginx на https, используя ранее подготовленный сертификат:
  - можно использовать стандартную стартовую страницу nginx для демонстрации работы сервера;
  - можно использовать и другой html файл, сделанный вами;


### Ответ:

```bash


```
# Задание 8. Откройте в браузере на хосте https адрес страницы, которую обслуживает сервер nginx.
 

### Ответ:

```bash


```
# Задание 9. Создайте скрипт, который будет генерировать новый сертификат в vault:
  - генерируем новый сертификат так, чтобы не переписывать конфиг nginx;
  - перезапускаем nginx для применения нового сертификата.
 

### Ответ:

```bash


```
# Задание 10. Поместите скрипт в crontab, чтобы сертификат обновлялся какого-то числа каждого месяца в удобное для вас время.
 

### Ответ:

```bash


```



