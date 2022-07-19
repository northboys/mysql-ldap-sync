FROM ubuntu:20.04

LABEL description="Auto Sync LDAP mysql v0.1 (attribute mapping to mysql)"
LABEL version="0.1"

COPY script/syncher.sh ./

RUN apt-get update && apt-get install -y ldap-utils && apt-get install -y mysql-client && rm -rf /var/lib/apt


RUN chmod a+x syncher.sh

ENV LDAP_HOST ""
ENV LDAP_PORT ""
ENV LDAP_USER ""
ENV LDAP_PASS ""
ENV MYSQL_USER ""
ENV MYSQL_PASS ""
ENV MYSQL_HOST ""
ENV MYSQL_PORT ""

ENTRYPOINT [ "bash", "syncher.sh" ]
