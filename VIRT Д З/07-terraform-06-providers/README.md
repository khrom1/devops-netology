# Домашнее задание к занятию "7.6. Написание собственных провайдеров для Terraform."

Бывает, что 
* общедоступная документация по терраформ ресурсам не всегда достоверна,
* в документации не хватает каких-нибудь правил валидации или неточно описаны параметры,
* понадобиться использовать провайдер без официальной документации,
* может возникнуть необходимость написать свой провайдер для системы используемой в ваших проектах.   

## Задача 1. 
Давайте потренируемся читать исходный код AWS провайдера, который можно склонировать от сюда: 
[https://github.com/hashicorp/terraform-provider-aws.git](https://github.com/hashicorp/terraform-provider-aws.git).
Просто найдите нужные ресурсы в исходном коде и ответы на вопросы станут понятны.  


1. Найдите, где перечислены все доступные 

`resource`
### Ответ:

- https://github.com/hashicorp/terraform-provider-aws/blob/c0584b28cc281774d9d4756c4d25b7a07391413b/internal/provider/provider.go#L913



2. `data_source`- 

### Ответ:

- https://github.com/hashicorp/terraform-provider-aws/blob/c0584b28cc281774d9d4756c4d25b7a07391413b/internal/provider/provider.go#L415

3. Для создания очереди сообщений SQS используется ресурс `aws_sqs_queue` у которого есть параметр `name`. 
   
   С каким другим параметром конфликтует `name`? Приложите строчку кода, в которой это указано.

### Ответ:
    

 https://github.com/hashicorp/terraform-provider-aws/blob/c0584b28cc281774d9d4756c4d25b7a07391413b/internal/service/sqs/queue.go#L87

4. Какая максимальная длина имени? 

### Ответ:

80 символов

https://github.com/hashicorp/terraform-provider-aws/blob/c0584b28cc281774d9d4756c4d25b7a07391413b/internal/service/sqs/queue.go#L427

5. Какому регулярному выражению должно подчиняться имя? 
  

### Ответ:

           (`^[a-zA-Z0-9_-]{1,80}$`)
           (`^[a-zA-Z0-9_-]{1,75}\.fifo$`)

    

