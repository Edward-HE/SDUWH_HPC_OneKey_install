#!/bin/bash

##########################################
# 作者：Edward（http://duchenhe.xyz/）
# 电子邮件：duchenhe@outlook.com
# QQ： 447231732
# 如运行出现错误请立即通过电子邮件或QQ联系作者
##########################################


# 获取 HPL
wget http://www.netlib.org/benchmark/hpl/hpl-2.3.tar.gz

# 获取 HPCC
wget http://icl.cs.utk.edu/projectsfiles/hpcc/download/hpcc-1.5.0.tar.gz

# 解压
tar zxvf hpl-2.3.tar.gz -C ../
tar zxvf hpcc-1.5.0.tar.gz -C ../

cp Make.sduwhhpl ../hpl-2.3
cp Make.sduwhhpcc ../hpcc-1.5.0/hpl

source /opt/intel/composer_xe_2015.1.133/bin/compilervars.sh intel64
source /opt/intel/impi/5.0.2.044/bin64/mpivars.sh
source /opt/intel/mkl/bin/intel64/mklvars_intel64.sh

cd ../hpl-2.3
HPL_HOME=$(pwd)
export HPL_HOME
source /etc/profile
make arch=sduwhhpl

cd ../hpcc-1.5.0
make arch=sduwhhpcc

unset HPL_HOME