#!/bin/bash
# Pedido 24: V3, V5, V10, V11 da conversa da missão 1
set -e
d=midia/videos/m1; mkdir -p $d
b(){ curl -sSfL -o $d/$1.mp4 "$2"; }
b v3 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/eePefDGFZr0nJh3P5gss/bN5Gbdrd9NNZ1mCsUVaU/content.mp4?Expires=1794884400&KeyName=assets-cdn-key-1&Signature=5XO-ww-c57u2JsxPtSgh_kErgSg='
b v5 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/Hu1WbpzWJjSZFRBVVexl/KOWhaRmcUnwyH2GqEoIQ/content.mp4?Expires=1794891600&KeyName=assets-cdn-key-1&Signature=gfAHXcdpLTchgAEO_AAC1WxMZ0A='
b v10 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/s4T9sHu4K5Y45mU9KGXN/oA5pUhl1tZEHqTwANfQO/content.mp4?Expires=1794891600&KeyName=assets-cdn-key-1&Signature=_Lc57DvQbDxVoNxLJQ83B9lZXjY='
b v11 'https://elevenlabsusercontent.com/database/workspace/b3a94b79e3cd49dab5988760a1a297e2/content_generation/TVCZnjNPuBtIWRFcodRc/KQEo1RvwrbxJgQLd0mcl/content.mp4?Expires=1794891600&KeyName=assets-cdn-key-1&Signature=WHKnWm-R2zYjvqxlzJJEQlPmCX0='
ls -la $d
