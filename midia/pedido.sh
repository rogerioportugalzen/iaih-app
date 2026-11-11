#!/bin/bash
# Pedido 20: nova pose da Duda (asas livres, lupa no cordão)
set -e
curl -sSfL -o midia/quadros/duda_v2_1.png 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/Ntkh8yWDJ6hYWK71eNeW/2CUnpOFfrymgx55KAA2h/content.png?Expires=1794373200&KeyName=assets-cdn-key-1&Signature=8bVv44v6FnEMZG6RdxsfzIBM5fw='
curl -sSfL -o midia/quadros/duda_v2_2.png 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/dQ3ip8X0aBgz0HgbQgJX/2hhNoFDJuLFYhv0vMSPc/content.png?Expires=1794373200&KeyName=assets-cdn-key-1&Signature=wZ4m9A-NQkH6lf_rxsvWT2E_Wqw='
for n in duda_v2_1 duda_v2_2; do ffmpeg -v error -y -i midia/quadros/$n.png -vf scale=720:1280 -q:v 4 midia/quadros/$n.jpg; done
ls -la midia/quadros
