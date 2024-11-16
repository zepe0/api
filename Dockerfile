# Utilizar la imagen base oficial de Ubuntu
FROM ubuntu:20.04

# Instalar Apache, PHP y MySQL
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    libapache2-mod-php \
    php-mysql \
    mysql-server \
    && apt-get clean

# Copiar la aplicación PHP al directorio de Apache
COPY . /var/www/html

# Configurar los permisos correctos
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Exponer el puerto de Apache
EXPOSE 80

# Comando para iniciar Apache y MySQL
CMD service mysql start && apachectl -D FOREGROUND
