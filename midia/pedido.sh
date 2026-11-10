#!/bin/bash
# Pedido 13: conferir no ar os fundos fixos, celular e computador, com as fontes reais
mkdir -p midia/conferencia/fundos
cd /tmp && npm init -y >/dev/null && npm i -s playwright@1.47.2 >/dev/null && npx playwright install --with-deps chromium >/dev/null 2>&1
cat > /tmp/t.js <<'JS'
const {chromium}=require('playwright');
const st={parent:{nome:'Rogerio'},consent:{obr:true},pin:'1234',kids:[{id:'k1',apelido:'Bia',ano:'5',av:{skin:3,hair:1,iris:1,top:0,acc:1,strap:0,hairStyle:'rabo',body:'f',topK:'camiseta',glasses:'none',hat:'none'},avSet:true,prog:{},done:[],stickers:[]}],cur:'k1'};
(async()=>{const b=await chromium.launch();const out=process.env.GITHUB_WORKSPACE+'/midia/conferencia/fundos';
for(const [w,h,m] of [[390,844,'cel'],[1440,900,'pc']]){
 const p=await b.newPage({viewport:{width:w,height:h},deviceScaleFactor:m==='cel'?2:1});
 p.on('pageerror',e=>console.log('ERR',m,e.message));
 await p.goto('https://app.iaih.app/?v='+Date.now(),{waitUntil:'networkidle'}); await p.waitForTimeout(1500);
 await p.screenshot({path:`${out}/${m}_c1.png`});
 await p.evaluate(s=>localStorage.setItem('mdf_app_v01',s),JSON.stringify(st));
 await p.goto('https://app.iaih.app/?v='+Date.now(),{waitUntil:'networkidle'}); await p.waitForTimeout(1500);
 await p.screenshot({path:`${out}/${m}_quem.png`});
 await p.click('[data-go="pinresp"]'); await p.waitForTimeout(1200); await p.screenshot({path:`${out}/${m}_pin.png`});
 await p.goto('https://app.iaih.app/?v='+Date.now(),{waitUntil:'networkidle'}); await p.waitForTimeout(800);
 await p.click('[data-act="pickkid"]'); await p.waitForTimeout(800);
 await p.click('[data-go="avatar"]'); await p.waitForTimeout(1500); await p.screenshot({path:`${out}/${m}_avatar.png`});
 await p.click('[data-go="album"]'); await p.waitForTimeout(1500); await p.screenshot({path:`${out}/${m}_album.png`});
 console.log(m,'fundo', await p.evaluate(()=>getComputedStyle(document.querySelector('.scr'),'::before').backgroundImage));
}
await b.close();})();
JS
node /tmp/t.js > $GITHUB_WORKSPACE/midia/conferencia/fundos/status.txt 2>&1
true
