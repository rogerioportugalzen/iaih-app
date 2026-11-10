#!/bin/bash
# Pedido 7: conferir a pasta /app/ dentro do subdomínio
mkdir -p midia/conferencia
{
echo "app/: $(curl -s -o /dev/null -w '%{http_code} %{size_download}' "https://app.iaih.app/app/?x=$RANDOM")"
echo "chewy em app/: $(curl -sL "https://app.iaih.app/app/index.html?x=$RANDOM" | grep -c Chewy)"
echo "poster em app/: $(curl -s -o /dev/null -w '%{http_code}' "https://app.iaih.app/app/cenarios/trilha_pc_poster.jpg")"
curl -s "https://app.iaih.app/.ftp-deploy-sync-state.json" | head -c 800
} > midia/conferencia/pasta.txt 2>&1
true
