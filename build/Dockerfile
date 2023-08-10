FROM ubuntu:18.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update \
    && apt-get install -y wget net-tools inetutils-ping nano vim \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /earthworm
WORKDIR /earthworm

# -- 下載 earthworm_7.10.1 ubuntu版本
RUN wget http://folkworm.ceri.memphis.edu/ew-dist/v7.10.1/earthworm_7.10.1-ubuntu18.04-64bit-bin.tar.gz \
    && tar --no-same-owner -xvf earthworm_7.10.1-ubuntu18.04-64bit-bin.tar.gz 

ADD /earthworm /earthworm

CMD ["bash","-c","/earthworm/init.sh"]

# PORT
EXPOSE 10000


