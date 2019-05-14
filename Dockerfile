FROM ubuntu:16.04

COPY . /svaba
WORKDIR /svaba

#### Basic image utilities
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential bzip2 libbz2-dev zlib1g-dev liblzma-dev libcurl4-openssl-dev libssl-dev git && \
    apt-get -y clean && \
    apt-get -y autoclean && \
    apt-get -y autoremove

# SvABA
RUN git clone --recursive https://github.com/walaj/svaba && \
    cd /svaba/svaba && \
    ./configure && \
    make && \
    make install && \
    cd /svaba

ENV PATH $PATH:/svaba/svaba/bin:/svaba/svaba/R

# Define default command.
CMD ["bash"]
