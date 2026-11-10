#!/bin/bash
# Pedido 9: conferir marca, trilha maior e fontes no ar em app.iaih.app com as fontes reais
mkdir -p midia/conferencia
echo "poster: $(curl -s -o /dev/null -w '%{http_code}' https://app.iaih.app/cenarios/trilha_pc_poster.jpg)" > midia/conferencia/status.txt
cd /tmp && npm init -y >/dev/null && npm i -s playwright@1.47.2 >/dev/null && npx playwright install --with-deps chromium >/dev/null 2>&1
cat > /tmp/t.js <<'JS'
const {chromium}=require('playwright');
(async()=>{const b=await chromium.launch();
for(const [w,h,n] of [[390,844,'cel'],[1440,900,'pc']]){
 const p=await b.newPage({viewport:{width:w,height:h},deviceScaleFactor:2});
 p.on('pageerror',e=>console.log('ERR',e.message));
 await p.addInitScript(()=>localStorage.setItem('mdf_app_v01',JSON.stringify({parent:{nome:'R'},consent:{obr:true},pin:'1234',kids:[{id:'k1',apelido:'Bia',ano:'5',av:{skin:3,hair:1,iris:1,top:0,acc:1,strap:0,hairStyle:'rabo',body:'f',topK:'camiseta',glasses:'none',hat:'none'},avSet:true,prog:{},done:[],stickers:[]}],cur:'k1'})));
 await p.goto('https://app.iaih.app/?v='+Date.now(),{waitUntil:'networkidle'});
 await p.click('[data-act="pickkid"]');
 await p.waitForTimeout(3500);
 await p.evaluate(()=>document.fonts.ready);
 console.log(n,'fontes', await p.evaluate(()=>[...new Set([...document.fonts].filter(f=>f.status==='loaded').map(f=>f.family))].join(',')));
 console.log(n,'video', await p.evaluate(()=>[...document.querySelectorAll('.cen video')].map(v=>v.currentSrc.split('/').pop()+' pronto='+v.readyState+' tocando='+(!v.paused)).join(' | ')));
 await p.screenshot({path:`${process.env.GITHUB_WORKSPACE}/midia/conferencia/trilha_${n}.png`});
}
const q=await b.newPage({viewport:{width:390,height:844},deviceScaleFactor:2});
 await q.addInitScript(()=>localStorage.setItem('mdf_app_v01',JSON.stringify({parent:{nome:'R'},consent:{obr:true},pin:'1234',kids:[{id:'k1',apelido:'Bia',ano:'5',av:null,avSet:true,prog:{},done:[],stickers:[]}],cur:'k1'})));
 await q.goto('https://app.iaih.app/?v='+Date.now(),{waitUntil:'networkidle'}); await q.waitForTimeout(1500);
 await q.screenshot({path:`${process.env.GITHUB_WORKSPACE}/midia/conferencia/quem_cel.png`});
 console.log('titulo', await q.title(), 'velha', (await q.request.get('https://app.iaih.app/app/index.html')).status());
await b.close();})();
JS
node /tmp/t.js >> $GITHUB_WORKSPACE/midia/conferencia/status.txt 2>&1
true
