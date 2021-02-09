# !/bin/sh
echo "** Add user for ssh access**"
adduser -D test
echo "** Set the password for user **"
echo test:123 | chpasswd
echo "** Creating an SSH key **"
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
echo "** Run SSHD **"
/usr/sbin/sshd
echo "** Starting nginx daemon **"
nginx -g "daemon off;"

