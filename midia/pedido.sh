#!/bin/bash
# Pedido 3: conferir a trilha no ar (app.iahii.app) com as fontes reais
set -e
mkdir -p midia/conferencia
for f in "" cenarios/trilha_cel.mp4 cenarios/trilha_pc.webm cenarios/trilha_pc_poster.jpg; do echo "$f: $(curl -s -o /dev/null -w '%{http_code} %{content_type} %{size_download}' https://app.iahii.app/$f)"; done | tee midia/conferencia/status.txt
cd /tmp && npm init -y >/dev/null && npm i -s playwright@1.47.2 >/dev/null && npx playwright install --with-deps chromium >/dev/null 2>&1
cat > /tmp/t.js <<'JS'
const {chromium}=require('playwright');
(async()=>{const b=await chromium.launch();
for(const [w,h,n] of [[390,844,'cel'],[1440,900,'pc']]){
 const p=await b.newPage({viewport:{width:w,height:h},deviceScaleFactor:2});
 p.on('pageerror',e=>console.log('ERR',e.message));
 await p.addInitScript(()=>localStorage.setItem('mdf_app_v01',JSON.stringify({parent:{nome:'R'},consent:{obr:true},pin:'1234',kids:[{id:'k1',apelido:'Bia',ano:'5',av:{skin:3,hair:1,iris:1,top:0,acc:1,strap:0,hairStyle:'rabo',body:'f',topK:'camiseta',glasses:'none',hat:'none'},avSet:true,prog:{},done:[],stickers:[]}],cur:'k1'})));
 await p.goto('https://app.iahii.app/?v='+Date.now(),{waitUntil:'networkidle'});
 await p.click('[data-act="pickkid"]');
 await p.waitForTimeout(3000);
 await p.evaluate(()=>document.fonts.ready);
 console.log(n, await p.evaluate(()=>[...document.fonts].filter(f=>f.status==='loaded').map(f=>f.family).join(',')));
 console.log(n,'video', await p.evaluate(()=>[...document.querySelectorAll('.cen video')].map(v=>v.currentSrc+' '+v.readyState+' '+(!v.paused)).join(' | ')));
 await p.screenshot({path:`${process.env.GITHUB_WORKSPACE}/midia/conferencia/trilha_${n}.png`});
}
await b.close();})();
JS
node /tmp/t.js | tee -a $GITHUB_WORKSPACE/midia/conferencia/status.txt
