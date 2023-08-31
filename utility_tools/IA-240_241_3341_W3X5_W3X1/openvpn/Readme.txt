Installation guide

1. Upload the installation program to the target.
   You can upload file to target by ftp, nfs, scp, ... .

2. Set the installation program as executable and invoke it
	 chmod 755 package_install.sh

3. To use it

  3.a. Initialize the openvpn

  # /etc/openvpn/openvpn-bridge start

  3.b. Configure your VPN in /etc/openvpn/tun.conf

  3.c. Start your VPN

  # openvpn --config /etc/openvpn/tun.conf
