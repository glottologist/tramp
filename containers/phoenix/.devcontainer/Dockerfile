FROM <domain>/elixir:<version>

ENV NODE_VERSION="10.x"
ADD README.md .

# Install NodeJs
RUN echo "Installing nodejs, npm, cordova, ionic, react-native" \
    && curl -sL -k https://deb.nodesource.com/setup_${NODE_VERSION} \
        | bash -  && \
    apt-get install -qq nodejs  && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/ && \
    npm install --quiet -g npm 

# Install Phoenix
RUN mix archive.install hex phx_new --force
    
