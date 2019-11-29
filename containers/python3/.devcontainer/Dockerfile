FROM <domain>/development-ubuntu:<version>
ADD README.md .
RUN apt -y install python3.6 && \
    apt -y install python3-pip && \
    apt -y install git procps lsb-release

RUN pip3 --disable-pip-version-check --no-cache-dir install pylint


 


