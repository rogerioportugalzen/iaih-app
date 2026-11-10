#!/bin/bash
# Pedido 15: amostras das vozes da Duda e do Tagarela (3 de cada)
set -e
while read nome url; do curl -sSfL -o "midia/vozes/$nome.mp3" "$url"; done < midia/vozes/lista.txt
ls -la midia/vozes
