#!/bin/bash

# dnf -y install wget
# wget -P /etc/profile.d/ https://gitee.com/siemens800/daneiProject/blob/master_fenzhi_01/lindows/shell/lindows.sh #下载到指定目录
# source /etc/profile.d/lindows.sh

# 关闭防火墙
sudo systemctl stop firewalld    # Stop the service
sudo systemctl disable firewalld # Disable auto-start at boot

alias tt='ps -ef | grep http'              #添加别名tt 
alias jj='ps -ef | grep java'              #添加别名jj
alias nn='netstat -atpln | grep : | sort'  #添加别名nn
alias pp='netstat -aptln | grep php'       #添加别名pp
alias mm='netstat -atpln | grep mysql'     #添加别名mm
HISTTIMEFORMAT="%F %T "                    #添加history命令具体执行时间，并格式化输出
HISTFILESIZE=10000                         #定义保存命令的记录总数.
HISTSIZE=10000                             #定义history命令输出的记录数，HISTFILESIZE 与 HISTSIZE 的区别 ， http://www.linuxeden.com/forum/viewthread.php?tid=159573

# 联网安装相关软件
dnf -y install wget telnet 
wget https://www.rpmfind.net/linux/epel/7/x86_64/Packages/t/tcping-1.3.5-19.el7.x86_64.rpm; sleep 2; rpm -ivh tcping-1.3.5-19.el7.x86_64.rpm


# wget https://repo.mysql.com//mysql80-community-release-el8-5.noarch.rpm -P /opt
# rpm -ivh /opt/mysql80-community-release-el8-5.noarch.rpm
# cd /etc/yum.repos.d
# sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://mirrors.aliyun.com/centos-vault|g' /etc/yum.repos.d/CentOS-*
# yum clean all
# yum makecache
process_name="nginx"      # 设置判断进程名
if pgrep -x "$process_name" > /dev/null; then
        echo ""  # 打印换行
        echo "nginx进程已经存在"
        ps -ef | grep nginx
        echo "开始进入shell..."
        echo ""  # 打印换行
        # 禁止使用 exit 1 或 exit 0，否则ssh连接永久断开
else
        echo "进程不存在，启动进程..."
        ps -aux | grep nginx
        # /usr/sbin/nginx -s stop  # 不管有无进程，先停止一把
        # pkill -9 nginx
        echo "nginx准备启动..."
        /usr/sbin/nginx  # 启动nginx进程
fi