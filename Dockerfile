# Imagen base de PHP con Apache
FROM ubuntu:20.04

# Copia la aplicación PHP al directorio de Apache
COPY . /var/www/html

# Configura los permisos correctos
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Exponer el puerto de Apache
EXPOSE 80

# Habilitar módulos necesarios para MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql