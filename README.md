Задание 1
Повторить демонстрацию лекции(развернуть vpc, 2 веб сервера, бастион сервер)
  - Создала сервисный аккаунт в облаке. Выдала права editor

![Сервисный аккаунт](Screen/account.png)
>Сервисный аккаунт

  - Выпустила авторизованный ключ для этого аккаунта и скачала его по пути ~/.authorized_key.json .
  - Вписала в переменные cloud_id и folder_id в variables.tf
  - Изменила ssh-ключ в файле cloud-init.yml (ssh-keygen -t ed25519). cp terraformrc ~/.terraformrc
  - terraform init && terraform apply

![Запущенные ВМ](Screen/vm.png)
>Запущенные ВМ 

![Проверка связи между бастионом и ВМ](Screen/ping.png)
>Проверка связи между бастионом и ВМ
  
  - rm ~/.ssh/known_hosts. Выполнить playbook ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ./hosts.ini test.yml

![Запуск плейбука](Screen/test.png)
>Запуск плейбука

![Созданный файл на web-a](Screen/file.png)
>Созданный файл на web-a


Задание 2
С помощью ansible подключиться к web-a и web-b , установить на них nginx.(написать нужный ansible playbook)

![Плейбук](Screen/file2.png)
>Плейбук

![Запуск плейбука](Screen/playbook.png)
>Запуск плейбука

![Запущенный nginx на web-a](Screen/nginx_a.png)
>Запущенный nginx на web-a

![Запущенный nginx на web-b](Screen/nginx_b.png)
>Запущенный nginx на web-b

Задание 3*
Выполните действия, приложите скриншот скриптов, скриншот выполненного проекта.

Добавить еще одну виртуальную машину.

![Добавление ВМ в vms.tf](Screen/web-c.png)
>Добавление ВМ в vms.tf

![Запущенная машина web-c](Screen/4vm.png)
>Запущенная машина web-c

![Добавление в плейбук установку БД](Screen/playbook-new.png)
>Добавление в плейбук установку БД

Установить на нее любую базу данных.
Выполнить проверку состояния запущенных служб через Ansible.

![Запуск плейбука и статус БД](Screen/mysql.png)
>Запуск плейбука и статус БД


Задание 4*
Изучите инструкцию yandex для terraform. Добейтесь работы паплайна с безопасной передачей токена от облака в terraform через переменные окружения. Для этого:

Настройте профиль для yc tools по инструкции.
Удалите из кода строчку "token = var.yandex_cloud_token". Terraform будет считывать значение ENV переменной YC_TOKEN.
  - Так как этой строки и не было, я закоментировала строку `service_account_key_file = file(".authorized_key.json")`
  
Выполните команду export YC_TOKEN=$(yc iam create-token) и в том же shell запустите terraform.

![Токен](Screen/token.png)
>Сохраненный в переменную токен

![Добавление в bashrc](Screen/bashrc.png)
>Добавление в bashrc

![Работающий terraform](Screen/4.png)
>Работающий terraform