const {chromium}=require('playwright');const fs=require('fs');const L=[];const log=(...a)=>{const s=a.map(x=>typeof x==='string'?x:JSON.stringify(x)).join(' ');console.log(s);L.push(s)};
const email=process.env.EMAIL,TS=Date.now();
(async()=>{fs.mkdirSync('out',{recursive:true});const b=await chromium.launch();
try{const p=await b.newPage({viewport:{width:390,height:844}});p.on('pageerror',e=>log('ERRO app',e.message));p.on('console',m=>{if(m.type()==='error')log('console',m.text())});
 await p.goto('http://localhost:8080/index.html');await p.waitForSelector('#f1',{timeout:15000});
 await p.click('[data-go=entrar]');await p.waitForSelector('#fe');
 await p.fill('#fe input[type=email]',email);await p.fill('#fe input[type=password]','senhaTeste123');await p.click('#fe button[type=submit]');await p.waitForTimeout(5000);
 log('login SBU:',await p.evaluate(()=>window.SBU&&window.SBU.id||null));
 log('tela apos login:',(await p.textContent('#app')).replace(/\s+/g,' ').slice(0,160));await p.screenshot({path:'out/login.png'});
 log('responsavel no estado:',await p.evaluate(()=>i.parent||i.resp||Object.keys(i)));
 await p.evaluate(()=>{i.e2e='ok';n()});await p.waitForTimeout(2500);
 log('estado no banco:',await p.evaluate(async()=>{const r=await SB.from('estado').select('dados').eq('user_id',SBU.id);return r.error?r.error.message:(r.data[0]&&r.data[0].dados.e2e)}));
 log('perfil:',await p.evaluate(async()=>{const r=await SB.from('perfis').select('grupo,papel').eq('id',SBU.id);return r.data||r.error}));
 log('outros perfis visiveis (deve ser 1):',await p.evaluate(async()=>{const r=await SB.from('perfis').select('id');return r.data&&r.data.length}));
 log('pedidos visiveis p/ familia (deve ser 0):',await p.evaluate(async()=>{const r=await SB.from('pedidos').select('id');return r.data?r.data.length:r.error.message}));
 // novo aparelho: limpa local e entra de novo
 await p.evaluate(async()=>{await SB.auth.signOut()});await p.evaluate(()=>{try{localStorage.clear()}catch(e){}});await p.reload();await p.waitForTimeout(4000);
 await p.click('[data-go=entrar]');await p.waitForSelector('#fe');await p.fill('#fe input[type=email]',email);await p.fill('#fe input[type=password]','senhaTeste123');await p.click('#fe button[type=submit]');await p.waitForTimeout(5000);
 log('outro aparelho e2e recuperado:',await p.evaluate(()=>i.e2e));
 await p.reload();await p.waitForTimeout(5000);log('reload mantem sessao:',await p.evaluate(()=>!!window.SBU),await p.evaluate(()=>i.e2e));
 await p.evaluate(async()=>{await SB.auth.signOut()});await p.evaluate(()=>{try{localStorage.clear()}catch(e){}});await p.reload();await p.waitForTimeout(4000);
 await p.click('[data-go=espera]');await p.waitForSelector('#fw');
 for(const el of await p.$$('#fw input')){const t=await el.getAttribute('type');if(t==='email')await el.fill(`e2e.espera.${TS}@iaih.app`);else if(t==='tel')await el.fill('11988887777');else if(t==='checkbox')await el.check();else await el.fill('Teste Espera')}
 const sel=await p.$('#fw select');if(sel)await sel.selectOption('11');
 await p.click('#fw button[type=submit]');await p.waitForTimeout(3000);log('espera tela:',(await p.textContent('#app')).replace(/\s+/g,' ').slice(0,150));
 await p.screenshot({path:'out/espera.png'});
 // admin page carrega
 const a=await b.newPage();a.on('pageerror',e=>log('ERRO admin',e.message));await a.goto('http://localhost:8080/admin.html');await a.waitForTimeout(3000);
 log('admin:',(await a.textContent('#app')).replace(/\s+/g,' ').slice(0,120));
}catch(e){log('FALHA',e.message)}
fs.writeFileSync('out/log.txt',L.join('\n'));await b.close()})();
