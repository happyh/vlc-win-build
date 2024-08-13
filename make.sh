#!/bin/bash
#########################################################################
# File Name: make.sh
# Author: happyhe
# mail: heguang@qiyi.com
# Created Time: Thu 25 May 2023 05:13:59 PM CST
#########################################################################

mkdir build
cd build

ARCH="x86_64"
: ${JOBS:=$(getconf _NPROCESSORS_ONLN 2>&1)}
TRIPLET=$ARCH-w64-mingw32
SCRIPT_PATH="$( cd "$(dirname "./vlc/extras/package/win32/build.sh")" ; pwd -P )"
VLC_ROOT_PATH="$( cd "${SCRIPT_PATH}/../../.." ; pwd -P )"

cd ./build/extras/tools
export VLC_TOOLS="$PWD/build"
export PATH="$PWD/build/bin":"$PATH"

cd ../../

CONTRIB_PREFIX=$TRIPLET

export PATH="$PWD/contrib/$CONTRIB_PREFIX/bin":"$PATH"
if [ -z "$WINVER" ]; then
       # The current minimum for VLC is Windows 7
           WINVER=0x0601
fi
CPPFLAGS="$CPPFLAGS -D_WIN32_WINNT=${WINVER} -DWINVER=${WINVER}"

# the values are not passed to the makefiles/configures
export CPPFLAGS

CFLAGS="$CPPFLAGS $CFLAGS"
CXXFLAGS="$CPPFLAGS $CXXFLAGS"

export CFLAGS
export CXXFLAGS

${VLC_ROOT_PATH}/contrib/bootstrap --host=$TRIPLET --prefix=../$CONTRIB_PREFIX $CONTRIBFLAGS
make -j$JOBS fetch
make -j$JOBS -k || make -j1


info "Configuring VLC"
#${SCRIPT_PATH}/configure.sh --host=$TRIPLET --with-contrib=../contrib/$CONTRIB_PREFIX "$WIXPATH" $CONFIGFLAGS


cd win64
make -j$JOBS
make package-win-common
