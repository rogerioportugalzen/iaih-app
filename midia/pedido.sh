#!/bin/bash
# Pedido 25: teste do Tagarela V12 com prompt travado
set -e
d=midia/videos/m1; mkdir -p $d
curl -sSfL -o $d/v12_teste2.mp4 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/UWn30pW5rTgQypqHutCv/TIZT92z3fdiYkvZpAFBF/content.mp4?Expires=1794931200&KeyName=assets-cdn-key-1&Signature=2v1lTvL6K4_Z_swGn67b4QmHeDk='
ls -la $d
