FROM jakzal/phpqa:alpine

RUN apk add --no-cache libxml2-dev libpng-dev \
 && docker-php-ext-install soap gd

RUN set -ex \
 && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS imagemagick-dev libtool \
 && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
 && pecl install imagick-3.4.3 \
 && docker-php-ext-enable imagick \
 && apk add --no-cache --virtual .imagick-runtime-deps imagemagick \
 && apk del .phpize-deps
