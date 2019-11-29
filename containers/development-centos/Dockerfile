FROM centos:centos7
ADD VERSION .

RUN  yum -y update
RUN  yum upgrade -y
RUN  yum clean all

RUN yum install -y dos2unix sudo zip unzip curl wget vim git gcc gnupg epel-release

RUN  yum -y update
RUN  yum upgrade -y

EXPOSE 22
