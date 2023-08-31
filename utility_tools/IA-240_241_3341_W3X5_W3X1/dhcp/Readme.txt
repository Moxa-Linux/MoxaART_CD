Installation guide

1. Upload the installation program to the target.
   You can transfer file to target by ftp, nfs, scp, ... .
   
   Note: the ftp transfer must be in binary mode

2. Set the installation program as executable and invoke it
	 chmod 755 package_install.sh

3. Configure dhcpd
   /etc/dhcpd.conf

4. Start/stop the service
   /etc/init.d/dhcp start
   /etc/init.d/dhcp stop
