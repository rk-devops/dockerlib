FROM centos
MAINTAINER rkbsme@gmail.com
#Source from https://github.com/CentOS/CentOS-Dockerfiles/blob/master/httpd/centos7/Dockerfile

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
