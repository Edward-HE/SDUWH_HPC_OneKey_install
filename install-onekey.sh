#!/bin/bash

##########################################
# 作者：Edward（http://47.97.211.178/）
# 电子邮件：duchenhe@outlook.com
# QQ： 447231732
# 如运行出现错误请立即通过电子邮件或QQ联系作者
##########################################
echo -e "
##################注意#####################
  此脚本只适用于山东大学（威海）2020年
  上学期 贺红 老师的 18级高性能计算课程
   由于利用了train目录添加的环境变量，
   因此不保证其他老师的课程中能够使用
##########################################

##########################################
# 作者：Edward-du（http://47.97.211.178/）
# 电子邮件：duchenhe@outlook.com
# QQ： 447231732
# 如运行出现错误请通过电子邮件或QQ联系作者
##########################################

\033[36m***********  0314 11:40更新  ***********
 - 加入了安装过程中导入所需环境变量的语句
***************************************\033[0m

\033[36m***********  0314 18:40更新  ***********
 - 加入了替换账号主目录下的.bashrc文件操作
***************************************\033[0m
    此脚本可以实现个人目录下HPL和HPCC两个
benchmark工具的安装，由于网络上教程繁多
，且不一定有效，故根据实践经验编写此脚本。
    压缩包里面已经打包好了我修改好的编译文件，
按照步骤操作即可。

    本人水平有限，编写此脚本也仅仅是为了方便
女朋友安装软件。"
echo -e "\033[35m▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄\n
提醒：请务必按照使用文档的步骤操作，\n当然操作错了，删掉目录重来就好了。\n你准备好了吗？ [y/n]\033[0m"
read ans
case "$ans" in
    [Yy])
        ;;
    [Nn]|*)
        echo "没有输入y或Y，程序将退出"
        exit 0 ;;
esac

# 替换.bashrc文件，使每次连接shell都载入所需的三个环境变量
cp ~/../bashrc ~/.bashrc

# 获取打包好的编译配置
wget ftp://hpc@115.28.186.54/SDUWH_hpc_by_Edward.tgz --ftp-password=

# 解压
tar zxvf SDUWH_hpc_by_Edward.tgz

# 进入编译配置所在目录
cd SDUWH_hpc_by_Edward

# 执行安装脚本
./install.sh

cd ..
rm -rf SDUWH_hpc_by_Edward
rm SDUWH_hpc_by_Edward.tgz

echo "安装已完成，如上述运行中未出现error提示，则已安装成功。
若出现error提示，请查阅资料或联系作者"
