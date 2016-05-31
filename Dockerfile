FROM ubuntu:trusty
MAINTAINER Christopher Pax <christopher.pax@gmail.com>

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -y install vim supervisor git ssh

ADD run.sh /run.sh
RUN chmod 755 /*.sh
RUN mkdir /var/run/sshd
ADD supervisord-sshd.conf /etc/supervisor/conf.d/supervisord-sshd.conf


#  folder to attach to
VOLUME [  "/pclocal" ]

##  expose ssh port
EXPOSE 22


CMD ["/run.sh"]
