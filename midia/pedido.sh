#!/bin/bash
# Pedido 18: vozes da Duda, rodada mais jovem e sem eco
set -e
while read nome url; do curl -sSfL -o "midia/vozes/$nome.mp3" "$url"; done < midia/vozes/lista3.txt
ls -la midia/vozes
