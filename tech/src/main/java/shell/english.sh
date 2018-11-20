#!/bin/bash

#http http://www.chinaelt.cn/index.php/home/course/coursefids/ids/196

mainUrl=`http $1 | egrep -o 'vShow.asp\?v=[0-9]+' |sort | uniq |awk '{print $1}'`

for url in $mainUrl
do 
 innerUrl=`http http://www.chinaelt.cn/index.php/home/Play/play/v/${url:12}| egrep -o 'http.*m3u8' | sort| uniq |awk '{print $1}'`
 
 
 #GENERATE VIDEO
 ffmpeg -i $innerUrl -c copy ${url:12}_OLD.mp4
 
 #DELETE WATERMARK
 #ffmpeg -i ${url:12}_OLD.mp4 -vf delogo=x=1410:y=5:w=500:h=100 ${url:12}_MARK_DELETED.mp4
 
 #ADD WATERMARK
 #ffmpeg -i ${url:12}_MARK_DELETED.mp4 -acodec copy-vcodec copy -vf "movie=test.png[watermark];[in][watermark]overlay=10:10:1[out]" ${url:12}.mp4
 
 echo "${url:12}.mp4 FINESHED."

 sleep 10

 #DELETE OLD VIDEO
 #rm ${url:12}_OLD.mp4
 #rm ${url:12}_MARK_DELETED.mp4
 
 
done