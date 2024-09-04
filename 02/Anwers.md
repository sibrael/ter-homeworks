**Задание 1**

В качестве ответа всегда полностью прикладывайте ваш terraform-код в git. Убедитесь что ваша версия Terraform ~>1.8.4

Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
Создайте сервисный аккаунт и ключ. service_account_key_file.
Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную vms_ssh_public_root_key.
Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.
Подключитесь к консоли ВМ через ssh и выполните команду  curl ifconfig.me. Примечание: К OS ubuntu "out of a box, те из коробки" необходимо подключаться под пользователем ubuntu: "ssh ubuntu@vm_ip_address". Предварительно убедитесь, что ваш ключ добавлен в ssh-агент: eval $(ssh-agent) && ssh-add Вы познакомитесь с тем как при создании ВМ создать своего пользователя в блоке metadata в следующей лекции.;
Ответьте, как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ.
В качестве решения приложите:

скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес;  
скриншот консоли, curl должен отобразить тот же внешний ip-адрес;  
ответы на вопросы.
 
![Image alt](https://github.com/sibrael/ter-homeworks/blob/c2865b9abd46aec18915ca616c23ab9f42bb1d56/02/Ter2_1.png)
![Image alt](https://github.com/sibrael/ter-homeworks/blob/c2865b9abd46aec18915ca616c23ab9f42bb1d56/02/Ter2_2.png)

preemptible = true - проставляет признак Прерываемой виртуальной машины. Такая машина в облаке дешевле, меньше расходует наши гранты.  

core_fraction=5 Гарантированная доля vCPU 5% для тех же целей. Экономия.


---

**Задание 2**

Замените все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. К названиям переменных ВМ добавьте в начало префикс vm_web_ . Пример: vm_web_name.
Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их default прежними значениями из main.tf.
Проверьте terraform plan. Изменений быть не должно.
 
![Image alt](https://github.com/sibrael/ter-homeworks/blob/f832cf9ed636cc819ae03d6ab9af26866889080b/02/Ter2_22.png)

---

**Задание 3**

Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: "netology-develop-platform-db" , cores  = 2, memory = 2, core_fraction = 20. Объявите её переменные с префиксом vm_db_ в том же файле ('vms_platform.tf'). ВМ должна работать в зоне "ru-central1-b"
Примените изменения.
 
![Image alt](https://github.com/sibrael/ter-homeworks/blob/be52cd11aa8a744904306e578244870b02584dd2/02/Ter2_3.png)
![Image alt](https://github.com/sibrael/ter-homeworks/blob/be52cd11aa8a744904306e578244870b02584dd2/02/Ter2_32.png)



---

**Задание 4**

Объявите в файле outputs.tf один output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.(без хардкода!!!)
Примените изменения.
В качестве решения приложите вывод значений ip-адресов команды terraform output.
 
![Image alt](https://github.com/sibrael/ter-homeworks/blob/2cb1d9656778e7a563f0e8557e57cf6bfd895dc8/02/Ter2_4.png)
![Image alt](https://github.com/sibrael/ter-homeworks/blob/2cb1d9656778e7a563f0e8557e57cf6bfd895dc8/02/Ter2_2.png)


---

**Задание 5**

В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
Примените изменения.
 
![Image alt](https://github.com/sibrael/ter-homeworks/blob/83e61dc221b307a19d5f98f645d9b9a1b1e91656/02/Ter2_5.png)

---

**Задание 6**

Вместо использования трёх переменных ".._cores",".._memory",".._core_fraction" в блоке resources {...}, объедините их в единую map-переменную vms_resources и внутри неё конфиги обеих ВМ в виде вложенного map(object).
Создайте и используйте отдельную map(object) переменную для блока metadata, она должна быть общая для всех ваших ВМ.
Найдите и закоментируйте все, более не используемые переменные проекта.
Проверьте terraform plan. Изменений быть не должно.
 
![Image alt](https://github.com/sibrael/ter-homeworks/blob/83e61dc221b307a19d5f98f645d9b9a1b1e91656/02/Ter2_3.png)


---
