#!/bin/bash
MARCH=$(uname -m)

if   [[ $MARCH =~ ".*arm.*" ]] ; then
  ARCH="arm"
elif [[ $MARCH =~ "i686" ]]     ; then
  ARCH="386"
elif [  $MARCH == "x86_64" ]   ; then
  ARCH="amd64"
else
  echo "Unsupported architecture: $MARCH"
  exit -1
fi

ZIP="consul_0.7.1_linux_$ARCH.zip"
URL="https://releases.hashicorp.com/consul/0.7.1/$ZIP"

if [ -f $ZIP ] ; then
  echo "File $ZIP exists"
else
  echo "Downloading: $URL" 
  wget $URL
fi

unzip $ZIP
