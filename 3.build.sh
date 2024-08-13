#!/bin/bash
#########################################################################
# File Name: build.sh
# Author: happyhe
# mail: heguang@qiyi.com
# Created Time: Mon 22 May 2023 10:57:49 AM CST
#########################################################################

git config --global core.autocrlf false
git clone https://code.videolan.org/videolan/vlc.git vlc.3
cd vlc.3 && git checkout 3.0.20 && cd ..
git config --global http.version HTTP/1.1

mkdir build.3
cd build.3

#GIT_CURL_VERBOSE=1 && /bin/bash -x ../vlc.3/extras/package/win32/build.sh -a x86_64 -p > build.log 2>&1

GIT_CURL_VERBOSE=1 && /bin/bash -x ../vlc.3/extras/package/win32/build.sh -a x86_64 -r -i u > build.log 2>&1
#GIT_CURL_VERBOSE=1 && /bin/bash -x ../vlc.3/extras/package/win32/build.sh -a x86_64 
#cd win64; make package-win-common
#make package-win32-base
