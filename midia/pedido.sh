#!/bin/bash
# Pedido 10: fundos fixos de celular, rodada 15 (14 opções)
set -e
mkdir -p midia/fundos/original midia/fundos/web
while read nome gen url; do
  curl -sSfL -o "midia/fundos/original/$nome.png" "$url"
  ffmpeg -v error -y -i "midia/fundos/original/$nome.png" -vf scale=720:1280 -q:v 4 "midia/fundos/web/$nome.jpg"
done < midia/fundos/lista.txt
ls -la midia/fundos/web
