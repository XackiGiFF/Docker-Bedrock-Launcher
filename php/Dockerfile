FROM ubuntu:jammy

RUN apt-get update && apt-get upgrade -y \
    && apt-get install apt-utils -y

RUN apt-get install libc6-dev -y
RUN apt-get install screen nano mc -y

ENV USER=mcpe
ENV HOME=/home/mcpe

RUN apt install --no-install-recommends -y ca-certificates \
    apt-transport-https \
    sudo git curl make gcc wget \
    autoconf automake m4 \
    bzip2 bison g++ cmake pkg-config \
    re2c libtool-bin screen mc nano

RUN useradd -d ${HOME} -m ${USER} && passwd -d ${USER} && adduser ${USER} sudo

WORKDIR /home/mcpe

RUN cd ${HOME}

RUN git clone https://github.com/pmmp/PHP-Binaries.git -b php-8.2-latest
RUN cp ./PHP-Binaries/compile.sh ./compile.sh
RUN rm -Rf ./PHP-Binaries

RUN chmod +x ./compile.sh
RUN ./compile.sh -P5 -j 12 -g -J

#Clear Docker Image, delete build tools
RUN apt-get purge ca-certificates apt-transport-https git make gcc wget autoconf automake m4 g++ cmake pkg-config re2c libtool-bin -y
RUN apt-get autoremove --purge -y && apt-get autoclean -y && apt-get clean -y
RUN rm -rf /var/lib/{apt,dpkg,git}

#Chown dir, set user mcpe
RUN chown -Rf mcpe:mcpe /home/mcpe
USER mcpe

CMD ["/bin/sh"]
