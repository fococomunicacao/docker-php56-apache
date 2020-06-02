FROM php:5.6-apache

COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

# Algumas extensoes não são providas pelo fonte do PHP,
# mas estão disponíveis via PECL (https://pecl.php.net/)
RUN BEFORE_PWD=$(pwd) \
    apt-get update && apt install -y \
        libicu-dev \
        libzip-dev \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install mysql intl zip \
    && mkdir -p /opt/xdebug \
        && cd /opt/xdebug \
        && curl -k -L https://github.com/xdebug/xdebug/archive/XDEBUG_2_5_5.tar.gz | tar zx \
        && cd xdebug-XDEBUG_2_5_5 \
        && phpize \
        && ./configure --enable-xdebug \
        && make clean \
        && sed -i 's/-O2/-O0/g' Makefile \
        && make \
        && make install \
        && cd "${BEFORE_PWD}" \
        && rm -r /opt/xdebug \
    && docker-php-ext-enable xdebug \
    && echo "\n\
        zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so) \n\
        xdebug.remote_log = /var/www/html/xdebug.log \n\
        xdebug.remote_enable=on \n\
        xdebug.remote_handler=dbgp \n\
        xdebug.remote_port=9000 \n\
        xdebug.remote_autostart=on \n\
        xdebug.remote_connect_back=on \n\
        xdebug.idekey=docker \n\
        xdebug.remote_log=/var/www/html/xdebug.log \n\
        xdebug.default_enable=on \n\
    " >> /usr/local/etc/php/conf.d/xdebug.ini

RUN a2enmod rewrite && service apache2 restart
