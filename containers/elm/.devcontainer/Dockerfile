FROM <domain>/nodejs:<version>
ADD README.md .
RUN whoami
RUN npm install -g --unsafe-perm=true --allow-root elm && \
    npm install -g --unsafe-perm=true --allow-root yo && \
    npm install -g --unsafe-perm=true --allow-root generator-elm-app && \
    npm install -g --unsafe-perm=true --allow-root elm-new && \
    npm install -g --unsafe-perm=true --allow-root elm-test && \
    echo $(elm --version)


