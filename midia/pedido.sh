#!/bin/bash
# Pedido 16: quadros da Duda e do Tagarela para os vídeos da conversa
set -e
while read nome url; do curl -sSfL -o "midia/quadros/$nome.png" "$url"; ffmpeg -v error -y -i "midia/quadros/$nome.png" -vf scale=720:1280 -q:v 4 "midia/quadros/$nome.jpg"; done < midia/quadros/lista.txt
ls -la midia/quadros
