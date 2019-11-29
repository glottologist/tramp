FROM openjdk:8-jdk
ADD README.md .
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update
RUN apt-get -y install apt-transport-https ca-certificates
RUN if [ ! -d "/docker-java-home" ]; then ln -s "${JAVA_HOME}" /docker-java-home; fi
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list \
    && apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 \
    && apt-get -y update \
    && apt-get -y install sbt \
    && apt-get -y install jekyll 

# Set sensible sbt options (change if you need them to be something else)

RUN sed -i 's/#-Xmx1024m/-Xmx4096M/g' /etc/sbt/sbtconfig.txt \
    && sed -i 's/#-Xss4M/-XX:MaxPermSize=2048m/g' /etc/sbt/sbtconfig.txt \
    && sed -i 's/#-XX:ReservedCodeCacheSize=128m/-XX:ReservedCodeCacheSize=2G/g' /etc/sbt/sbtconfig.txt \
    && sed -i 's/#-mem   <integer>/-mem 4096/g' /etc/sbt/sbtopts

RUN sbt -version

ENV DEBIAN_FRONTEND=dialog
