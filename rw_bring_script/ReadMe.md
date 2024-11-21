
Hogyan működik a script?

/bring [ID]: Ha egy adminisztrátor használja a parancsot egy érvényes ID-vel, akkor a megadott játékos teleportálásra kerül a parancsot kiadó játékoshoz.
/bringall: Minden játékos, aki nem a parancsot kiadó játékos, teleportálásra kerül a parancsot kiadó játékoshoz.
/back [ID]: A parancsot kiadó admin visszateleportálja a játékost (ID alapján) a legutolsó helyére.
/backall: Az admin visszateleportálja az összes játékost a legutolsó pozíciójukra.
Jogosultságok: A parancsok csak azoknak a játékosoknak érhetők el, akik az adminisztrátor csoportokban szerepelnek PL: (admin, superadmin, owner). ezt lehet editelni vagy hozá irni


1. Webhook URL beállítása
A webhook URL-t a Discord szervereden kell létrehoznod. Itt található a lépésről lépésre történő útmutató:

Discord Webhook URL létrehozása
Nyisd meg a Discord szervert, amelyre szeretnéd, hogy a logok érkezzenek.
Kattints a csatornára, amelyhez szeretnéd beállítani a webhookot (pl. egy adminisztrátori log csatorna).
Kattints a fogaskerék ikonra (csatorna beállítások) a csatorna neve mellett.
A bal oldali menüben válaszd a Integrations (Integrációk) lehetőséget.
Az Integrációk alatt keresd meg a Webhooks szekciót, és kattints a Create Webhook gombra.
Adj neki egy nevet (pl. Admin Logs), és válaszd ki, hogy melyik csatornába küldje a webhookot.
Kattints a Copy Webhook URL gombra, hogy lemásold az URL-t, amelyet majd a scriptbe kell beilleszteni.
Webhook URL hozzáadása a scripthez
Miután megvan a webhook URL, ezt kell beillesztened a scriptbe. A következő kódrészletet a server.lua fájlban találod meg.

Keresd meg ezt a részt a scriptben, és illeszd be a saját Discord webhook URL-edet:

local webhookURL = "https://discord.com/api/webhooks/YOUR_WEBHOOK_URL"


Tesztelés:

Töltsd fel a scriptet a resources mappába.
Add hozzá a start bring_command sort a server.cfg fájlhoz.
Indítsd el a szervert, és teszteld a parancsokat.

