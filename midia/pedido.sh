#!/bin/bash
# Pedido 4: diagnóstico de DNS do iahii.app
mkdir -p midia/conferencia
{
for d in app.iahii.app iahii.app www.iahii.app; do echo "== $d"; dig +short $d A; dig +short $d CNAME; dig @8.8.8.8 +short $d A; done
echo "== NS"; dig +short iahii.app NS; dig @8.8.8.8 iahii.app NS +noall +answer +authority
echo "== SOA"; dig @1.1.1.1 iahii.app SOA +noall +answer +authority
echo "== whois"; whois iahii.app 2>/dev/null | grep -iE "status|expir|name server|registrar:" | head -20
} > midia/conferencia/dns.txt 2>&1
true
