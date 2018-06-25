#!/bin/bash
SOURCE="$1"
STREAM_NAME="$2"

if [ -z $1 ] || [ -z $2 ]
then
  echo 'Usage: ./stream.sh <SOURCE> <STREAM_NAME>'
  exit
fi

FFMPEG_URL=https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-64bit-static.tar.xz
SCRIPT_PATH=`pwd`
FFMPEG=$SCRIPT_PATH/ffmpeg
WEB_PATH=/usr/share/nginx/html/$STREAM_NAME

if [ ! -e $FFMPEG ]; then
  curl -O $FFMPEG_URL > /dev/null 2>&1
  tar Jxvf ffmpeg-git-64bit-static.tar.xz > /dev/null 2>&1
  cp ffmpeg-git-*/ffmpeg $FFMPEG
  chmod 0755 $FFMPEG
  rm -rf ffmpeg-git-*
fi

while true
do
  if [ ! -e $WEB_PATH ]; then
    mkdir $WEB_PATH
  else
    rm -rf $WEB_PATH/*
  fi

  $FFMPEG -y -i "$SOURCE" -c copy -copyts -hls_time 10 -hls_flags delete_segments+second_level_segment_index+second_level_segment_size+second_level_segment_duration -use_localtime 1 -hls_segment_filename "$WEB_PATH/segment_%Y%m%d%H%M%S_%%04d_%%08s_%%013t.ts" "$WEB_PATH/playlist.m3u8"
done
