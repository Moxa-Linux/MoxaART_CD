Installation guide

1. Upload the installation program to the target.
   You can upload file to target by ftp, nfs, scp, ... .

2. Set the installation program as executable and invoke it
	 chmod 755 package_install.sh

3. mii-toll usage

   set as 100Mbps half duplex
   # ./mii-tool -F 100baseTx-HD eth0
   
   set as 10Mbps full duplex
   # ./mii-tool -F 10baseT-FD eth0

   set as 10Mbps half duplex
   # ./mii-tool -F 10baseT-HD eth0

   check the link status of eth0
   # ./mii-tool eth0