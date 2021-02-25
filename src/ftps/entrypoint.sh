# ! /bin/sh

#####
# Script Name:	entrypoint.sh
# Descrition:	Running and configuring the vsftpd - FTPS server
# Author:		amayor
#####

echo "** Copy custom configuration file for vsftpd **"
cp vsftpd.conf /etc/vsftpd/

echo "** Create user for access from ftp **"
adduser -D -g 'amayor' amayor

echo "** Set the password for user **"
echo amayor:amayor | chpasswd

echo "** Run vsftp daemon with specifed configuration **"
vsftpd /etc/vsftpd/vsftpd.conf