FROM debian:oldstable

RUN apt-get update -y &&\
    apt-get install -y php7.4 php-fpm php-mysql sendmail mariadb-client curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp &&\
    mkdir -p wordpress &&\
    mkdir -p /run/php

COPY ./tools/scriptat.sh /scriptat.sh

RUN chmod +x /scriptat.sh

CMD ["/scriptat.sh"]
