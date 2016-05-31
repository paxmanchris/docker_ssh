FROM ubuntu:trusty
MAINTAINER Christopher Pax <christopher.pax@gmail.com>

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -y install vim supervisor git ssh

ADD run.sh /run.sh
RUN chmod 755 /*.sh

ADD supervisord-sshd.conf /etc/supervisor/conf.d/supervisord-sshd.conf


# use local file on host machine for www
VOLUME [ "/var/www/html", "/pclocal" ]

## expose web ports, and mailcatcher ports
EXPOSE 80 443 


CMD ["/run.sh"]
