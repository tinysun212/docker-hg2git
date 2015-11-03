FROM tinysun/wine-xpra
MAINTAINER Han Sangjin "tinysun.net@gmail.com"

# for Git, Mercurial
RUN apt-get install -y git mercurial

RUN wget https://github.com/tinysun212/fast-export/archive/v1.0.zip -O /usr/local/etc/fast-export.zip
COPY  startup.sh install_tool.sh /usr/local/bin/

EXPOSE 22
CMD ["/usr/local/bin/startup.sh"]

