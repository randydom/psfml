@echo off
cd /d "%~dp0"
@TITLE sfVideo
echo Converting audio to SFML compatible format....
echo(
ffmpeg.exe -i "%s" -ar 48000 -vn -c:a libvorbis -b:a 64k "%s" -loglevel quiet -stats -y