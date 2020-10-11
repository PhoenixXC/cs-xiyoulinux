FROM bitnami/php-fpm:7.4.11-prod

LABEL name="cs"
LABEL version="1"

COPY docker-entrypoint.sh \
    cs.conf \
    /app/

RUN printf '\
    deb http://mirrors.aliyun.com/debian/ buster main non-free contrib \n\
    deb http://mirrors.aliyun.com/debian-security buster/updates main \n\
    deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib \n\
    deb http://mirrors.aliyun.com/debian/ buster-backports main non-free contrib \n\n\
    ' > /etc/apt/sources.list \
    && apt-get update --assume-yes && apt-get install -y nginx zip git && apt-get clean && rm -rf \
    && git config --global url."https://github.com.cnpmjs.org/".insteadOf https://github.com/ \
    && git clone https://github.com/xiyou-linuxer/cs-xiyoulinux.git /tmp/cs-xiyoulinux && cp -r /tmp/cs-xiyoulinux/source/* /app \
    && smarty_ver='3.1.35' \
    && wget -qO /root/smarty.zip https://archive.fastgit.org/smarty-php/smarty/archive/v${smarty_ver}.zip \
    && unzip -q -d /root/ /root/smarty.zip \
    && mkdir -p /usr/local/lib/php/smarty && mv /root/smarty-${smarty_ver}/libs/* /usr/local/lib/php/smarty/ \
    && rm -rf /root/smarty* \
    && chmod +x /app/*.sh \
    && mv /app/cs.conf /etc/nginx/sites-enabled/default

EXPOSE 80

ENTRYPOINT ["bash","/app/docker-entrypoint.sh" ]
CMD ["php-fpm", "-F", "--pid", "/opt/bitnami/php/tmp/php-fpm.pid", "-y", "/opt/bitnami/php/etc/php-fpm.conf"]