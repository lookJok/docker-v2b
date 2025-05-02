# 使用 Alpine 基础镜像
FROM php:7.4-fpm-alpine

RUN echo "http://mirrors.aliyun.com/alpine/v3.15/main" > /etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/v3.15/community" >> /etc/apk/repositories
RUN apk update && apk add --no-cache \
    $PHPIZE_DEPS bash supervisor libzip-dev freetype-dev libjpeg-turbo-dev libpng-dev ttf-dejavu libwebp-dev redis tzdata\
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install pdo_mysql pcntl zip gd \
    # 清理构建依赖
    && rm -rf /var/cache/apk/*

WORKDIR /v2b
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

#CMD ["sh", "-c", "crond && redis-server --daemonize yes && php-fpm "]