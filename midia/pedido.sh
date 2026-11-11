#!/bin/bash
# Pedido 19: vídeo de teste V1 (Duda, OmniHuman 1.5, 1080p)
set -e
mkdir -p midia/videos
curl -sSfL -o midia/videos/v1_duda_original.mp4 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/o4Hkodkvbft7HilUzOyI/G85CbYKXQWH5cv9i0Pet/content.mp4?Expires=1794369600&KeyName=assets-cdn-key-1&Signature=Awyoi8qr8QAHi60z0kqgukm52oY='
ffprobe -v error -show_entries format=duration:stream=codec_type,width,height,r_frame_rate -of compact midia/videos/v1_duda_original.mp4 > midia/videos/v1_info.txt
ffmpeg -v error -y -i midia/videos/v1_duda_original.mp4 -vf scale=720:-2 -c:v libx264 -crf 24 -preset slow -pix_fmt yuv420p -c:a aac -b:a 96k -movflags +faststart midia/videos/v1_duda.mp4
ffmpeg -v error -y -i midia/videos/v1_duda_original.mp4 -vf "fps=2,scale=180:-2,tile=8x1" -frames:v 1 midia/videos/v1_quadros.jpg
ls -la midia/videos
