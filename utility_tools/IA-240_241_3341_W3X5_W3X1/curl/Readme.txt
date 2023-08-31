Installation guide

1. Upload the installation program to the target.
   You can upload file to target by ftp, nfs, scp, ... .

2. Set the installation program as executable and invoke it
	chmod 755 package_install.sh
	./package_install.sh

3. For example to download a picture and rename as aaa.jpg
	curl http://blog.richliu.com/wp-content/themes/cutline-3-column-split-11/images/header_2.jpg -o aaa.jpg
