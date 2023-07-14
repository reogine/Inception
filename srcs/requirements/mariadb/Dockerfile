FROM debian:oldstable

#install meriaDB
RUN apt update -y && apt install -y mariadb-server

#copy mariadb init script
COPY scriptat.sh scriptat.sh

RUN chmod +x scriptat.sh

CMD [ "/scriptat.sh" ]
