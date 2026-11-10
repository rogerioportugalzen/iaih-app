#!/bin/bash
# Pedido 11: fundos fixos de computador, rodada 15
set -e
mkdir -p midia/fundos/original midia/fundos/web
while read nome gen url; do
  curl -sSfL -o "midia/fundos/original/$nome.png" "$url"
  ffmpeg -v error -y -i "midia/fundos/original/$nome.png" -vf scale=1600:900 -q:v 4 "midia/fundos/web/$nome.jpg"
done < midia/fundos/lista_pc.txt
ls -la midia/fundos/web
