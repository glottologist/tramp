FROM node

ADD README.md .
RUN apt -y update
RUN apt-get -y install apt-transport-https ca-certificates
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt -y update && apt -y install yarn
RUN echo $(yarn --version)

RUN npm i -g vue \
    && npm install npm@latest -g

EXPOSE 3000

