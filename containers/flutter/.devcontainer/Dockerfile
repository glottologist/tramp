FROM <domain>/android:<version>
ADD README.md .

ENV DEBIAN_FRONTEND=noninteractive

ENV NODE_VERSION="10.x" \
    PATH="/opt/flutter/bin:/opt/flutter/bin/cache/dart-sdk/bin:/android-studio/bin:/android-sdk/tools/bin:$PATH"


# Installing packages
RUN echo "Installing nodejs, npm, cordova, ionic, react-native" \
    && curl -sL -k https://deb.nodesource.com/setup_${NODE_VERSION} \
        | bash -  && \
    apt-get install -qq nodejs  && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/ && \
    npm install --quiet -g npm  && \
    npm install --quiet -g \
        bower cordova eslint gulp yarn webpack parcel \
        jshint karma-cli mocha \
        node-gyp npm-check-updates && \
    npm cache clean --force  && \
    rm -rf /tmp/* /var/tmp/* 


# Install Android Studio
RUN wget https://dl.google.com/dl/android/studio/ide-zips/3.5.1.0/android-studio-ide-191.5900203-linux.tar.gz && \
    tar -xvf android-studio-ide-191.5900203-linux.tar.gz && \
    wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip && \
    mkdir android-sdk && \
    mv sdk-tools-linux-4333796.zip /android-sdk/ && \
    cd /android-sdk && \
    unzip sdk-tools-linux-4333796.zip

# Install Flutter sdk
RUN cd /opt && \
    wget --quiet https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_v1.5.4-hotfix.2-stable.tar.xz -O flutter.tar.xz && \
    tar xf flutter.tar.xz && \
    rm -f flutter.tar.xz && \
    flutter config --no-analytics

ENV DEBIAN_FRONTEND=dialog

RUN flutter precache
RUN flutter doctor



