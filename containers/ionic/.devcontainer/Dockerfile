FROM <domain>/android:<version>
ADD README.md .

ENV DEBIAN_FRONTEND=noninteractive

ENV NODE_VERSION="10.x" \
    IONIC_VERSION="5.2.3" 


# Installing packages
RUN echo "Installing nodejs, npm, cordova, ionic" \
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
    npm i -g --unsafe-perm ionic@${IONIC_VERSION} && \
    npm cache clean --force  && \
    rm -rf /tmp/* /var/tmp/* 

RUN ionic --no-interactive config set -g daemon.updates false

ENV DEBIAN_FRONTEND=dialog




