#!/bin/bash
# Pedido 2: cenário da trilha (celular), rodada 14
set -e
mkdir -p midia/cenarios /tmp/m
curl -sSfL -o /tmp/m/loop.mp4 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/UDd801TP3AQpMhcPMB5p/lTROWCjKWVUlhLgxHRzT/content.mp4?Expires=1794340800&KeyName=assets-cdn-key-1&Signature=WiTB7Tb3DblXOQ-2q2PWJ-2DTQU='
cp /tmp/m/loop.mp4 midia/cenarios/trilha_cel_original.mp4
ffmpeg -v error -y -i /tmp/m/loop.mp4 -filter_complex "[0:v]split=3[a][b][c];[a]trim=1:7,setpts=PTS-STARTPTS[mid];[b]trim=7:8,setpts=PTS-STARTPTS[tail];[c]trim=0:1,setpts=PTS-STARTPTS[head];[tail][head]xfade=transition=fade:duration=1:offset=0[x];[mid][x]concat=n=2:v=1[out]" -map "[out]" -an -c:v libx264 -crf 14 -preset fast -pix_fmt yuv420p /tmp/m/seam.mp4
ffmpeg -v error -y -i /tmp/m/seam.mp4 -vf scale=720:1280 -an -c:v libx264 -crf 27 -preset slow -pix_fmt yuv420p -movflags +faststart midia/cenarios/trilha_cel.mp4
ffmpeg -v error -y -i /tmp/m/seam.mp4 -vf scale=720:1280 -an -c:v libvpx-vp9 -crf 38 -b:v 0 -row-mt 1 -deadline good -cpu-used 2 midia/cenarios/trilha_cel.webm
ffmpeg -v error -y -i /tmp/m/seam.mp4 -vf "select=eq(n\,0),scale=720:1280" -frames:v 1 -q:v 3 midia/cenarios/trilha_cel_poster.jpg
ffmpeg -v error -y -i /tmp/m/seam.mp4 -vf "fps=1,scale=270:480,tile=7x1" -frames:v 1 midia/cenarios/trilha_cel_quadros.jpg
ls -la midia/cenarios
