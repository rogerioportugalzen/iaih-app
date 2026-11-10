#!/bin/bash
# Pedido 6: ver se app.iaih.app está em cache
mkdir -p midia/conferencia
{
curl -sI "https://app.iaih.app/?x=$RANDOM$RANDOM" | grep -iE "^(http|x-|cache|age|server|last-mod|platform|panel)"
echo "chewy: $(curl -sL "https://app.iaih.app/index.html?x=$RANDOM" | grep -c Chewy)"
for f in .ftp-deploy-sync-state.json cenarios/trilha_pc_poster.jpg .htaccess; do echo "$f -> $(curl -s -o /dev/null -w '%{http_code} %{size_download}' "https://app.iaih.app/$f?x=$RANDOM")"; done
curl -sI "https://app.iaih.app/cenarios/trilha_pc_poster.jpg" | grep -iE "^(http|x-|cache|age)"
} > midia/conferencia/cache.txt 2>&1
true
