FROM ubuntu:latest
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y git-core
RUN mkdir /download
RUN cd /download && wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.9.0-1_amd64.deb
RUN cd /download && pkg -i chefdk_0.9.0-1_amd64.deb
# Souce
COPY . /chef
