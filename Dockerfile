FROM ubuntu:trusty
MAINTAINER Santosh Rai <santosh.rai.acquis@gmail.com>

# Prevent dpkg errors
ENV TERM=xterm-256color

# Set mirrors to NZ
# RUN sed -i "s/http:\/\/archive./http:\/\/nz.archive./g" /etc/apt/sources.list 

# Install node.js
RUN apt-get update && \
    apt-get install curl -y && \
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && \
    apt-get install -y nodejs 

COPY . /app
WORKDIR /app

# Install application dependencies
RUN npm install -g mocha@5.2.0 && \
    npm install

# Set mocha test runner as entrypoint
ENTRYPOINT ["mocha"]
