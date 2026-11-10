#!/bin/bash
# Pedido 12: fundo 7 de computador escolhido (B)
set -e
mkdir -p midia/fundos/original
curl -sSfL -o midia/fundos/original/pc7_conquistas_B.png 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/D9OzszaTfVDeQ8im5bTz/Mykq8uIXqNiALcJ3gipR/content.png?Expires=1794344400&KeyName=assets-cdn-key-1&Signature=LH0qOF3j36cJfnC0QjQDNzXqMU4='
curl -sSfL -o midia/fundos/original/pc7_conquistas_A.png 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/RI1axW0QweeOFPTEzCPT/ZQ6j6pgKZr6H4Dea7jq7/content.png?Expires=1794344400&KeyName=assets-cdn-key-1&Signature=Q2TGgeh6EeP60M6xTUb6IB6ppjk='
ls -la midia/fundos/original | tail -3
