FROM <domain>/development-centos:<version>
ENV PATH="${HOME}/.local/bin:$HOME/.cabal/bin:${PATH}"
ADD README.md .
ADD hello.idr .

# RUN yum install zlibc zlib1g-dev
# RUN yum -y install cabal-install
# RUN cabal update
RUN yum -y install gmp-devel
RUN yum -y  install idris

RUN idris hello.idr -o hello
