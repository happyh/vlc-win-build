# vlc-win-build

1. 运行./docker.sh，进入编译docker，然后执行对应的3.build.sh或者4.build.sh
2. 需要修改ffmpeg，进行build.3/contrib/contrib-win64/ffmpeg目录进行修改。
3. 或者进入vlc.3/contrib/src/ffmpeg/rules.mak，增加需要的patch，类似：
        $(APPLY) $(SRC)/ffmpeg/h264_early_SAR.patch
+       $(APPLY) $(SRC)/ffmpeg/h265-rtmp-flv.patch
        $(APPLY) $(SRC)/ffmpeg/0001-avcodec-dxva2_hevc-add-support-for-parsing-HEVC-Rang.patch

