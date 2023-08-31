Installation guide

1. Upload the installation program to the target.

	You can upload file to target by ftp, nfs, scp, ... .

2. Set the installation program as executable and invoke it

	root@Moxa:~# chmod a+x dosfstools-4.1_install.sh
	root@Moxa:~# ./dosfstools-4.1_install.sh
	
	Welcome to MOXA embedded computer dosfstools auto installer
	
	Press the number:
	1.Install the package
	2.Uninstall the package
	3.Exit or CTRL+C
	1
	Stopping web server: apache.
	Starting web server: apache.
	root@Moxa:~#

	These files are installed in the system /sbin/fsck.fat, /sbin/mkfs.fat /sbin/fatlabel

3. Use the fack.fat to check the FAT32 filesystem.

	In this example, /dev/mmcblk0p1 is formated as FAT32 filesystem.

	root@Moxa:~# cat /proc/partitions 
	major minor  #blocks  name
	
	  31     0        256 mtdblock0
	  31     1       1792 mtdblock1
	  31     2       8192 mtdblock2
	  31     3       6144 mtdblock3
	 121     0      30400 mmcblk0
	 121     1      29376 mmcblk0p1

	The usage information of fsck.fat

	root@Moxa:~# fsck.fat -h
	fsck.fat: invalid option -- h
	usage: fsck.fat [-aAbflrtvVwy] [-d path -d ...] [-u path -u ...]
	               device
	  -a       automatically repair the filesystem
	  -A       toggle Atari filesystem format
	  -b       make read-only boot sector check
	  -c N     use DOS codepage N to decode short file names (default: 437)
	  -d path  drop that file
	  -f       salvage unused chains to files
	  -l       list path names
	  -n       no-op, check non-interactively without changing
	  -p       same as -a, for compat with other *fsck
	  -r       interactively repair the filesystem (default)
	  -t       test for bad clusters
	  -u path  try to undelete that (non-directory) file
	  -v       verbose mode
  	-V       perform a verification pass
	  -w       write changes to disk immediately
	  -y       same as -a, for compat with other *fsck

	The mmcblk0p1 device file is /dev/mmc1. If the device is mounting, you should umount it before fsck.

	root@Moxa:~# fsck.fat -a -v /dev/mmc1 
	CP437: Invalid argument
	fsck.fat 4.1 (2017-01-24)
	Checking we can access the last sector of the filesystem
	Boot sector contents:
	System ID "mkdosfs"
	Media byte 0xf8 (hard disk)
	       512 bytes per logical sector
	      2048 bytes per cluster
	         4 reserved sectors
	First FAT starts at byte 2048 (sector 4)
	         2 FATs, 16 bit entries
	     30720 bytes per FAT (= 60 sectors)
	Root directory starts at byte 63488 (sector 124)
	       512 root directory entries
	Data area starts at byte 79872 (sector 156)
	     14649 data clusters (30001152 bytes)
	60 sectors/track, 1 heads
	         0 hidden sectors
	     58752 sectors total
	Reclaiming unconnected clusters.
	/dev/mmc1: 1 files, 2/14649 clusters

	Note: The error message, CP437: Invalid argument, printed is that the iconv_open() is not supported. It can be ignored in the system.

