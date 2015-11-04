FROM tinysun/wine-xpra
MAINTAINER Han Sangjin "tinysun.net@gmail.com"

# Install Git, Mercurial
RUN apt-get install -y git mercurial

# Install Convert Tool
RUN wget https://github.com/tinysun212/fast-export/archive/v1.0.zip -O /usr/local/etc/fast-export.zip
RUN unzip /usr/local/etc/fast-export.zip -d /opt
RUN ln -s fast-export-1.0  /opt/fast-export
COPY hg2git  /usr/local/bin/


COPY  startup.sh setup_env.sh /usr/local/bin/

EXPOSE 22
CMD ["/usr/local/bin/startup.sh"]
