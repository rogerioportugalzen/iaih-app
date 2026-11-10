#!/bin/bash
# Pedido 5: conferir o domínio certo iaih.app
mkdir -p midia/conferencia
{
for d in iaih.app app.iaih.app www.iaih.app; do echo "== $d A: $(dig +short $d A | tr '\n' ' ') CNAME: $(dig +short $d CNAME)"; done
echo "== NS: $(dig +short iaih.app NS | tr '\n' ' ')"
for u in https://iaih.app/ https://app.iaih.app/ https://app.iaih.app/cenarios/trilha_cel.mp4; do echo "$u -> $(curl -s -o /dev/null -w '%{http_code} %{content_type} %{size_download}' -L --max-time 20 $u)"; done
curl -sL --max-time 20 https://app.iaih.app/ | grep -o '<title>[^<]*</title>'
} > midia/conferencia/dns2.txt 2>&1
true
