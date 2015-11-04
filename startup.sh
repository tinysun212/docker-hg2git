#!/bin/bash

# Create a user
USERID=taster
PASSWORD="1"
ENCRYPTED=`perl -e 'print crypt('"$PASSWORD"', "aa"),"\n"'`
useradd -m -d /home/$USERID -p $ENCRYPTED $USERID
adduser $USERID sudo
chsh -s /bin/bash $USERID  # Set the default shell as bash
chown $USERID  /home/$USERID

# Setup Environment
su - $USERID -c "/usr/local/bin/setup_env.sh"
locale-gen en_US.UTF-8


# Start Samba server
cat >> /etc/samba/smb.conf <<ENDCONF
[taster]
comment = Taster's Home
read only = yes
path = /home/taster
force user = taster
guest ok = yes
ENDCONF
/usr/sbin/smbd


# Start dummy X Server
su - $USERID -c "xpra start :15 --xvfb='Xvfb +extension Composite -screen 0 800x600x24+32  -nolisten tcp -noreset'"
su - $USERID -c "sleep 3; export LANG=en_US.UTF-8; xterm -display :15" &


# Start SSH daemon
mkdir /var/run/sshd
/usr/sbin/sshd 


# Terminal
su - $USERID
