FROM <domain>/development-centos:<version>
ADD README.md .

# Install newer version of git than the package manager provides
RUN mkdir -p /usr/local/source \
    && cd /usr/local/source \
    && wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.9.5.tar.gz \
    && tar -xvf git-2.9.5.tar.gz \
    && cd git-2.9.5 \
    && ./configure \
    && make \
    && make install

# Install Python
RUN yum -y install python3 \
    && yum -y install python3-pip \
    && yum -y install procps lsb-release \
    && pip3 --disable-pip-version-check --no-cache-dir install pylint

# Install NodeJS for YAML language server
RUN  curl -sL https://rpm.nodesource.com/setup_10.x | bash - \
     && yum -y install gcc-c++ make \
     && curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo \
     && yum -y install yarn \
     && yum -y install nodejs \
     && npm install npm@latest -g

RUN mkdir -p /yaml-language-server \
    && cd yaml-language-server \ 
    && git clone https://github.com/redhat-developer/yaml-language-server.git \
    && cd yaml-language-server \ 
    && npm install \
    && npm audit fix \
    && npm run compile
   