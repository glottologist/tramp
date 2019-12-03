FROM reactnativecommunity/react-native-android
ADD VERSION .

RUN  apt-get update \
     && apt-get install -y --no-install-recommends apt-utils \
     && apt-get upgrade -y \
     && apt-get dist-upgrade -y \
     && apt-get -y autoremove \
     && apt-get clean \
     && apt install -y libtool m4 automake autoconf libssl-dev pkg-config wget python-dev python3-dev


RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy

RUN npm install sharp --global --unsafe-perm && \
    npm install expo-cli --global --unsafe-perm && \
    npm install minizlib --global --unsafe-perm && \
    npm install fs-minipass --global --unsafe-perm 

RUN git clone https://github.com/facebook/watchman.git  -b v4.9.0 --depth 1 && \
    cd watchman && \
    ./autogen.sh  && \
    ./configure && \
    make && \
    make install

EXPOSE 3000
EXPOSE 19000-199