FROM jakzal/phpqa:alpine

RUN apk add --no-cache libxml2-dev \
 && docker-php-ext-install soap imagick gd
