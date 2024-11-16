# Imagen base de PHP con Apache usando Alpine
FROM php:7.4-apache

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y --no-install-recommends \
    libmariadb-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Habilitar módulos necesarios para MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

# Copiar la aplicación PHP al directorio de Apache
COPY . /var/www/html

# Configurar los permisos correctos
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Exponer el puerto de Apache
EXPOSE 80

# Comando para iniciar Apache
CMD ["apache2-foreground"]
