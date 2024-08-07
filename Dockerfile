# Используем базовый образ Alpine с установленным nginx
FROM nginx:alpine

RUN apt update -y && apt upgrade -y

# Копируем кастомную страницу в директорию по умолчанию для nginx
COPY custom.html /usr/share/nginx/html/index.html

# Открываем порт 80
EXPOSE 80

# Запускаем Nginx
CMD ["nginx"]
