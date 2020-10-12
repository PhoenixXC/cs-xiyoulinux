FROM bitnami/php-fpm:5.6-debian-9-prod

LABEL name="cs"
LABEL version="1"

COPY docker/docker-entrypoint.sh \
    docker/cs.conf \
    source \
    /app/

WORKDIR /app

RUN printf '\
    deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib \n\
    deb http://mirrors.aliyun.com/debian-security stretch/updates main \n\
    deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib \n\
    deb http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib \n\n\
    ' > /etc/apt/sources.list \
    && apt-get update --assume-yes && apt-get install -y nginx zip wget && apt-get clean && rm -rf /tmp/* \
    && smarty_ver='3.1.35' \
    && wget -qO /root/smarty.zip https://archive.fastgit.org/smarty-php/smarty/archive/v${smarty_ver}.zip \
    && unzip -q -d /root/ /root/smarty.zip \
    && mkdir -p /usr/local/lib/php/smarty && mv /root/smarty-${smarty_ver}/libs/* /usr/local/lib/php/smarty/ \
    && rm -rf /root/smarty* \
    && chmod +x /app/*.sh \
    && mv /app/cs.conf /etc/nginx/sites-enabled/default

EXPOSE 80

ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
CMD [ "php-fpm", "-F", "--pid", "/opt/bitnami/php/tmp/php-fpm.pid", "-y", "/opt/bitnami/php/etc/php-fpm.conf"]