const {chromium}=require('playwright');const fs=require('fs');
const COD=process.env.COD,TS=Date.now();const L=[];const log=(...a)=>{const s=a.map(x=>typeof x==='string'?x:JSON.stringify(x)).join(' ');console.log(s);L.push(s)};
(async()=>{fs.mkdirSync('out',{recursive:true});const b=await chromium.launch();
try{
 // 1. landing
 let p=await b.newPage({viewport:{width:390,height:844}});p.on('pageerror',e=>log('ERRO landing',e.message));
 await p.goto('http://localhost:8080/site/index.html');await p.waitForTimeout(2500);
 log('vagas:',await p.textContent('#vagas'));
 await p.fill('#fbeta [name=nome]','Teste E2E Landing');await p.fill('#fbeta [name=email]',`e2e.landing.${TS}@iaih.app`);
 await p.fill('#fbeta [name=whatsapp]','11999990000');await p.selectOption('#fbeta [name=idade]','10');await p.check('#fbeta [name=ok]');
 await p.click('#fbeta button');await p.waitForTimeout(3000);
 log('landing ok visivel:',await p.isVisible('#bok'),'erro:',await p.isVisible('#ber')?await p.textContent('#ber'):'');
 await p.locator('#beta').screenshot({path:'out/landing.png'});await p.close();
 // 2. app: codigo invalido
 p=await b.newPage({viewport:{width:390,height:844}});p.on('pageerror',e=>log('ERRO app',e.message));
 p.on('console',m=>{if(m.type()==='error')log('console',m.text())});
 await p.goto('http://localhost:8080/index.html');await p.waitForSelector('#f1',{timeout:15000});
 const email=`e2e.app.${TS}@iaih.app`;
 await p.fill('#cod','IAIH-AAAAA');await p.fill('#nome','Teste E2E');await p.fill('#email',email);await p.fill('#senha','senhaTeste123');await p.check('#maior');
 await p.click('#f1 button[type=submit]');await p.waitForTimeout(3000);log('codigo invalido ->',await p.textContent('#e1'));
 // 3. cadastro valido
 await p.fill('#cod',COD);await p.click('#f1 button[type=submit]');await p.waitForTimeout(6000);
 log('apos cadastro e1:',await p.isVisible('#e1')?await p.textContent('#e1'):'(sem erro)');
 log('SBU:',await p.evaluate(()=>window.SBU&&window.SBU.id||null));
 log('tela:',(await p.textContent('#app')).replace(/\s+/g,' ').slice(0,200));
 await p.screenshot({path:'out/app_cadastro.png'});
 if(await p.evaluate(()=>!!window.SBU)){
  await p.evaluate(()=>{i.e2e='ok';n()});await p.waitForTimeout(2500);
  log('estado no banco:',await p.evaluate(async()=>{const r=await SB.from('estado').select('dados').eq('user_id',SBU.id);return r.error?r.error.message:(r.data[0]&&r.data[0].dados.e2e)}));
  log('perfil:',await p.evaluate(async()=>{const r=await SB.from('perfis').select('grupo,papel,nome').eq('id',SBU.id);return r.data||r.error}));
  await p.reload();await p.waitForTimeout(5000);log('apos reload SBU:',await p.evaluate(()=>window.SBU&&window.SBU.id||null),'e2e:',await p.evaluate(()=>i.e2e));
  // 4. sair e entrar
  await p.evaluate(async()=>{await SB.auth.signOut()});await p.evaluate(()=>{try{localStorage.clear()}catch(e){}});await p.reload();await p.waitForTimeout(4000);
  await p.click('[data-go=entrar]');await p.waitForSelector('#fe');
  await p.fill('#fe input[type=email]',email);await p.fill('#fe input[type=password]','senhaTeste123');await p.click('#fe button[type=submit]');await p.waitForTimeout(5000);
  log('login SBU:',await p.evaluate(()=>window.SBU&&window.SBU.id||null),'e2e recuperado:',await p.evaluate(()=>i.e2e));
  await p.screenshot({path:'out/app_login.png'});
  // 5. lista de espera
  await p.evaluate(async()=>{await SB.auth.signOut()});await p.evaluate(()=>{try{localStorage.clear()}catch(e){}});await p.reload();await p.waitForTimeout(4000);
  await p.click('[data-go=espera]');await p.waitForSelector('#fw');
  const f=await p.$$('#fw input');log('campos espera:',f.length);
  await p.fill('#fw input[type=email]',`e2e.espera.${TS}@iaih.app`);
  for(const el of f){const t=await el.getAttribute('type');if(!t||t==='text'){if(!(await el.inputValue()))await el.fill('Teste Espera')}if(t==='tel')await el.fill('11988887777');if(t==='checkbox')await el.check()}
  const sel=await p.$('#fw select');if(sel)await sel.selectOption('11');
  await p.click('#fw button[type=submit]');await p.waitForTimeout(3000);log('espera tela:',(await p.textContent('#app')).replace(/\s+/g,' ').slice(0,150));
 }
 await p.close();
}catch(e){log('FALHA',e.message)}
fs.writeFileSync('out/log.txt',L.join('\n'));await b.close()})();
