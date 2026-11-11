#!/bin/bash
# Pedido 21: V1 refeito com a nova pose 2 da Duda
set -e
curl -sSfL -o midia/videos/v1b_duda_original.mp4 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/ZhuCB5RfOnlxGKqvdfZS/sJUsnUqC9638OZci0v0Q/content.mp4?Expires=1794373200&KeyName=assets-cdn-key-1&Signature=0wfVdDx3Tyuj-1QtHkEAosIUnLU='
ffmpeg -v error -y -i midia/videos/v1b_duda_original.mp4 -vf scale=720:-2 -c:v libx264 -crf 24 -preset slow -pix_fmt yuv420p -c:a aac -b:a 96k -movflags +faststart midia/videos/v1b_duda.mp4
ffmpeg -v error -y -i midia/videos/v1b_duda_original.mp4 -vf "fps=3,scale=200:-2,tile=7x2" -frames:v 1 midia/videos/v1b_quadros.jpg
ffmpeg -v error -y -i midia/videos/v1b_duda_original.mp4 -vf "fps=3,crop=iw:ih*0.45:0:ih*0.12,scale=300:-2,tile=7x2" -frames:v 1 midia/videos/v1b_asas.jpg
ls -la midia/videos
