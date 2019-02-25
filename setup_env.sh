#!/bin/bash

cat >> ~/.hgrc <<ENDHGRC
[web]
cacerts =
ENDHGRC

cat >> ~/.profile <<ENDPROFILE

LANG=en_US.UTF-8
export LANG

[ -d Temp ] && cd Temp
ENDPROFILE
