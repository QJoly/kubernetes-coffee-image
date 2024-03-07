# Specify the base image
FROM php:7.4-apache

# Set the working directory
WORKDIR /var/www/html

# Copy the application files to the container
COPY ./src .

# Install any necessary dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libpq-dev \
    && docker-php-ext-install -j$(nproc) \
    gd \
    mysqli \
    pdo_mysql \
    pdo_pgsql

# Set up Apache configuration
RUN a2enmod rewrite

# Expose the port
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]
