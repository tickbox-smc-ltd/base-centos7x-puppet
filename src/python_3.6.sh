!/usr/bin/env bash
# This bootstraps Python on CentOS 7.x

set -e

#REPO_URL="http://python.org/ftp/python/3.6.0/Python-3.6.0.tar.xz"
REPO_URL="https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tar.xz"
GET_PIP_URL="https://bootstrap.pypa.io/get-pip.py"

# Compilers and related tools:
yum groupinstall -y "development tools"

# Libraries needed during compilation to enable all features of Python:
yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel expat-devel

# If you are on a clean "minimal" install of CentOS you also need the wget tool:
yum install -y wget

# Python 3.6.1:
wget "${REPO_URL}"
tar xf Python-3.6.1.tar.xz
cd Python-3.6.1
./configure --prefix=/usr/local --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"
make && make altinstall

# First get the script:
wget "${GET_PIP_URL}"

# Then execute it using Python 3.6:
/usr/local/bin/python3.6 get-pip.py

echo "Installing python packages ..."
#mkdir -p /home/vagrant/.pip_download_cache
#export PIP_DOWNLOAD_CACHE=/home/vagrant/.pip_download_cache
#export VIRTUALENV=/home/vagrant/env
#pip install -U pip virtualenv
#virtualenv --system-site-packages $VIRTUALENV
#source $VIRTUALENV/bin/activate
/usr/local/bin/pip3.6 install -r /deploy/requirements.txt
if [ $? -gt 0 ]; then
    echo 2> 'Unable to install python requirements from requirements.txt'
    exit 1
fi

