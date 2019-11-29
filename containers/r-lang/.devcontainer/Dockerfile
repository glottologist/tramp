FROM <domain>/development-ubuntu:<version>
ADD README.md .
ENV DEBIAN_FRONTEND noninteractive
RUN apt install -y apt-transport-https software-properties-common && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' && \
    apt update -y

RUN apt-get install -y r-base
# RUN echo $(R)
