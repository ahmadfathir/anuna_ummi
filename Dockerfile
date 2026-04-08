FROM nginx:alpine

#install package
RUN apk add --no-cache \
    bash \
    git \
    curl \
    unzip \
    zip \
    npm \
    supervisor \
    libzip-dev \
    oniguruma-dev \
    autoconf \
    gcc \
    g++ \
    make \
    openssl\
    php83 \
    php83-fpm \
    php83-pdo \
    php83-pdo_mysql \
    php83-mysqli \
    php83-opcache \
    php83-session \
    php83-ctype \
    php83-curl \
    php83-phar \
    php83-iconv \
    php83-mbstring \
    php83-tokenizer \
    php83-xml \
    php83-simplexml \
    php83-gd \
    php83-xmlwriter \
    php83-xmlreader \
    php83-fileinfo \
    php83-zip \
    php83-dom \
    php83-pecl-imagick \
    && ln -s /usr/bin/php83 /usr/bin/php


#COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

CMD ["/bin/sh", "-c", "php-fpm83 -D && nginx -g 'daemon off;'"]

#daftar php83-fpm ke user & grup nginx
RUN sed -i 's/^user = .*/user = nginx/' /etc/php83/php-fpm.d/www.conf && \
    sed -i 's/^group = .*/group = nginx/' /etc/php83/php-fpm.d/www.conf

RUN printf "upload_max_filesize = 10M\npost_max_size = 10M" > /etc/php83/php.ini    

EXPOSE 80