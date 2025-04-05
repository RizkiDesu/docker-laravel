# ------------------------------------------ mysql ------------------------------------------------
FROM php:8.2-fpm-alpine
ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN addgroup -g 1000 website && adduser -G website -g website -s /bin/sh -D website

RUN mkdir -p /var/www/html

ADD ./src/ /var/www/html

# RUN chmod -R 777 /var/www/html/storage
# RUN chmod -R 777 /var/www/html/bootstrap/cache
# RUN chmod -R 777 /var/www/html/storage/logs

RUN docker-php-ext-install pdo pdo_mysql

RUN chown -R website:website /var/www/html





# # ------------------------------------------ posgree ------------------------------------------------
# # Use the official PHP 8.2 FPM Alpine image
# FROM php:8.2-fpm-alpine

# # Add custom PHP-FPM configuration
# ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf

# # Create a new group and user for website
# RUN addgroup -g 1000 website && adduser -G website -g website -s /bin/sh -D website

# # Create the application directory
# RUN mkdir -p /var/www/html

# # Add application code to the container
# ADD ./src/ /var/www/html

# # Uncomment these lines if you need to set specific permissions
# # RUN chmod -R 777 /var/www/html/storage
# # RUN chmod -R 777 /var/www/html/bootstrap/cache
# # RUN chmod -R 777 /var/www/html/storage/logs

# # Install the PostgreSQL PHP extension
# RUN apk add --no-cache postgresql-dev \
#     && docker-php-ext-install pdo pdo_pgsql

# # Change ownership of the application directory to the website user
# RUN chown -R website:website /var/www/html

# # Expose port 9000 and start php-fpm server
# EXPOSE 9000
# CMD ["php-fpm"]

