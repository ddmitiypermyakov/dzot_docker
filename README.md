Docker. Домашнее задание

1.	Создайте свой кастомный образ nginx на базе alpine. После запуска nginx должен отдавать кастомную страницу (достаточно изменить дефолтную страницу nginx)
2.	Определите разницу между контейнером и образом
3.	Вывод опишите в домашнем задании.
4.	Ответьте на вопрос: Можно ли в контейнере собрать ядро?

1. Образ - docker pull dmitrypermyakov/my_nginx:myname
2. Контейнер Docker – это автономное запускаемое программное приложение или сервис. Образ Docker – это шаблон, загруженный в контейнер для его запуска, например набор инструкций.
3. ![image](https://github.com/user-attachments/assets/23565b8b-5443-4a9c-ac82-c2002e73f61e)

   ![image](https://github.com/user-attachments/assets/1ff6638f-b834-49a7-a7f6-02b159ca6e75)

   


5. Можно собрать ядро 
# Указываем базовый образ
FROM ubuntu:latest

# Устанавливаем необходимые пакеты и зависимости для сборки ядра
RUN apt-get update && apt-get install -y build-essential libncurses-dev bison flex libssl-dev libelf-dev

# Копируем исходный код ядра в контейнер
COPY linux-source.tar.gz /usr/src/

# Распаковываем исходный код ядра
RUN tar -xvf /usr/src/linux-source.tar.gz -C /usr/src/

# Переходим в директорию с исходным кодом ядра
WORKDIR /usr/src/linux-source

# Конфигурируем ядро
RUN make menuconfig

# Собираем ядро
RUN make -j$(nproc)

# Устанавливаем собранное ядро
RUN make install

# Запускаем ядро при старте контейнера
CMD ["make", "run"]

# Сборка образа: 
docker build -t my-kernel .
# Запустить контейнер: 
docker run -it my-kernel

