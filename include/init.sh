 #/*******************************************************************************
 #* Author:  Josery.
 #* Blog:    www.chenxu.info
 #* Filename:		init.sh
 #* Description:  init install environment  
 #* Last modified:	2015-08-12 18:51
 #* *****************************************************************************/
#!/bin/bash

# Define all variable
# Common
Download_dir='/root/downloads'

# MySQL variable
Mysql_base='/usr/local/mysql'
Mysql_data='/data0/mysql'
Mysql_libdir='/var/lib/mysql'
Mysql_logdir='/var/log/mysql'
Mysql_port='3336'
Mysql_user='mysql'
	
# Mariadb
Mariadb_base='/usr/local/mariadb
Mariadb_data='/data0/mariadb
Mariadb_libdir='/var/lib/mariadb
Mariadb_logdir='/var/log/mariadb
Mariadb_port='3356'
Mariadb_user='mariadb'

# Apache 
Apache_base='/usr/local/apache'
Apache_libdir='/var/lib/httpd'
Apache_logdir='/var/log/httpd'

# Nginx 
Nginx_base='/usr/local/nginx'
Nginx_libdir='/var/lib/nginx'
Nginx_logdir='/var/log/nginx'

# Lighttpd
Lighttpd_base='/usr/local/lighttpd'
Lighttpd_libdir='/var/lib/lighttpd'
Lighttpd_logdir='/var/log/lighttpd'


# PHP 
PHP_base='/usr/local/php'
  
# Add Aliyun_mirrors  
if [ -f '/etc/yum.repos.d/CentOS-Base.repo' ]; then
    echo -e "\033[;32m Already add aliyum repos, nothing \033[0m"
else

    OS_version=`cat /etc/redhat-release |awk '{print $3}' |awk -F. '{print $1'}`
    Url_5='http://mirrors.aliyun.com/repo/Centos-5.repo'
    Url_6='http://mirrors.aliyun.com/repo/Centos-6.repo'
    Url_7='http://mirrors.aliyun.com/repo/Centos-7.repo'

    cd /etc/yum.repos.d
	
    # Backup default repos 
    mv CentOS-Base.repo CentOS-Base.repo.bak

    if [ "$OS_version" == "5" ]; then 
         wget -O CentOS-Base.repo $Url_5
    elif [ "$OS_version" == "6" ]; then
         wget -O CentOS-Base.repo $Url_6
    elif [ "$OS_version" == "7" ]; then
         wget -O CentOS-Base.repo $Url_7
    fi

    # Clean yum_cache
    yum clean all
    # Make yum_cache
    yum makecache 

fi

# Install necessary software
yum install gcc cmake libtool -y



