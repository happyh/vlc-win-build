#!/bin/bash
#########################################################################
# File Name: docker.sh
# Author: happyhe
# mail: heguang@qiyi.com
# Created Time: Mon 22 May 2023 10:55:30 AM CST
#########################################################################
#docker rm $(docker ps -aqf "status=exited")
docker pull registry.cn-beijing.aliyuncs.com/happyhe/vlc-build-win64-3.0
docker rm vlc-build
docker run -it --name vlc-build --privileged -u root -v /data:/data happyhe/vlc-build-win64-3.0 /bin/bash
#docker run -it --name vlc-build4 --privileged -u root -v /data:/data happyhe/vlc-build-win64-4.0 /bin/bash
