#!/bin/bash
# Pedido 17: novas vozes para a Duda (vozes gravadas da biblioteca)
set -e
while read nome url; do curl -sSfL -o "midia/vozes/$nome.mp3" "$url"; done < midia/vozes/lista2.txt
ls -la midia/vozes
