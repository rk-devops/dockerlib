FROM centos
MAINTAINER rkbsme@gmail.com
#source from https://github.com/CentOS/CentOS-Dockerfiles/tree/master/httpd/centos7

RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd; yum clean all
ADD ./start-ssh.sh /start-ssh.sh
RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

RUN chmod 755 /start-ssh.sh
EXPOSE 22
RUN ./start-ssh.sh
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
