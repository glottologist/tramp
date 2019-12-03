FROM ubuntu
ADD VERSION .

RUN  apt-get update \
     && apt-get install -y --no-install-recommends apt-utils \
     && apt-get upgrade -y \
     && apt-get dist-upgrade -y \
     && apt-get -y autoremove \
     && apt-get clean \
     && apt-get install -y dos2unix sudo zip unzip curl wget vim git gcc gnupg make 

EXPOSE 22
