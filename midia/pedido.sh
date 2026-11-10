#!/bin/bash
# Pedido 1: cenário da trilha (computador), rodada 14
set -e
mkdir -p midia/cenarios /tmp/m
curl -sSfL -o /tmp/m/loop.mp4 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/OndOBNruqOXISkij8yu5/DXMeKUOLBT2gFCgBp8HE/content.mp4?Expires=1794340800&KeyName=assets-cdn-key-1&Signature=zTjFFrQZWPz1XY6gLuYzc4ExDYE='
curl -sSfL -o midia/cenarios/trilha_pc_base.png 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/cZdSqc8GYLVM5Bsl8Rvo/qFYneGv23Nli6BlNpmnF/content.png?Expires=1794340800&KeyName=assets-cdn-key-1&Signature=ciWzPvQ_HOLHk-WEUBSp9OMxsKI='
curl -sSfL -o midia/cenarios/trilha_cel_base.png 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/zqPUDq8Dt0gjdspVBMEO/W1dQbLUejG4gRyu55LVP/content.png?Expires=1794340800&KeyName=assets-cdn-key-1&Signature=BpjqS_Hk2W4ayNnHKxKd9_-FnXE='
# fecha a emenda do loop: meio (1s a 7s) + fusão do último segundo com o primeiro
ffmpeg -v error -y -i /tmp/m/loop.mp4 -filter_complex "[0:v]split=3[a][b][c];[a]trim=1:7,setpts=PTS-STARTPTS[mid];[b]trim=7:8,setpts=PTS-STARTPTS[tail];[c]trim=0:1,setpts=PTS-STARTPTS[head];[tail][head]xfade=transition=fade:duration=1:offset=0[x];[mid][x]concat=n=2:v=1[out]" -map "[out]" -an -c:v libx264 -crf 14 -preset fast -pix_fmt yuv420p /tmp/m/seam.mp4
ffmpeg -v error -y -i /tmp/m/seam.mp4 -vf scale=1280:720 -an -c:v libx264 -crf 27 -preset slow -pix_fmt yuv420p -movflags +faststart midia/cenarios/trilha_pc.mp4
ffmpeg -v error -y -i /tmp/m/seam.mp4 -vf scale=1280:720 -an -c:v libvpx-vp9 -crf 38 -b:v 0 -row-mt 1 -deadline good -cpu-used 2 midia/cenarios/trilha_pc.webm
ffmpeg -v error -y -i /tmp/m/seam.mp4 -vf "select=eq(n\,0),scale=1280:720" -frames:v 1 -q:v 3 midia/cenarios/trilha_pc_poster.jpg
# quadros de conferência
ffmpeg -v error -y -i /tmp/m/seam.mp4 -vf "fps=1,scale=480:270,tile=4x2" -frames:v 1 midia/cenarios/trilha_pc_quadros.jpg
ls -la midia/cenarios
