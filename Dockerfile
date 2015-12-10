FROM centos:6

RUN yum clean all; yum -y install httpd; yum clean all; service httpd start;
EXPOSE 80