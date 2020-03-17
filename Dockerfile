FROM ubuntu:18.04

# react_hands_on

ENV NODE_VERSION 10.10.0
ENV NVM_DIR /usr/local/nvm

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update -y

# utils install
RUN apt-get install -y curl wget git gnupg unzip less lsof net-tools apt-utils
RUN apt-get install -y build-essential
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
RUN apt-get install -y npm

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# firebase install
RUN npm install -g firebase-tools

# WORKDIR
RUN mkdir /works
RUN mkdir /development
WORKDIR /works

# create-react-app install
RUN npm install -g yarn vue vuex vue-router vue-cli quasar-cli

# CODE-SERVER install
RUN wget https://github.com/cdr/code-server/releases/download/1.939-vsc1.33.1/code-server1.939-vsc1.33.1-linux-x64.tar.gz
RUN tar xzf code-server1.939-vsc1.33.1-linux-x64.tar.gz -C ./ --strip-components 1