#!/bin/bash

unzip /usr/local/etc/fast-export.zip
mv fast-export-1.0  fast-export
chmod 755 fast-export/*py fast-export/*sh

git init git_repo

cat >> ~/.hgrc <<ENDHGRC
[web]
cacerts =
ENDHGRC

cat >> ~/.profile <<ENDPROFILE
PATH="~/fast-export:\$PATH"

LANG=en_US.UTF-8
export LANG
ENDPROFILE
