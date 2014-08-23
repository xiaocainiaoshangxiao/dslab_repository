#!/bin/bash
# (C) 2014 Yunlong Zhou <reaper888@yeah.net>
# Under licence  GPL
# File :	install.sh
# Introduction:
# 		This script is using for simplify the installing of Debian 5/6/7 new install machine 
# Useage :
#  		1. "su"  	-- get root permission
# 		2. "ifconfig" or "ping www.baidu.com "	-- to check if the computer is connecting Internet
#		3. if have no Internet , "dhclient eth0"	-- to connect the Internet
#		4. "tar -xvf new_machine.tar"  then "cd new_machine"
#		5. "chmox +x install.sh" 		-- give our script a execution permission
#		5. "./install.sh"   -- auto install and you can have a coffee now			

# firstly ,we set the apt-source, here we just give Debian 5/6/7 set module, if you use older or newer Debian version ,Just do a little change !
 echo "Now setting apt source"
 if grep -q "7.*" /etc/debian_version || grep -q -i "wheezy" /etc/debian_version ; [[ $? == 0 ]] ; then 
	 echo "deb http://mirrors.163.com/debian wheezy main contrib non-free" >/etc/apt/sources.list
 elif grep -q "6.*" /etc/debian_version || grep -q -i "squeeze" /etc/debian_version ; [[ $? == 0 ]] ; then 
     echo "deb http://mirrors.163.com/debian squeeze main contrib non-free" >/etc/apt/sources.list	
 elif grep -q "5.*" /etc/debian_version || grep -q -i "lenny" /etc/debian_version ; [[ $? == 0 ]] ; then
     echo "deb http://mirrors.163.com/debian lenny main contrib non-free" >/etc/apt/sources.list	
 fi	
 apt-get update
 
 # add chinese fonts and ibus,if you don't need ,just comment it
 echo "Now doning Chinese install"
 echo Y | apt-get install ttf-wqy-zenhei xfonts-intl-chinese wqy*   ibus im-switch ibus-pinyin  
 
 # add some useful application ,if you need some changes ,just do it
 echo " Now doing some application install"
 echo Y | apt-get install aptitude  dia xournal wireshark ssh unzip  ctags cscope git chromium-browser vim screen linuxlogo libncurses5-dev  build-essential libc6-dbg kernel-package

 # install sudo ,if you don't need just comment it
 echo "Now install sudo for your system and give your user a sudoer permission"
 echo Y | apt-get install sudo
 my_user=`who | head -n 1 | cut -d " " -f 1` 
 echo "$my_user	ALL=(ALL:ALL) ALL" >> /etc/sudoers	

 # the function is using for check if a application is installed ,if not installed just install it with apt-get install
function install_app  # para is the func you want to install
{
	aptitude search $1 > /tmp/log
	file_line=`cat /tmp/log | wc -l`
	for((i=1;i<=$file_line;i++));do 
		sed -n "$i"'p' /tmp/log >/tmp/log1
		i_status=`awk '{print $1}' /tmp/log1`
		par2=`awk '{print $2}' /tmp/log1`
		par3=`awk '{print $3}' /tmp/log1`
		if [[ $par2 == $1 || $par3 == $1 && $i_status != 'i' ]]; then
	        echo "Sorry ,\"$1\" not installed,we will install it"
	        apt-get install $1
		elif [[ $par2 == $1 || $par3 == $1 && $i_status == 'i' ]]; then
			echo "OK ,\"$1\" has been installed "
			break
	    fi
	done
	rm /tmp/log /tmp/log1
}

# sometimes ,our system have no graphic interfaces,we use these to install GNOME, if no need comment it
 echo " Now installing gnome"
install_app  xorg
install_app  gnome-core
install_app  gdm3

# add flash support for FireFox and Chrome Browse
echo " Now add flash support for browse"
mkdir -p /home/$my_user/.mozilla/plugins/ 
cp libflashplayer.so /home/$my_user/.mozilla/plugins/

# add vim config 
echo " Now add vim config"
mkdir -p /home/$my_user/.vim/plugin
cp taglist.vim /home/$my_user/.vim/plugin/
cp vimrc /etc/vim/vimrc	

# install WPS for i386/i686 system 
echo "Now installing WPS"
uname -a >/tmp/system_version
if grep "i386" /tmp/system_version || grep "i686" /tmp/system_version ; then
	dpkg -i symbol-fonts_*
	if [ ! -f wps-office_* ] ;then
		echo " Now doloading wps for linux ,may need a little long time"
		wget http://wdl1.cache.wps.cn/wps/download/Linux/unstable/wps-office_8.1.0.3724~b1p2_i386.deb
	fi
	dpkg -i wps-office_*
else
	echo "Sorry ,your system is not 32 bit system ,we will not install wps"
fi

# install deepin screenshot
echo "Now installing deepin screen shot"
echo Y | apt-get install python-xlib
dpkg -i deepin-scrot*


