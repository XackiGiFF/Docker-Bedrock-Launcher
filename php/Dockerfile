FROM debian:latest

RUN apt-get update && apt-get upgrade -y \
    && apt-get install apt-utils -y

ENV USER=mcpe
ENV HOME=/home/mcpe

RUN apt install --no-install-recommends -y ca-certificates \
    apt-transport-https \
    sudo git curl make gcc wget \
    autoconf automake m4 \
    bzip2 bison g++ cmake pkg-config \
    re2c libtool-bin screen

RUN useradd -d ${HOME} -m ${USER} && passwd -d ${USER} && adduser ${USER} sudo

WORKDIR /home/mcpe

COPY compile.sh ./compile.sh
RUN cd ${HOME}
RUN chmod +x ./compile.sh
RUN ./compile.sh

#Clear Docker Image, delete build tools
getRUN apt- purge ca-certificates apt-transport-https git make gcc wget autoconf automake m4 g++ cmake pkg-config re2c libtool-bin -y
RUN apt-get autoremove --purge -y && apt-get autoclean -y && apt-get clean -y
RUN rm -rf /var/lib/{apt,dpkg,git}

#Chown dir, set user mcpe
RUN chown -Rf mcpe:mcpe /home/mcpe
USER mcpe

CMD ["/bin/sh"]