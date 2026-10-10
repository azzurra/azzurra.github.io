---
title: "IRC Help"
lead: "La guida ai comandi dei servizi di Azzurra e del server IRC: scegli un servizio, apri il comando che ti serve."
translationKey: page-irc-help
layout: irchelp
---

*Guida originale di Laura ^Norad^ Tommasini, sezione Mask di City_Hunter, aggiornamento di Delphino (Help v2.6, 2007). Revisione 2026 a cura dello staff di Azzurra.*

> [!WARNING]
> **N.B.** Nei comandi non dovranno mai essere usate le parentesi quadre, che racchiudono un parametro opzionale. Le opzioni separate dal carattere `|` (ad esempio `ON|OFF`) indicano che si dovrà scrivere `ON` oppure `OFF`.

Le parti di comando indicate in MAIUSCOLO, così come `/msg NickServ`, `/msg ChanServ` ecc., non devono essere modificate.

È possibile abbreviare i comandi `/msg NickServ`, `/msg ChanServ`, `/msg MemoServ`, `/msg SeenServ`, `/msg StatServ`, `/msg HelpServ` con i comandi `/NickServ`, `/ChanServ`, `/MemoServ`, `/SeenServ`, `/StatServ`, `/HelpServ` oppure con i comandi `/ns`, `/cs`, `/ms`, `/ss`, `/st`, `/hs` rispettivamente, ottenendo lo stesso identico risultato a meno di problemi specifici del client o dello script usato.

Nel caso che il comando abbreviato dia risultati inattesi o incomprensibili è consigliabile usare il comando esteso.

## I comandi di NickServ

NickServ permette a chiunque di registrare il proprio nickname, il che assicura che esso potrà essere utilizzato solo ed esclusivamente dal suo proprietario mediante l'inserimento di una password scelta al momento della registrazione.

I nickname a cui non viene effettuato accesso per un periodo di 3650 giorni (dieci anni) (con identificazione) sono automaticamente cancellati dal sistema.

Un nickname registrato può essere nelle liste (come Founder, CF, SOP, AOP, HOP, VOP) di massimo 40 canali.

- **ACC** - Mostra il livello di accesso
- **ACCESS** - Gestione lista accessi
- **AUTH** – Autorizzazione del nickname
- **DROP** - Cancella la registrazione
- **GHOST** - Termina connessioni "fantasma"
- **HELP** – Help on-line del servizio NickServ
- **IDENTIFY** - Identifica come possessore del nickname
- **INFO** - Informazioni su un nickname registrato
- **LISTCHANS** - Mostra i canali a cui l'utente ha accesso
- **RECOVER** - Scollega qualcuno che stia usando il nickname
- **REGISTER** - Registra il nickname
- **RELEASE** - Rilascia un nickname protetto dai servizi
- **SET** - Imposta vari parametri

Per maggiori informazioni, una volta connessi alla rete IRC, digitare: `/msg NickServ HELP`

### NickServ - ACC

Ad ogni utente che stia utilizzando un nickname è assegnato un livello di accesso, come descritto nella tabella seguente. Per conoscere il livello di accesso di un utente ad un dato nickname si usa il comando ACC.

**Sintassi:**

```text
/msg NickServ ACC nickname
```

I seguenti valori sono le risposte di NickServ:

| Valore | Significato |
|:------:|-------------|
| 0 | Il nickname specificato non è registrato |
| 1 | Nickname registrato ma l’utente non lo sta utilizzando |
| 2 | L'utente non si è identificato |
| 3 | L'utente si è identificato tramite immissione della password |
| 4 | L'utente è collegato con una mask presente nella lista accessi |
| 5 | Il nick specificato è bloccato e non può essere usato |
| 6 | Il nick specificato è proibito e non può essere usato |

**Esempio:**

```text
/msg NickServ ACC ^Norad^
```

### NickServ - ACCESS

Questo comando si utilizza per gestire la Lista Accessi del nickname. In pratica serve ad aggiungere o rimuovere dalla lista delle maschere nel formato user@host (è possibile utilizzare i "caratteri jolly", come l'asterisco * e il ?). Tutti gli utenti il cui username e hostname corrisponderanno alla maschera specificata non saranno costretti a fornire la password per utilizzare il nickname. Ciò NON significa però che essi sono identificati per tale nickname, quindi ChanServ dà l’op nei canali in cui il nick è registrato (a patto che nel canale non vi sia l'opzione IDENT attivata) e si potranno leggere i memo, ma per apportare modifiche ai propri settaggi occorrerà fornire la password con il comando IDENTIFY.

È possibile inserire un massimo di 5 maschere in access list.

È necessario identificarsi prima di poter usare questo comando.

**Sintassi:**

```text
/msg NickServ ACCESS ADD user@host
/msg NickServ ACCESS DEL user@host
/msg NickServ ACCESS LIST
/msg NickServ ACCESS WIPE
```

ADD aggiunge una mask alla Access list.

DEL cancella una mask dalla Access list.

LIST visualizza le mask presenti nella Access list.

WIPE cancella tutte le mask presenti nella Access list.

**Esempi:**

```text
/msg NickServ ACCESS ADD capoz@*.aruba.it
/msg NickServ ACCESS DEL manu@*.jnet.it
/msg NickServ ACCESS WIPE
/msg NickServ ACCESS LIST
```

Per problemi nel determinare le maschere, consultare la sezione Maschere di riconoscimento o rivolgersi ad un operatore su #IRCHelp.

### NickServ - AUTH

Il comando AUTH serve per il completamento della registrazione del nick; a seguito della registrazione del nick con il comando REGISTER, si riceve, all'indirizzo specificato, una mail con un codice numerico da applicare a questo comando al fine di sbloccare l'accesso alle funzioni di settaggio di NickServ per quel nick, di registrazione di canali e di invio di Memo.

**Sintassi:**

```text
/msg NickServ AUTH codice
```

**Esempio:**

```text
/msg NickServ AUTH 1757420068
```

### NickServ - DROP

Con questo comando si cancella la registrazione del nickname specificato: ciò significa che esso tornerà disponibile a tutti gli utenti. Verranno inoltre droppati tutti i canali in cui il nick risulta founder, se non è stato impostato un SUCCESSOR. È necessario essere identificati (con il comando IDENTIFY) per il nickname che si desidera cancellare prima di utilizzare questo comando.

Verrà inviato un codice di conferma via E-Mail all'indirizzo specificato al momento della registrazione, che dovrà essere inserito entro 24 ore come scritto sulla E-Mail per confermare la cancellazione del nick.

La richiesta di drop può essere cancellata con il parametro UNDO.

L’uso è limitato ad una sola volta al giorno.

**Sintassi:**

```text
/msg NickServ DROP nickname
/msg NickServ DROP nickname codice
/msg NickServ DROP nickname UNDO
```

**Esempi:**

```text
/msg NickServ DROP mirtilla86
/msg NickServ DROP mirtilla86 1757420068
/msg NickServ DROP ^^Mauro^^ UNDO
```

### NickServ - GHOST

A volte può capitare che, magari a causa di una qualità della connessione scadente, si venga sconnessi dal server IRC e, nonostante il proprio client sia stato scollegato, il server non abbia ricevuto correttamente il comando QUIT e quindi non abbia rilasciato il nickname utilizzato. Di conseguenza alla propria riconnessione non sarà possibile utilizzare il vecchio nickname finché il server non si accorgerà che la connessione precedente non è più attiva. Il comando GHOST di NickServ permette di accelerare l'operazione comunicando al server che quella connessione non è più attiva, e rendendo di nuovo disponibile il nickname.

Non è questo il comando da utilizzare per disconnettere un utente che stia usando il proprio nick; in quel caso si utilizza RECOVER.

**Sintassi:**

```text
/msg NickServ GHOST nickname password
```

**Esempio:**

```text
/msg NickServ GHOST Cleo^ 19851208
```

### NickServ - HELP

È il comando per ottenere help on-line sul servizio NickServ.

**Sintassi:**

```text
/msg NickServ HELP [comando]
```

**Esempi:**

```text
/msg NickServ HELP
/msg NickServ HELP REGISTER
/msg NickServ HELP SET LANG
```

### NickServ – IDENTIFY (o ID o IDENT)

Questo comando (alias di `/PASS`) permette di fornire a NickServ la password per il nickname che si sta utilizzando. Ciò è necessario per identificarsi come proprietari del nickname correntemente in uso.

**Sintassi:**

```text
/msg NickServ IDENTIFY password
```

oppure

```text
/msg NickServ ID password
```

oppure

```text
/msg NickServ IDENT password
```

oppure

```text
/PASS password
```

È possibile anche identificarsi ad un nick pur utilizzandone un altro. In questo modo è possibile essere oppati da Chanserv nei canali di cui si è nelle liste.

Non c’è un limite di nick a cui si può essere identificati contemporaneamente. Ad esempio, se si hanno due nick registrati, è possibile identificarsi ad entrambi e quindi avere accesso ai comandi di ChanServ per tutti i canali di cui si è nelle liste con almeno uno dei due nick.

**Sintassi:**

```text
/msg NickServ IDENTIFY nickname password_del_nick
```

**Esempi:**

```text
/msg NickServ IDENTIFY 20030303
/msg NickServ IDENT 08051973
/msg NickServ ID Casper 12AB56cd
/pass carota
```

### NickServ - INFO

Utilizzando questo comando si ottengono informazioni ulteriori su un nickname registrato, come la data di registrazione o l'ultima volta che è stato utilizzato.

**Sintassi:**

```text
/msg NickServ INFO nickname
```

**Esempio:**

```text
/msg NickServ INFO ^Norad^
```

### NickServ - LISTCHANS

Mostra la lista dei canali a cui il nick che stai usando ha accesso. Verranno visualizzati i canali in cui sei VOP, HOP, AOP, SOP, CF o Founder. N.B. è possibile essere aggiunti alle liste di un massimo di 40 canali, compresi quelli di cui si è Founder.

**Sintassi:**

```text
/msg NickServ LISTCHANS
```

**Esempio:**

```text
/msg NickServ LISTCHANS
```

### NickServ - RECOVER

Questo comando permette di recuperare immediatamente il proprio nick se risulta in uso da parte di un altro utente. NickServ cambia il nick dell’utente in questione in GuestXXXXX, cosa che farebbe automaticamente se l'opzione KILL fosse attiva. Per poter utilizzare questo comando è necessario conoscere la password del nick che si vuole recuperare.

**Sintassi:**

```text
/msg NickServ RECOVER nickname password
```

**Esempio:**

```text
/msg NickServ RECOVER Casper 12AB56cd
```

### NickServ - REGISTER

Questo è il comando da utilizzare per registrare il proprio nickname.

Registrare un nick permette di sfruttare a pieno il servizio NickServ. Risulta possibile, fra le altre cose, recuperare immediatamente il proprio nick nel caso risultasse in uso da parte di altri, registrare canali, inviare memo etc.

Al momento della registrazione viene inviata una E-Mail contenente un codice di autorizzazione che deve essere inserito, entro 24 ore, per confermare la registrazione del nick. Le istruzioni al riguardo sono contenute nella E-Mail stessa. I nick non autorizzati entro 24 ore scadono.

Il nick viene settato +r solo dopo l’autorizzazione.

La password deve essere una stringa di un numero di caratteri compreso tra 5 e 32, senza codici di controllo e spazi, e non può essere uguale al nick per motivi di sicurezza. È inoltre sconsigliato usare come password il proprio nome, in quanto spesso troppo facile da indovinare.

È ovviamente indispensabile che l’indirizzo E-mail sia valido al momento della registrazione, per poter ricevere il codice di autorizzazione. L'indirizzo E-Mail è necessario sia per lo staff, per riconoscerti o contattarti in caso di bisogno, sia per te, nel caso ti dimenticassi la password del tuo nick o di un canale di cui sei Founder e la richiedessi in mail.

N.B.: L'indirizzo E-Mail fornito alla registrazione NON è visibile dagli utenti normali, a meno che non lo si desideri. La frase `* Questo nick e' stato autorizzato tramite: indirizzo@email` nelle INFO del nick è visibile solo dall’utente identificato al nick. L’indirizzo può essere reso visibile mediante il comando `/msg NickServ SET EMAIL SHOW` e nascosto col comando `/msg NickServ SET EMAIL HIDE`.

La registrazione di un nick può essere cancellata mediante il comando DROP.

**Sintassi:**

```text
/msg NickServ REGISTER password indirizzo@email
```

**Esempi:**

```text
/msg NickServ REGISTER 12AB56cd antonio.rossi@libero.it
/msg NickServ REGISTER g3j39sew66 mario.bianchi@tin.it
```

### NickServ - RELEASE

Se non ci si identifica entro il tempo stabilito ad un nick che ha l’opzione KILL abilitata, NickServ cambia il nickname in GuestXXXXX e custodisce il nickname in questione per 5 minuti, il che significa che nessuno potrà utilizzarlo.

Un `/whois` di questo tipo:

```text
nick is enforcer@azzurra.chat * Nick Protection Enforcement
nick using services.azzurra.chat Azzurra IRC Services
nick End of /WHOIS list.
```

sta appunto a significare che nick è custodito dai servizi.

Il comando RELEASE permette al proprietario di rendere il suo nickname immediatamente disponibile per poi utilizzarlo.

**Sintassi:**

```text
/msg NickServ RELEASE nickname password
```

**Esempio:**

```text
/msg NickServ RELEASE Mirtilla 12AB56cd
```

### NickServ - SET

Questo comando permette di settare varie opzioni o attivare particolari funzioni per la gestione del proprio nickname.

- **EMAIL** - Permette di gestire l’indirizzo E-mail associato al proprio nick.

  Specificando una nuova E-Mail è possibile chiedere un cambio dell'indirizzo. Una E-Mail contenente il codice di registrazione verrà inviata al vecchio indirizzo e sarà necessario inserire il codice tramite il comando AUTH per confermare il cambio. Nel caso in cui il vecchio indirizzo non sia più valido, o sia sbagliato, il cambio verrà effettuato automaticamente dopo un periodo di 7 giorni durante il quale sarà possibile cancellare la richiesta con il comando UNDO per impedire il cambio.

  L’uso di questo comando è limitato ad una sola volta al giorno, per quanto riguarda la modifica dell’indirizzo E-mail.

  ATTENZIONE: La validità del nuovo indirizzo non sarà controllata; è nel proprio interesse inserire un indirizzo E-Mail valido, in quanto se ci dovessero essere problemi con il nick, o venisse dimenticata la password, non sarebbe possibile ricevere alcun aiuto se l'indirizzo E-Mail non fosse valido.

  Sintassi:

  ```text
  /msg NickServ SET EMAIL nuovo_indirizzo@email
  /msg NickServ SET EMAIL AUTH codice
  /msg NickServ SET EMAIL SHOW|HIDE|UNDO
  ```

  HIDE nasconde l'indirizzo E-Mail a chiunque chieda un INFO sul nick.

  SHOW rende l'indirizzo E-Mail visibile a chiunque chieda un INFO sul nick.

  UNDO cancella la richiesta di cambio indirizzo.

  Esempi:

  ```text
  /msg NickServ SET email norad@azzurra.chat
  /msg NickServ SET EMAIL AUTH 1757420068
  /msg NickServ SET EMAIL SHOW
  /msg NickServ SET EMAIL UNDO
  ```

- **KILL** - Gli utenti non in Access List verranno forzati ad inserire la password entro un tempo stabilito dal parametro scelto.

  Attiva l'opzione Enforced del nick. Se un qualsiasi altro utente prova ad usare il tuo nick quando non ci sei, gli verrà dato un tempo limitato per cambiare nick, dopodiché gli verrà cambiato a forza in GuestXXXXX. Questa opzione viene abilitata di default alla registrazione del nick, con parametro SLOW.

  SLOW (alias di ON) imposta un conto alla rovescia di 60 secondi.\
  NORMAL imposta un conto alla rovescia di 20 secondi.\
  FAST imposta un conto alla rovescia di 5 secondi.

  Sintassi:

  ```text
  /msg NickServ SET KILL SLOW|NORMAL|FAST|OFF
  ```

  Esempi:

  ```text
  /msg NickServ SET KILL FAST
  /msg NickServ SET KILL OFF
  /msg NickServ SET KILL ON
  ```

- **LANG** - Cambia la lingua usata dai servizi per inviare messaggi, come ad esempio le risposte ai comandi usati.

  N.B.: Non è necessario avere un nick registrato per usare questo comando. Tuttavia, nel caso il nick non sia registrato, il cambiamento di lingua dovrà essere ripetuto ad ogni connessione.

  Per ottenere l’elenco delle lingue disponibili bisogna specificare LIST come numero.

  Sintassi:

  ```text
  /msg NickServ SET LANG numero
  /msg NickServ SET LANG LIST
  ```

  Esempio:

  ```text
  /msg NickServ SET LANG 1
  ```

- **NEVEROP** - Fa in modo che ChanServ non ti oppi automaticamente quando entri in un canale in cui sei registrato su una delle liste.

  Verrai inoltre deoppato da ChanServ ogni qual volta un altro utente provi ad opparti. L'unico modo per avere l'op quando NEVEROP è attivo è usare il comando OP di ChanServ.

  Sintassi:

  ```text
  /msg NickServ SET NEVEROP ON|OFF
  ```

  Esempio:

  ```text
  /msg NickServ SET NEVEROP ON
  ```

- **NOCHANMEMO** - Se attivato, blocca la ricezione di tutti e soli i memo inviati a canali a cui si è in lista, ad eccezione di quelli di cui si è founder.

  Sintassi:

  ```text
  /msg NickServ SET NOCHANMEMO ON|OFF
  ```

  Esempio:

  ```text
  /msg NickServ SET NOCHANMEMO OFF
  ```

- **NOMEMO** - Se attivato non permette ad altri utenti di mandarti alcun memo.

  Potrai comunque continuare a mandare memo ad altri utenti anche con l'opzione NOMEMO attiva.

  Sintassi:

  ```text
  /msg NickServ SET NOMEMO ON|OFF
  ```

  Esempio:

  ```text
  /msg NickServ SET NOMEMO ON
  ```

- **NOOP** - Non permette ad altri utenti di aggiungerti a nessuna lista (VOP, HOP, AOP, SOP, CF) di alcun canale.

  Questo comando non ti cancellerà da eventuali liste in cui sei stato aggiunto in precedenza.

  Sintassi:

  ```text
  /msg NickServ SET NOOP ON|OFF
  ```

  Esempio:

  ```text
  /msg NickServ SET NOOP ON
  ```

- **NOWELCOME** - Permette, se attivata, di non ricevere nessun Welcome Message al join di un canale registrato, anche se il founder lo ha impostato.

  Sintassi:

  ```text
  /msg NickServ SET NOWELCOME ON|OFF
  ```

  Esempio:

  ```text
  /msg NickServ SET NOWELCOME OFF
  ```

- **PASSWD** - Permette di cambiare la password del nick che stai usando al momento in cui usi il comando.

  Sintassi:

  ```text
  /msg NickServ SET PASSWD vecchia_pass nuova_pass
  ```

  Esempio:

  ```text
  /msg NickServ SET PASSWD 030574 ab98df3DD4
  ```

- **SECURE** - Attiva l'opzione Secure per il tuo nick.

  Con Secure settata, NickServ non terrà più in considerazione la tua Access list; dovrai quindi identificarti al tuo nick con la tua password ogni volta che ti colleghi.

  Sintassi:

  ```text
  /msg NickServ SET SECURE ON|OFF
  ```

  Esempio:

  ```text
  /msg NickServ SET SECURE ON
  ```

- **URL** - Permette di associare un URL al nick specificato.

  Questo URL è quello che risulterà ad ogni utente che richieda le informazioni del nick tramite il comando INFO.

  Per rimuovere l'URL corrente bisogna specificare NONE come indirizzo.

  Sintassi:

  ```text
  /msg NickServ SET URL indirizzo
  ```

  Esempio:

  ```text
  /msg NickServ SET URL http://www.garzantilinguistica.it/
  ```

### Lingue disponibili

Queste sono le lingue disponibili per il settaggio LANG di NickServ e ChanServ:

| Numero | Lingua |
|:------:|--------|
| 1 | Italiano |
| 2 | Inglese |
| 3 | Spagnolo |
| 4 | Francese |

## I comandi di ChanServ

ChanServ consente a chiunque abbia registrato e autorizzato il proprio nickname con NickServ di registrare il proprio canale, in modo da poterlo gestire completamente senza bisogno di un BOT.

Il Founder viene automaticamente oppato da ChanServ quando entra nel canale, e ha accesso a tutti i comandi e può gestire le liste CF, SOP, AOP, HOP, VOP, AKICK, ed anche bloccarle con l’opzione LOCK dei vari comandi.

Può inoltre oppare (rendere operatori) utenti non in lista anche se il canale è settato con OpGuard ON.

I canali scadono automaticamente se nessun operatore delle liste accede al canale entro 3650 giorni (dieci anni) con il nick identificato oppure se scade il nick del Founder, a meno che non sia stato settato un successor.

Nelle liste di un canale possono esserci al massimo 500 tra VOP, HOP, AOP, SOP e CF e 300 AKICK

- **AKICK** - Gestione lista ban permanenti
- **AOP** - Gestione lista AutoOp
- **CFOUNDER** - Gestione lista CoFounder
- **COUNT** - Mostra quanti utenti sono presenti sulle liste del canale
- **DEHALFOP** - Rimuove lo stato di halfop ad un utente
- **DEOP** - Rimuove lo stato di operatore ad un utente
- **DEVOICE** - Rimuove la possibilità di parlare su canali moderati
- **DROP** - Cancella la registrazione del canale
- **HALFOP** - Conferisce lo stato di halfop ad un utente
- **HELP** – Help on-line del servizio ChanServ
- **HOP** - Gestione lista AutoHalfOp
- **IDENTIFY** - Identifica un utente come fondatore
- **INFO** - Mostra ulteriori informazioni del canale
- **INVITE** - Invita se stessi in un canale a solo invito
- **MDEHALFOP** - Rimuove tutti gli halfop del canale
- **MDEOP** - Rimuove tutti gli operatori del canale
- **MDEVOICE** - Rimuove tutti i voice del canale
- **MKICK** - Kickbanna tutti gli utenti dal canale
- **MODE** - Cambia le modalità (modes) del canale
- **OP** - Conferisce lo stato di operatore ad un utente
- **REGISTER** - Registra un canale
- **REMOVE** - Permette di togliersi dalle liste di un canale
- **RESETMODES** - Azzera tutti i Channel Mode impostati nel canale
- **SET** - Permette di cambiare le impostazioni del canale
- **SOP** - Gestione lista SuperOp
- **UNBAN** - Rimozione ban dal canale
- **VOICE** - Conferisce voce ad un utente su un canale moderato
- **VOP** - Gestione lista VoiceOp
- **WHY** - Illustra perché un utente è operatore sul canale specificato

Per maggiori informazioni, una volta connessi alla rete IRC, digitare: `/msg ChanServ HELP`

### ChanServ - AKICK

Questo comando permette, a chi è almeno SOP, e se la lista non è bloccata dal Founder con il comando LOCK, di inserire nick registrati e maschere nel formato nick!user@host nella lista AutoKick del canale. Si tratta praticamente di ban permanenti, non diversi nel settaggio dal comando `/MODE canale +b`. Chiunque sia identificato ad un nick presente nella lista oppure abbia una maschera contenuta o simile a quella specificata (i "caratteri jolly", * e ?, sono ammessi) verrà subito espulso dal canale e bannato da ChanServ.

**Sintassi:**

```text
/msg ChanServ AKICK #canale ADD nick|mask [bantype] [ragione]
/msg ChanServ AKICK #canale DEL mask|numero
/msg ChanServ AKICK #canale LIST [mask]
/msg ChanServ AKICK #canale WIPE
/msg ChanServ AKICK #canale LOCK [mask]
/msg ChanServ AKICK #canale UNLOCK [mask]
```

ADD aggiunge il nick o la mask specificata alla AutoKick list. Se viene specificato un nick non registrato, verrà aggiunta la mask `nick!*@*`.

È possibile specificare il tipo di ban da applicare agli utenti che entrano e rispecchiano la mask posta in Akick, in tal caso verranno riconosciuti secondo la mask messa in akick, ma il ban verrà impostato secondo il bantype scelto. Se non viene specificato questo parametro, verrà bannata la mask messa in akick. Nel caso sia un nick registrato ad essere in akick, la persona verrà bannata anche se utilizza un altro nick, ma è identificata al nick in akick list. In questo caso il ban risulterà di default con bantype 2 (`*!*@host`) a meno che non ne venga specificato uno diverso nel comando stesso, o non sia stato impostato un bantype diverso con SET BANTYPE .

Se viene specificata una ragione (max 200 caratteri, compresi i codici di controllo colore ecc.), questa verrà usata come ragione al momento del kick, altrimenti verrà usata quella di default: "Sei bannato da questo canale".

Il limite massimo di nick e mask presenti nella lista AutoKick è di 300.

DEL rimuove la mask o il numero (relativo alla lista) specificato dalla AutoKick list. Non toglie però eventuali ban messi da ChanServ in seguito ad AutoKick precedenti; questi ultimi vanno rimossi manualmente.

LIST visualizza la lista completa delle AutoKick del canale, o eventualmente solo quelle che contengono la mask specificata.

WIPE cancella tutte le mask e i nick presenti nella AutoKick list.

LOCK blocca la lista, permettendo solo al founder di manipolarla. Se viene specificata una delle mask già in lista, verrà bloccata solo quella.

UNLOCK sblocca la lista, nel caso fosse stata bloccata col comando LOCK. Se viene specificata una mask, verrà sbloccata solo quella.

NOTA: sostituire a #canale il nome del canale su cui si desidera effettuare la modifica, ed al posto di mask la maschera del tipo nick!user@host da inserire.

La parte criptata dell’host (es.: Azzurra-18DD91B7) deve essere sostituita da * se si vuole che l’akick sia efficace in caso di IP dinamico. Se l'host da inserire contiene un trattino (-) oppure un segno di uguaglianza (=) come nell'host Azzurra-18DD91B7 sarà necessario sostituire il simbolo con un punto interrogativo (?) ottenendo ad esempio: `*!*@Azzurra?18DD91B7`. Nel caso non venisse applicata la sostituzione si riceverà l'errore `-ChanServ- La mask inserita non e' valida, o contiene caratteri non validi.`

**Esempi:**

```text
/msg ChanServ AKICK #IRCHelp ADD Saitta 3 Basta spammare!
/msg ChanServ AKICK #IRCHelp ADD *!*saitta@*.dialup.tiscali.it
/msg ChanServ AKICK #IRCHelp DEL *!*pippo@*.carota.net
/msg ChanServ AKICK #IRCHelp LIST *saitta*
/msg ChanServ AKICK #IRCHelp WIPE
/msg ChanServ AKICK #IRCHelp LOCK Saitta
/msg ChanServ AKICK #IRCHelp UNLOCK *!*pippo@*.carota.net
```

Per problemi nel determinare le maschere, consultare la sezione Maschere di riconoscimento o rivolgersi ad un operatore su #IRCHelp.

### ChanServ - AOP

Questo comando serve a gestire la lista AutoOp (AOP) del canale. Gli AOP vengono automaticamente oppati da ChanServ quando entrano nel canale, possono dare il VOICE, l’HALFOP o l’OP a se stessi o ad altri utenti, usare DEVOICE, DEHALFOP e DEOP su se stessi e su altri utenti ed usare i comandi INVITE e UNBAN ME; non possono gestire le liste VOP, HOP, AOP, SOP, CF o AKICK. I SOP e i CoFounder possono aggiungere e togliere AOP, ma solo nel caso in cui la lista AOP non sia bloccata dal Founder con l’opzione LOCK.

È possibile inserire solo nickname registrati nella lista, a meno che l'opzione IDENT sia disabilitata, nel qual caso è possibile inserire anche delle maschere nel formato user@host o nick!user@host.

**Sintassi:**

```text
/msg ChanServ AOP #canale ADD nick|mask
/msg ChanServ AOP #canale DEL nick|mask|numero
/msg ChanServ AOP #canale LIST [mask]
/msg ChanServ AOP #canale FIND mask
/msg ChanServ AOP #canale CLEAN
/msg ChanServ AOP #canale EXPLIST
/msg ChanServ AOP #canale WIPE
/msg ChanServ AOP #canale LOCK [nick|mask]
/msg ChanServ AOP #canale UNLOCK [nick|mask]
```

ADD aggiunge la mask o il nick specificato alla Auto-Op list del canale. Se il nick o la mask sono già presenti in un'altra lista, il loro accesso verrà cambiato in AOP.

DEL cancella la mask o il nick specificato dalla Auto-Op list del canale, oppure la voce corrispondente al numero specificato.

LIST visualizza la lista completa degli Auto-Op del canale, o eventualmente solo quelli che contengono la mask specificata.

FIND ricerca gli elementi che rispecchiano la mask specificata (nel formato nick!user@host).

CLEAN cancella dalla Auto-Op list tutti i nick che risultano scaduti.

EXPLIST mostra i nick scaduti presenti nella lista Auto-Op.

WIPE cancella tutti i nick e le mask presenti nella Auto-Op list.

LOCK blocca la lista, permettendo solo al founder di manipolarla. Se viene specificata una delle mask già in lista, verrà bloccata solo quella.

UNLOCK sblocca la lista, nel caso fosse stata bloccata col comando LOCK. Se viene specificata una mask, verrà sbloccata solo quella.

NOTA: sostituire a #canale il nome del canale su cui si desidera effettuare la modifica, ed al posto di [nick|mask] il nick o la mask da inserire.

**Esempi:**

```text
/msg ChanServ AOP #irchelp ADD Casper
/msg ChanServ AOP #IRCHelp ADD *!*pippo@*.carota.net
/msg ChanServ AOP #IRCHelp DEL 2
/msg ChanServ AOP #IRCHelp FIND *!*@*.interbusiness.it
/msg ChanServ AOP #IRCHelp LIST *.it
/msg ChanServ AOP #irchelp LOCK ^{l4m3r}^
/msg ChanServ AOP #irchelp UNLOCK Rodolfo
```

Per problemi nel determinare le maschere, consultare la sezione Maschere di riconoscimento o rivolgersi ad un operatore su #IRCHelp.

### ChanServ – CFOUNDER (o CF)

Questo comando serve a gestire la lista CoFounder (CF) del canale. I CoFounder vengono automaticamente oppati da ChanServ quando entrano nel canale, e hanno accesso a tutti i comandi a cui ha accesso il Founder esclusi DROP, SET PASSWD, SET FOUNDER, SET NOMKICK, SET SUCCESSOR e SET MEMOLEVEL e possono gestire le liste VOP, HOP, AOP, SOP, AKICK (ma non la lista CF), se non sono bloccate dal Founder. Solo il Founder può modificare la lista CF.

Possono inoltre oppare utenti non in lista anche se il canale è settato con OpGuard ON.

È possibile inserire solo nickname registrati nella lista, a meno che l'opzione IDENT sia disabilitata, nel qual caso è possibile inserire anche delle maschere nel formato user@host o nick!user@host.

**Sintassi:**

```text
/msg ChanServ CFOUNDER #canale ADD nick|mask
/msg ChanServ CFOUNDER #canale DEL nick|mask|numero
/msg ChanServ CFOUNDER #canale LIST [mask]
/msg ChanServ CFOUNDER #canale FIND mask
/msg ChanServ CFOUNDER #canale CLEAN
/msg ChanServ CFOUNDER #canale EXPLIST
/msg ChanServ CFOUNDER #canale WIPE
```

ADD aggiunge la mask o il nick specificato alla Co-Founder list del canale. Se il nick o la mask sono già presenti in un'altra lista, il loro accesso verrà cambiato in Co-Founder.

DEL cancella la mask o il nick specificato dalla Co-Founder list del canale, oppure la mask o il nick corrispondenti al numero specificato.

LIST visualizza la lista completa dei Co-Founder del canale, o eventualmente solo quelli che contengono la mask specificata.

FIND ricerca gli elementi che rispecchiano la mask specificata (nel formato nick!user@host).

CLEAN cancella dalla Co-Founder list tutti i nick che risultano scaduti.

EXPLIST mostra i nick scaduti presenti nella lista Co-Founder.

WIPE cancella tutti i nick e le mask presenti nella Co-Founder list.

La lista CF non è ovviamente lockabile, essendo gestibile solo dal Founder.

NOTA: sostituire a #canale il nome del canale su cui si desidera effettuare la modifica, ed al posto di [nick|mask] il nick o la mask da inserire.

**Esempi:**

```text
/msg ChanServ CFOUNDER #irchelp ADD I_am_l4m3r
/msg ChanServ CFOUNDER #IRCHelp ADD *!*pippo@*.carota.net
/msg ChanServ CFOUNDER #IRCHelp DEL 3
/msg ChanServ CFOUNDER #IRCHelp LIST *pippo*
/msg ChanServ CFOUNDER #irchelp FIND *!*@*.carota.net
```

Per problemi nel determinare le maschere, consultare la sezione Maschere di riconoscimento o rivolgersi ad un operatore su #IRCHelp.

### ChanServ - COUNT

Mostra il numero di utenti in ognuna delle liste del canale nel seguente modo:

```text
Count di #canale: VOP: 2, HOP: 3, AOP: 11, SOP: 3, CF: 1, AKICK: 5
```

Bisogna essere almeno VOP per poter usare questo comando.

**Sintassi:**

```text
/msg ChanServ COUNT #canale
```

**Esempio:**

```text
/msg ChanServ COUNT #irchelp
```

### ChanServ - DEHALFOP

Rimuove lo stato di halfop di canale dall'utente specificato. Ciò non ha alcun effetto sulla lista HOP. È possibile specificare fino a 6 nick. Bisogna essere almeno HOP nel canale per poter usare questo comando su se stessi e minimo AOP per usarlo su altri.

**Sintassi:**

```text
/msg ChanServ DEHALFOP #canale nickname1 [nickname2] ... [nickname6]
```

**Esempi:**

```text
/msg ChanServ DEHALFOP #irchelp Alberto
/msg ChanServ DEHALFOP #irchelp Luca3 ^martina^ AnToNeLla
```

### ChanServ - DEOP

Rimuove lo stato di operatore di canale dall'utente specificato. Ciò non ha alcun effetto sulle liste AOP, SOP e CF. È possibile specificare fino a 6 nick. Bisogna essere almeno AOP nel canale per poter usare questo comando.

**Sintassi:**

```text
/msg ChanServ DEOP #canale nickname1 [nickname2] ... [nickname6]
```

**Esempi:**

```text
/msg ChanServ DEOP #irchelp Alberto
/msg ChanServ DEOP #irchelp Luca3 ^martina^ AnToNeLla
```

### ChanServ - DEVOICE

Rimuove la possibilità all'utente specificato di inviare testo su un canale moderato. Ciò non ha alcun effetto sulla lista VOP. È possibile specificare fino a 6 nick. Bisogna essere almeno VOP nel canale per poter usare questo comando su se stessi, e almeno HOP per poterlo usare sugli altri.

**Sintassi:**

```text
/msg ChanServ DEVOICE #canale nickname1 [nickname2] ... [nickname6]
```

**Esempi:**

```text
/msg ChanServ DEVOICE #irchelp Papero
/msg ChanServ DEVOICE #irchelp ^Bang^ [Roberto] Cucciola
```

### ChanServ - DROP

Questo comando permette di cancellare la registrazione per un dato canale. Per poter utilizzare questo comando è necessario essere identificati sia al nick del founder sia al canale con il comando IDENTIFY.

Verrà inviato un codice di conferma via E-Mail all'indirizzo specificato al momento della registrazione del nick dell'utente che risulta Founder, che va inserito entro 24 ore come scritto sulla E-Mail per confermare la cancellazione del canale.

È possibile cancellare una richiesta di DROP in corso con il parametro UNDO.

L’uso è limitato ad una sola volta al giorno.

**Sintassi:**

```text
/msg ChanServ DROP #canale
/msg ChanServ DROP #canale codice
/msg ChanServ DROP #canale UNDO
```

**Esempi:**

```text
/msg ChanServ DROP #irchelp
/msg ChanServ DROP #irchelp 1064149619
/msg ChanServ DROP #irchelp UNDO
```

### ChanServ - HALFOP

Questo comando conferisce lo stato di HalfOp all'utente specificato. Non ha alcun effetto sulla lista HOP. È possibile specificare fino a 6 nick. Bisogna essere almeno HOP nel canale per poter usare questo comando su se stessi, e almeno AOP per poterlo usare sugli altri.

**Sintassi:**

```text
/msg ChanServ HALFOP #canale nickname1 [nickname2] ... [nickname6]
```

**Esempi:**

```text
/msg ChanServ HALFOP #irchelp MaSCiA
/msg ChanServ HALFOP #irchelp Gino^ mirtilla2 ]Antonio[ _ZIP_
```

### ChanServ - HELP

È il comando per ottenere help on-line sul servizio ChanServ.

**Sintassi:**

```text
/msg ChanServ HELP [comando]
```

**Esempi:**

```text
/msg ChanServ HELP
/msg ChanServ HELP AOP
/msg ChanServ HELP SET MLOCK
```

### ChanServ - HOP

Questo comando serve a gestire la lista AutoHalfOp (HOP) del canale. Gli HOP vengono automaticamente halfoppati da ChanServ quando entrano nel canale, possono dare l’HALFOP a se stessi, il VOICE a se stessi o ad altri utenti, usare DEVOICE e DEHALFOP su se stessi e DEVOICE su altri utenti ed usare i comandi INVITE e UNBAN ME; non possono gestire le liste VOP, HOP, AOP, SOP, CF o AKICK. I SOP e i CoFounder possono aggiungere e togliere HOP, ma solo nel caso in cui la lista HOP non sia bloccata dal Founder con l’opzione LOCK.

È possibile inserire solo nickname registrati nella lista, a meno che l'opzione IDENT sia disabilitata, nel qual caso è possibile inserire anche delle maschere nel formato user@host o nick!user@host.

**Sintassi:**

```text
/msg ChanServ HOP #canale ADD nick|mask
/msg ChanServ HOP #canale DEL nick|mask|numero
/msg ChanServ HOP #canale LIST [mask]
/msg ChanServ HOP #canale FIND mask
/msg ChanServ HOP #canale CLEAN
/msg ChanServ HOP #canale EXPLIST
/msg ChanServ HOP #canale WIPE
/msg ChanServ HOP #canale LOCK [nick|mask]
/msg ChanServ HOP #canale UNLOCK [nick|mask]
```

ADD aggiunge la mask o il nick specificato alla Auto-HalfOp list del canale. Se il nick o la mask sono già presenti in un'altra lista, il loro accesso verrà cambiato in HOP.

DEL cancella la mask o il nick specificato dalla Auto-HalfOp list del canale, oppure la voce corrispondente al numero specificato.

LIST visualizza la lista completa degli Auto-HalfOp del canale, o eventualmente solo quelli che contengono la mask specificata.

FIND ricerca gli elementi che rispecchiano la mask specificata (nel formato nick!user@host).

CLEAN cancella dalla Auto-HalfOp list tutti i nick che risultano scaduti.

EXPLIST mostra i nick scaduti presenti nella lista Auto-HalfOp.

WIPE cancella tutti i nick e le mask presenti nella Auto-HalfOp list.

LOCK blocca la lista, permettendo solo al founder di manipolarla. Se viene specificata una delle mask già in lista, verrà bloccata solo quella.

UNLOCK sblocca la lista, nel caso fosse stata bloccata col comando LOCK. Se viene specificata una mask, verrà sbloccata solo quella.

NOTA: sostituire a #canale il nome del canale su cui si desidera effettuare la modifica, ed al posto di [nick|mask] il nick o la mask da inserire.

**Esempi:**

```text
/msg ChanServ HOP #irchelp ADD Casper
/msg ChanServ HOP #IRCHelp ADD *!*pippo@*.carota.net
/msg ChanServ HOP #IRCHelp DEL 2
/msg ChanServ HOP #IRCHelp LIST *.it
/msg ChanServ HOP #IRCHelp LIST *!*@*.interbusiness.it
/msg ChanServ HOP #irchelp LOCK ^{l4m3r}^
/msg ChanServ HOP #irchelp UNLOCK Rodolfo
```

Per problemi nel determinare le maschere, consultare la sezione Maschere di riconoscimento o rivolgersi ad un operatore su #IRCHelp.

### ChanServ – IDENTIFY ( o ID)

Serve ad identificarsi come fondatore del canale, qualora si stesse utilizzando un nickname differente rispetto a quello con cui è stata effettuata la registrazione.

Alcuni comandi, come DROP, SET FOUNDER, SET NOMKICK, necessitano l'identificazione a ChanServ con questo comando.

**Sintassi:**

```text
/msg ChanServ IDENTIFY #canale password
```

**Esempio:**

```text
/msg ChanServ IDENTIFY #irchelp h4rt34c330
/msg ChanServ IDENTIFY #irchelp zupercaoz
```

### ChanServ - INFO

Fornisce tutte le informazioni disponibili sul canale specificato, se è registrato, come il nick del Founder, il nick del successor se è stato settato, la descrizione inserita alla registrazione, il messaggio di benvenuto (welcome) se c’è, la data di registrazione, l'ultima volta che è stato frequentato da un operatore, l’ultimo topic e da chi è stato settato, il livello d’accesso per poter inviare memo al canale, l'indirizzo del sito web e l’e-mail (se sono stati settati), i settaggi ed i mode locks, se ce ne sono.

**Sintassi:**

```text
/msg ChanServ INFO #canale
```

**Esempio:**

```text
/msg ChanServ INFO #irchelp
```

**Risultato:**

```text
ChanServ- Info sul canale #irchelp:
ChanServ- Founder: MariaM (tarokker@exclusive.property.of.evilmaio.com)
ChanServ- Successor: kernella
ChanServ- Descrizione: Il vostro canale di conversazione
ChanServ- Messaggio di benvenuto: Benvenuti su #irchelp, buona permanenza e buon divertimento! Istruzioni per l'uso: http://forum.azzurra.chat/showthread.php?t=4886 | fai richiesta anche tu per la tua scheda su http://italia.azzurra.chat/invio-scheda.php
Data registrazione: 25 Mar 1999 - 22:32:56 (CET)
Ultimo join: 03 Giu 2005 - 01:20:45 (CEST) [meno di 1 ora fa]
Ora corrente: 03 Giu 2005 - 01:38:43 (CEST)
Ultimo topic: Per il sito di #irchelp http://italia.azzurra.chat, il resto son solo chiacchiere. Entra nella community! Per inserire la tua scheda--> http://italia.azzurra.chat/invio-scheda.php'
ChanServ- Topic cambiato da: Barbatruk
ChanServ- Memo Level: VOP
ChanServ- Lingua: Italiano (Italian)
ChanServ- URL: http://italia.azzurra.chat
ChanServ- Indirizzo E-Mail: italia@azzurra.chat
ChanServ- Opzioni: Topic Lock (AOP), Topic Retention, Ident, No MassKick, Verbose (1)
ChanServ- Modelock: +nt-ckps
ChanServ- *** Fine delle Info ***
```

### ChanServ - INVITE

Serve ad auto-invitarsi in un canale. Bisogna essere almeno VOP per poter usare questo comando, e può essere usato per invitare se stessi in caso di emergenza, quali un ban o il canale settato a solo invito (mode +i), con limite di utenti (+l) o con password (+k).

**Sintassi:**

```text
/msg ChanServ INVITE #canale
```

**Esempio:**

```text
/msg ChanServ INVITE #irchelp
```

### ChanServ - MDEHALFOP

Esegue un MassDehalfop, togliendo lo stato di halfop a tutti gli utenti del canale tranne a chi lo esegue. Bisogna essere almeno SOP per poter usare questo comando. Questo comando dovrebbe essere usato solo in situazioni di emergenza.

**Sintassi:**

```text
/msg ChanServ MDEHALFOP #canale
```

**Esempio:**

```text
/msg ChanServ MDEHALFOP #irchelp
```

### ChanServ - MDEOP

Esegue un MassDeop, togliendo lo stato di operatore a tutti gli utenti del canale tranne a chi lo esegue. Bisogna essere almeno SOP per poter usare questo comando. Questo comando dovrebbe essere usato solo in situazioni di emergenza.

**Sintassi:**

```text
/msg ChanServ MDEOP #canale
```

**Esempio:**

```text
/msg ChanServ MDEOP #irchelp
```

### ChanServ - MDEVOICE

Esegue un MassDevoice, togliendo lo stato di voice a tutti gli utenti del canale. Bisogna essere almeno SOP per usare questo comando.

**Sintassi:**

```text
/msg ChanServ MDEVOICE #canale
```

**Esempio:**

```text
/msg ChanServ MDEVOICE #irchelp
```

### ChanServ - MKICK

In seguito all'esecuzione di questo comando, che si intende per l'uso solo in casi di emergenza ("takeover"), ChanServ entra nel canale, mette un ban su `*!*@*` (tutti gli utenti) e kicka tutti gli utenti, compreso chi lo esegue. Il motivo può essere lungo al massimo 200 caratteri. Bisogna essere almeno SOP per usare questo comando, a meno che il canale non abbia il settaggio NOMKICK, che ne inibisce l’uso. ChanServ rimane nel canale per la durata di 2 minuti mantenendo il ban, prima di rimuoverlo ed uscire automaticamente.

Non è possibile interagire con un canale su cui è stato fatto un masskick, finché ChanServ non ne esce.

Non è quindi possibile usare i comandi DEOP, DROP, INVITE, MDEHALFOP, MDEOP, MDEVOICE, MKICK, HALFOP, MODE, OP, UNBAN, SET TOPIC, VOICE durante un masskick.

**Sintassi:**

```text
/msg ChanServ MKICK #canale [motivo]
```

**Esempio:**

```text
/msg ChanServ MKICK #irchelp
/msg ChanServ MKICK #irchelp Facciamo ordine
```

### ChanServ - MODE

Questo comando ha la stessa sintassi del `/MODE`, e serve a cambiare le modalità del canale. Mentre con il comando `/MODE` è l'utente stesso a cambiare le impostazioni, in questo caso sarà ChanServ ad effettuare le modifiche, utile in caso si sia rimasti per errore fuori dal proprio canale.

Bisogna essere almeno SOP per usare questo comando. Solo CF e Founder possono usarlo per modificare le modalità bloccate con il comando MLOCK. Si possono specificare fino a 6 modes (siano essi + o -) nella stessa riga.

**Sintassi:**

```text
/msg ChanServ MODE #canale +|-modes [parametri]
```

**Esempi:**

```text
/msg ChanServ MODE #irchelp +l 20
/msg ChanServ MODE #irchelp +k hh3er45
/msg ChanServ MODE #irchelp -k *
/msg ChanServ MODE #irchelp -cdu
/msg ChanServ MODE #irchelp +nt-is
```

NOTA: consultare l'help del proprio software IRC per conoscere i Channel modes validi, la loro funzione e sintassi, oppure digitare una volta connessi `/msg HelpServ CMODE`.

N.B. Non è possibile usare i mode +|- b, o, h, v con questo comando, cioè non è possibile bannare o togliere i ban, dare o togliere l’op, l’halfop e il voice.

### ChanServ - OP

Il comando OP conferisce lo stato di operatore di canale ad un utente. Questo comando non ha alcun effetto sulle liste AOP, SOP e CF del canale. È possibile specificare fino a 6 nick. Bisogna essere almeno AOP nel canale per poter usare questo comando.

**Sintassi:**

```text
/msg ChanServ OP #canale nickname1 [nickname2] ... [nickname6]
```

**Esempi:**

```text
/msg ChanServ OP #irchelp ^Norad^
/msg ChanServ OP #irchelp kavia typedef_c
```

### ChanServ - REGISTER

Registra un canale nel database di ChanServ. Per poter usare questo comando bisogna essere operatore nel canale che si intende registrare. La password servirà in seguito per identificarsi come founder e modificare le impostazioni del canale.

L'ultimo parametro, che deve essere incluso, è una breve descrizione generale degli argomenti trattati nel canale (massimo 400 caratteri). La password deve essere una stringa di un numero di caratteri compreso tra 5 e 32, senza codici di controllo o spazi, e non può essere uguale a quella del nick del founder per motivi di sicurezza. È inoltre sconsigliato usare come password il proprio nome, in quanto spesso troppo facile da indovinare.

Al momento della registrazione del canale il nick che esegue il comando sarà settato come founder, e in qualità di founder avrà la possibilità di modificare tutte le opzioni del canale. Inoltre ChanServ opperà automaticamente il nick quando entra nel canale, ma solamente se si sarà precedentemente identificato.

N.B.: Per poter registrare un canale è necessario usare un nick registrato con NickServ e autorizzato.

La registrazione di un canale può essere cancellata dal founder con il comando DROP.

**Sintassi:**

```text
/msg ChanServ REGISTER #canale password descrizione
```

NOTA: sostituire a #canale il nome del canale da registrare, a password quella che sarà poi la propria password da fondatore ed a descrizione una breve frase inerente l'argomento del canale.

**Esempi:**

```text
/msg ChanServ REGISTER #irchelp 12A04B57C Il canale per discutere sulle verdure
/msg ChanServ REGISTER #irchelp FataCarabina Chiacchiere su Belleville e la famiglia Malaussène
```

### ChanServ - REMOVE

Questo comando permette di togliersi dalle liste VOP, HOP, AOP, SOP, CF di un qualsiasi canale senza dover chiedere al founder o ad un SOP/CF di farlo.

Per poter utilizzare questo comando è necessario essere identificati al nick che si vuole rimuovere dalla lista.

Non è possibile togliere con questo comando eventuali mask in cui quella del nick in uso è contenuta.

**Sintassi:**

```text
/msg ChanServ REMOVE #canale
```

**Esempio:**

```text
/msg ChanServ REMOVE #irchelp
```

### ChanServ - RESETMODES

Questo comando resetta tutte le modalità del canale (c, C, i, k, l, m, M, n, p, R, s, t, u, U), togliendo tutte quelle che non sono presenti nel MLOCK. Bisogna essere almeno SOP per poter usare questo comando.

**Sintassi:**

```text
/msg ChanServ RESETMODES #canale
```

**Esempio:**

```text
/msg ChanServ RESETMODES #irchelp
```

### ChanServ - SET

Questo comando permette di modificare le impostazioni del canale in modo permanente, e può essere utilizzato solo dal Founder o da un CoFounder (con le eccezioni evidenziate). Le opzioni settate sono visibili nelle INFO del Canale.

- **AUTOOP** - Imposta +o chiunque entri.

  L'Op conferito dall'opzione AUTOOP è solo temporaneo, nessun nick verrà aggiunto o rimosso dalle liste AOP, SOP, CF. Non è possibile settare contemporaneamente questa opzione e l’opzione NEVEROP.

  Sintassi:

  ```text
  /msg ChanServ SET #canale AUTOOP ON|OFF
  ```

  Esempi:

  ```text
  /msg ChanServ SET #irchelp AUTOOP ON
  /msg ChanServ SET #irchelp AUTOOP OFF
  ```

- **AUTOHALFOP** - Imposta +h chiunque entri.

  L'HalfOp conferito dall'opzione AUTOHALFOP è solo temporaneo, nessun nick verrà aggiunto o rimosso dalla lista HOP.

  Sintassi:

  ```text
  /msg ChanServ SET #canale AUTOHALFOP ON|OFF
  ```

  Esempi:

  ```text
  /msg ChanServ SET #irchelp AUTOHALFOP ON
  /msg ChanServ SET #irchelp AUTOHALFOP OFF
  ```

- **AUTOVOICE** - Imposta +v chiunque entri.

  Il Voice conferito dall'opzione AUTOVOICE è solo temporaneo, nessun nick verrà aggiunto o rimosso dalla lista VOP.

  Sintassi:

  ```text
  /msg ChanServ SET #canale AUTOVOICE ON|OFF
  ```

  Esempi:

  ```text
  /msg ChanServ SET #irchelp AUTOVOICE ON
  /msg ChanServ SET #irchelp AUTOVOICE OFF
  ```

- **BANTYPE** - Imposta il tipo di ban.

  Questa opzione permette di scegliere la tipologia di ban da applicare sugli utenti che vengono automaticamente bannati con l'opzione Restrict, o in caso di akick sul nick registrato. Ci sono 10 valori possibili. Il valore iniziale per il BANTYPE di un canale (impostato alla registrazione) è 2.

  Sintassi:

  ```text
  /msg ChanServ SET #canale BANTYPE valore
  ```

  Esempio:

  ```text
  /msg ChanServ SET #irchelp BANTYPE 3
  ```

- **DESC** - Setta la descrizione del canale.

  Questa descrizione è quella inizialmente settata alla registrazione e che risulta ad ogni utente che richieda le informazioni del canale tramite il comando INFO. Può essere al massimo di 400 caratteri e non è possibile rimuoverla.

  Sintassi:

  ```text
  /msg ChanServ SET #canale DESC descrizione
  ```

  Esempio:

  ```text
  /msg ChanServ SET #irchelp DESC Canale privato di ^Cindy^ e Robert
  ```

- **EMAIL** - Configura l'email di riferimento del canale.

  Questo indirizzo E-Mail è quello che risulterà ad ogni utente che richieda le informazioni del canale tramite il comando INFO. In caso di richiesta di password smarrita, l’e-mail NON verrà inviata a questo indirizzo ma a quello di registrazione del nick del founder. Per rimuovere l'E-Mail corrente bisogna specificare NONE come indirizzo E-mail.

  Sintassi:

  ```text
  /msg ChanServ SET #canale EMAIL indirizzo@email
  ```

  Esempio:

  ```text
  /msg ChanServ SET #irchelp EMAIL irchelp@ml.azzurra.chat
  ```

- **FOUNDER** - Cambia il fondatore del canale.

  Il nickname specificato deve essere registrato, on-line ed identificato. Per poter utilizzare questo comando è necessario essere identificati sia al nick dell'attuale founder sia al canale con il comando IDENTIFY. La password del canale viene cambiata con una casuale al momento del passaggio e inviata al nuovo founder via memo.

  Sintassi:

  ```text
  /msg ChanServ SET #canale FOUNDER nickname
  ```

  Esempio:

  ```text
  /msg ChanServ SET #irchelp FOUNDER Mary
  ```

- **IDENT** - Se abilitato, sarà necessario identificarsi a NickServ per essere riconosciuti.

  Quando l'opzione IDENT è settata ON, ChanServ darà il relativo stato (op, halfop, voice) automaticamente solamente agli utenti nelle liste che si sono identificati al proprio nick.

  N.B.: Se l'opzione IDENT è settata ON, le liste VOP/HOP/AOP/SOP/CF non possono contenere mask, ma solamente nick registrati. L’opzione è settata ON di default al momento della registrazione del canale.

  Sintassi:

  ```text
  /msg ChanServ SET #canale IDENT ON|OFF
  ```

  Esempi:

  ```text
  /msg ChanServ SET #irchelp IDENT OFF
  /msg ChanServ SET #irchelp IDENT ON
  ```

- **KEEPTOPIC** - Mantiene il topic quando il canale è vuoto.

  Attiva o disattiva l'opzione Topic Retention per il canale specificato. Quando essa è attiva, ChanServ memorizzerà il topic quando il canale rimane vuoto, e lo setterà di nuovo nel momento in cui entra qualcuno. L’opzione è settata ON di default al momento della registrazione del canale.

  Sintassi:

  ```text
  /msg ChanServ SET #canale KEEPTOPIC ON|OFF
  ```

  Esempi:

  ```text
  /msg ChanServ SET #irchelp KEEPTOPIC OFF
  /msg ChanServ SET #irchelp KEEPTOPIC ON
  ```

- **LANG** - Cambia la lingua usata da ChanServ per inviare messaggi.

  Per ottenere l’elenco delle lingue disponibili bisogna specificare LIST come numero

  Sintassi:

  ```text
  /msg ChanServ SET #canale LANG numero
  ```

  Esempio:

  ```text
  /msg ChanServ SET #irchelp LANG 1
  ```

- **MEMOLEVEL** - Definisce quale categoria di utenti può inviare memo al canale.

  L'opzione MEMOLEVEL permette di specificare il livello di accesso minimo richiesto per poter inviare delle memo all'intero canale con il comando SENDTO. Il parametro livello può essere uno qualunque fra VOP, HOP, AOP, SOP, CF o FOUNDER.

  L’opzione è settata VOP di default al momento della registrazione del canale e può essere modificata solo dal founder.

  Per fare in modo che non sia possibile mandare memo all'intero canale bisogna specificare NONE come livello.

  Sintassi:

  ```text
  /msg ChanServ SET #canale MEMOLEVEL livello
  ```

  Esempi:

  ```text
  /msg ChanServ SET #irchelp MEMOLEVEL VOP
  /msg ChanServ SET #irchelp MEMOLEVEL NONE
  ```

- **MLOCK** - Definisce quali Channel modes sono bloccati.

  Setta il blocco dei mode per un canale. ChanServ ti permette di fare in modo che certi mode per il canale siano sempre attivati o disattivati. I mode che possono essere bloccati sono c, C, i, k, l, m, M, n, p, R, s, t, u e U. I parametri preceduti da un + sono attivi e bloccati, quelli preceduti da un – non possono essere settati sul canale. I mode bloccati possono essere modificati solo da Founder e CF con il comando MODE.

  Alla registrazione ChanServ setta di default mlock +nt. Il mode j non è attualmente supportato dai servizi e pertanto non è bloccabile.

  N.B.: Se il modelock di un canale è attualmente +nt e si vuole far sì che venga bloccato anche il mode +s, bisogna specificare +nts come mode, e non +s che bloccherebbe invece solo il mode +s e non più anche +nt.

  Per fare sì che ChanServ non blocchi nulla bisogna specificare NONE come mode.

  Sintassi:

  ```text
  /msg ChanServ SET #canale MLOCK +|-modes [parametri]
  ```

  Esempi:

  ```text
  /msg ChanServ SET #irchelp MLOCK +cnt
  /msg ChanServ SET #irchelp MLOCK +ntmcu-il
  /msg ChanServ SET #irchelp MLOCK +ntk 040283
  /msg ChanServ SET #irchelp MLOCK NONE
  ```

- **NOMKICK** - Blocca il comando MKICK per il canale.

  È impostabile solo dal Founder identificato al nick e al canale. Se è settato su ON non sono possibili masskick sul canale. È settato ON di default alla registrazione.

  Sintassi:

  ```text
  /msg ChanServ SET #canale NOMKICK ON|OFF
  ```

  Esempio:

  ```text
  /msg ChanServ SET #irchelp NOMKICK OFF
  ```

- **NEVEROP** - Non fa oppare automaticamente AOP e superiori al join del canale.

  Quando l'opzione NEVEROP è settata ON, gli AOP e superiori non verranno oppati da ChanServ all'entrata, anche se già identificati al proprio nick. Per avere l'op dovranno necessariamente ricorrere al comando OP di ChanServ in qualsiasi momento lo desiderino. Non è possibile settare contemporaneamente questa opzione e l’opzione AUTOOP.

  Sintassi:

  ```text
  /msg ChanServ SET #canale NEVEROP ON|OFF
  ```

  Esempio:

  ```text
  /msg ChanServ SET #irchelp NEVEROP ON
  ```

- **OPGUARD** - Se abilitato, non permette agli utenti normali di essere oppati.

  Solo gli utenti inseriti nelle liste AOP/SOP/CF, oltre al founder, possono essere operatori nel canale. Gli utenti normali possono però essere oppati da Founder o CF per mezzo di ChanServ.

  Sintassi:

  ```text
  /msg ChanServ SET #canale OPGUARD ON|OFF
  ```

  Esempio:

  ```text
  /msg ChanServ SET #irchelp OPGUARD ON
  ```

- **PASSWD** - Cambia la password del canale specificato nella nuova password specificata.

  Bisogna essere identificati al nick del founder per poter usare questo comando.

  Sintassi:

  ```text
  /msg ChanServ SET #canale PASSWD vecchiapassword nuovapassword
  ```

  Esempio:

  ```text
  /msg ChanServ SET #irchelp PASSWD carota ndtw564Ac4W
  ```

- **PROTECT** - Protegge gli operatori registrati nelle liste.

  L'opzione PROTECT fa in modo che nel canale specificato tutti gli utenti registrati sulle liste AOP/SOP/CF vengano automaticamente rioppati nel caso in cui qualcuno li deoppi, a meno che a deopparli non sia qualcuno di grado superiore.

  Sintassi:

  ```text
  /msg ChanServ SET #canale PROTECT ON|OFF
  ```

  Esempio:

  ```text
  /msg ChanServ SET #irchelp PROTECT ON
  ```

- **RESTRICT** - Limita l'accesso al canale ai soli nick registrati nelle liste.

  Attiva o disattiva l'opzione Restricted Access per il canale specificato. Se abilitato, solo VOP, HOP, AOP, SOP, CoFounder e il Founder possono entrare nel canale; tutti gli altri verranno bannati (con mask impostata secondo il BANTYPE) ed immediatamente kickati da ChanServ.

  Sintassi:

  ```text
  /msg ChanServ SET #canale RESTRICT ON|OFF
  ```

  Esempio:

  ```text
  /msg ChanServ SET #irchelp RESTRICT ON
  ```

- **SUCCESSOR** – Imposta un successor per il canale.

  Se il nick del founder di un canale dovesse scadere o essere droppato, il canale passerà in gestione al Successor che ne diventerà il nuovo Founder. Il Successor deve essere un Co-Founder del canale. Il successor è impostabile solo dal founder.

  Per rimuovere il Successor di un canale bisogna specificare NONE come nick.

  N.B.: Se un canale è sprovvisto di Successor e il nick del founder dovesse scadere o essere droppato, il canale verrà immediatamente droppato e sarà registrabile da chiunque.

  Sintassi:

  ```text
  /msg ChanServ SET #canale SUCCESSOR nickname
  ```

  Esempi:

  ```text
  /msg ChanServ SET #irchelp SUCCESSOR Jenny
  /msg ChanServ SET #irchelp SUCCESSOR NONE
  ```

- **TOPIC** – Cambia il topic del canale.

  Fa in modo che ChanServ cambi il topic del canale specificato con il nuovo topic specificato.

  Sintassi:

  ```text
  /msg ChanServ SET #canale TOPIC messaggio
  ```

  Esempio:

  ```text
  /msg ChanServ SET #irchelp TOPIC :: Benvenuti in #irchelp :: Chattate & Divertitevi. No flame - No parolacce e offese - No spam ::
  ```

- **TOPICLOCK** - Permette solo alla categoria di utenti specificata di cambiare il topic.

  Attiva o disattiva l'opzione Topic Lock per il canale specificato. Quando è attiva, solamente chi ha il minimo livello di accesso richiesto avrà la possibilità di cambiare il topic del canale. Il livello può essere uno qualsiasi tra VOP|HOP|AOP|SOP|CF|FOUNDER. I CFounder possono modificare questa opzione a meno che non sia settata a livello FOUNDER. Per disattivare questa opzione bisogna specificare OFF come livello.

  Sintassi:

  ```text
  /msg ChanServ SET #canale TOPICLOCK livello
  ```

  Esempi:

  ```text
  /msg ChanServ SET #irchelp TOPICLOCK AOP
  /msg ChanServ SET #irchelp TOPICLOCK OFF
  ```

- **URL** - Setta l'indirizzo della home page del canale.

  Permette di associare un URL al canale specificato. Questo URL è quello che risulterà ad ogni utente che richieda le informazioni del canale tramite il comando INFO. Per rimuovere l'URL corrente bisogna specificare NONE come indirizzo.

  Sintassi:

  ```text
  /msg ChanServ SET #canale URL indirizzo
  ```

  Esempi:

  ```text
  /msg ChanServ SET #irchelp URL http://www.azzurra.chat/irchelp.php
  /msg ChanServ SET #irchelp URL NONE
  ```

- **VERBOSE** - Permette di scegliere quali opnotice ricevere.

  Permette di scegliere quali comandi di ChanServ debbano inviare una notice agli operatori del canale quando eseguiti con successo. Il livello di default di Verbose è 0.

  - Livello 0: Non verrà inviata nessuna opnotice al canale
  - Livello 1: I comandi OP, DEOP, HALFOP, DEHALFOP, VOICE, DEVOICE, MKICK, MDEOP, MDEHALFOP, MDEVOICE, UNBAN inviano opnotice al canale
  - Livello 2: Anche ogni modifica delle liste VOP/HOP/AOP/SOP/CF/AKICK, anche mediante il comando REMOVE, invia una opnotice al canale; inoltre se un utente in akick entra nel canale, viene notificata la akick per la quale è stato bannato
  - Livello 3: Anche ogni modifica ai settaggi col comando SET invia una opnotice al canale

  Sintassi:

  ```text
  /msg ChanServ SET #canale VERBOSE livello
  ```

  Esempi:

  ```text
  /msg ChanServ SET #irchelp VERBOSE 3
  /msg ChanServ SET #irchelp VERBOSE 0
  ```

- **WELCOME** - Definisce il messaggio di benvenuto che ChanServ invierà come notice a tutti quelli che entrano nel canale specificato.

  Può essere al massimo di 400 caratteri. Per rimuovere il welcome corrente bisogna specificare NONE come messaggio. Al posto di WELCOME si può utilizzare GREETING o MOTD

  Sintassi:

  ```text
  /msg ChanServ SET #canale WELCOME messaggio
  ```

  Esempi:

  ```text
  /msg ChanServ SET #irchelp WELCOME NONE
  /msg ChanServ SET #irchelp MOTD Benvenuti nel canale #irchelp di Azzurra IRC Network
  /msg ChanServ SET #irchelp WELCOME Mercoledì mercato!!! Prezzi senza confronti!
  ```

### ChanServ - SOP

Questo comando serve a gestire la lista SuperOp del canale. I SOP vengono automaticamente oppati da ChanServ quando entrano nel canale, possono utilizzare comandi di massa quali MDEVOICE, MDEHALFOP, MDEOP e MKICK (se NOMKICK è settato su OFF), utilizzare i comandi UNBAN ALL, MODE e RESETMODES, aggiungere o togliere utenti dalle liste VOP, HOP e AOP (ma non SOP o CF), e manipolare la lista AKICK, se le liste non sono bloccate dal Founder. I CoFounder possono aggiungere e togliere SOP, ma solo nel caso in cui la lista SOP non sia bloccata dal Founder con l’opzione LOCK.

È possibile inserire solo nickname registrati nella lista, a meno che l'opzione IDENT sia disabilitata, nel qual caso è possibile inserire anche delle maschere nel formato user@host o nick!user@host.

**Sintassi:**

```text
/msg ChanServ SOP #canale ADD nick|mask
/msg ChanServ SOP #canale DEL nick|mask|numero
/msg ChanServ SOP #canale LIST [mask]
/msg ChanServ SOP #canale FIND mask
/msg ChanServ SOP #canale CLEAN
/msg ChanServ SOP #canale EXPLIST
/msg ChanServ SOP #canale WIPE
/msg ChanServ SOP #canale LOCK [nick|mask]
/msg ChanServ SOP #canale UNLOCK [nick|mask]
```

ADD aggiunge la mask o il nick specificato alla Super-Op list del canale. Se il nick o la mask sono già presenti in un'altra lista, il loro accesso verrà cambiato in SOP.

DEL cancella la mask o il nick specificato dalla Super-Op list del canale, oppure la mask o il nick corrispondenti al numero specificato.

LIST visualizza la lista completa dei Super-Op del canale, o eventualmente solo quelli che contengono la mask specificata.

FIND ricerca gli elementi che rispecchiano la mask specificata (nel formato nick!user@host).

CLEAN cancella dalla Super-Op list tutti i nick che risultano scaduti.

EXPLIST mostra i nick scaduti presenti nella lista Super-Op.

WIPE cancella tutti i nick e le mask presenti nella Super-Op list.

LOCK blocca la lista, permettendo solo al founder di manipolarla. Se viene specificata una delle mask già in lista, verrà bloccata solo quella.

UNLOCK sblocca la lista, nel caso fosse stata bloccata col comando LOCK. Se viene specificata una mask, verrà sbloccata solo quella.

NOTA: sostituire a #canale il nome del canale su cui si desidera effettuare la modifica, ed al posto di [nick|mask] il nick o la mask dell'utente da inserire.

**Esempi:**

```text
/msg ChanServ SOP #IRCHelp ADD [^BodyZen
/msg ChanServ SOP #IRCHelp ADD *!*pippo@*.carota.net
/msg ChanServ SOP #IRCHelp DEL 5
/msg ChanServ SOP #IRCHelp LIST *carota*
/msg ChanServ SOP #IRCHelp FIND *!*@*carota.net
/msg ChanServ SOP #IRCHelp LOCK [^BodyZen
/msg ChanServ SOP #IRCHelp UNLOCK
```

Per problemi nel determinare le maschere, consultare la sezione Maschere di riconoscimento o rivolgersi ad un operatore su #IRCHelp.

### ChanServ - UNBAN

Questo comando permette di rimuovere tutti i ban che impediscono ad un utente di entrare, oppure svuotare l'intera ban list del canale.

**Sintassi:**

```text
/msg ChanServ UNBAN #canale ME
/msg ChanServ UNBAN #canale ALL
```

ME rimuove tutti i ban che non permettono al nick che esegue il comando di entrare nel canale.

Bisogna essere almeno VOP per poter usare questo comando.

ALL rimuove tutti i ban del canale. Bisogna essere almeno SOP per usarlo.

**Esempi:**

```text
/msg ChanServ UNBAN #IRCHelp me
/msg ChanServ UNBAN #irchelp ALL
```

### ChanServ - VOICE

Questo comando permette di conferire "voce", cioè la possibilità di inviare testo su un canale moderato (mode +m), all'utente specificato. Non ha alcun effetto sulla lista VOP. È possibile specificare fino a 6 nick. Bisogna essere almeno VOP nel canale per poter usare questo comando su se stessi, e almeno HOP per poterlo usare sugli altri.

**Sintassi:**

```text
/msg ChanServ VOICE #canale nickname1 [nickname2] ... [nickname6]
```

**Esempi:**

```text
/msg ChanServ VOICE #irchelp MaSCiA
/msg ChanServ VOICE #irchelp Gino^ mirtilla2 ]Antonio[ _ZIP_
```

### ChanServ - VOP

Questo comando serve a gestire la lista VoiceOp del canale. I VOP vengono automaticamente settati +v da ChanServ quando entrano nel canale, e possono solamente dare il VOICE e toglierlo (DEVOICE) a se stessi, ed usare i comandi INVITE e UNBAN ME. SOP e CoFounder possono aggiungere e togliere VOP, ma solo nel caso in cui la lista VOP non sia bloccata dal Founder con l’opzione LOCK.

È possibile inserire solo nickname registrati nella lista, a meno che l'opzione IDENT sia disabilitata, nel qual caso è possibile inserire anche delle maschere nel formato user@host o nick!user@host.

**Sintassi:**

```text
/msg ChanServ VOP #canale ADD nick|mask
/msg ChanServ VOP #canale DEL nick|mask|numero
/msg ChanServ VOP #canale LIST [mask]
/msg ChanServ VOP #canale FIND mask
/msg ChanServ VOP #canale CLEAN
/msg ChanServ VOP #canale EXPLIST
/msg ChanServ VOP #canale WIPE
/msg ChanServ VOP #canale LOCK [nick|mask]
/msg ChanServ VOP #canale UNLOCK [nick|mask]
```

ADD aggiunge la mask o il nick specificato alla Voice-Op list del canale. Se il nick o la mask sono già presenti in un'altra lista, il loro accesso verrà cambiato in VOP.

DEL cancella la mask o il nick specificato dalla Voice-Op list del canale, oppure la mask o il nick corrispondenti al numero specificato.

LIST visualizza la lista completa dei Voice-Op del canale, o eventualmente solo quelli che contengono la mask specificata.

FIND ricerca gli elementi che rispecchiano la mask specificata (nel formato nick!user@host).

CLEAN cancella dalla Voice-Op list tutti i nick che risultano scaduti.

EXPLIST mostra i nick scaduti presenti nella lista Voice-Op.

WIPE cancella tutti i nick e le mask presenti nella Voice-Op list.

LOCK blocca la lista, permettendo solo al founder di manipolarla. Se viene specificata una delle mask già in lista, verrà bloccata solo quella.

UNLOCK sblocca la lista, nel caso fosse stata bloccata col comando LOCK. Se viene specificata una mask, verrà sbloccata solo quella.

NOTA: sostituire a #canale il nome del canale su cui si desidera effettuare la modifica, ed al posto di [nick|mask] il nick o la mask dell'utente da inserire.

**Esempi:**

```text
/msg ChanServ VOP #irchelp ADD MaSCiA
/msg ChanServ VOP #IRCHelp ADD Kab00m
/msg ChanServ VOP #IRCHelp ADD *!*pippo@*.carota.net
/msg ChanServ VOP #IRCHelp DEL 4
/msg ChanServ VOP #IRCHelp LIST pippo*
/msg ChanServ VOP #IRCHelp FIND *!*mau@*.fastweb.fw
/msg ChanServ VOP #IRCHelp LOCK
/msg ChanServ VOP #IRCHelp UNLOCK Kab00m
```

Per problemi nel determinare le maschere, consultare la sezione Maschere di riconoscimento o rivolgersi ad un operatore su #IRCHelp.

### ChanServ - WHY

Spiega perché ed in base a quale criterio ChanServ conferisce un certo livello di accesso al canale all'utente specificato (ad esempio, il motivo per cui un utente è operatore). Può essere usato solo da un utente inserito in una delle liste del canale.

**Sintassi:**

```text
/msg ChanServ WHY #canale nickname
```

**Esempio:**

```text
/msg ChanServ WHY #irchelp ^Norad^
```

### BanType

Questi sono i valori disponibili per SET BANTYPE e per il parametro bantype del comando AKICK

| Valore | Formato del ban |
|:------:|-----------------|
| 0 | Ban nel formato `*!user@host` |
| 1 | Ban nel formato `*!*user@host` |
| 2 | Ban nel formato `*!*@host` |
| 3 | Ban nel formato `*!*user@*.host` |
| 4 | Ban nel formato `*!*@*.host` |
| 5 | Ban nel formato `nick!user@host` |
| 6 | Ban nel formato `nick!*user@host` |
| 7 | Ban nel formato `nick!*@host` |
| 8 | Ban nel formato `nick!*user@*.host` |
| 9 | Ban nel formato `nick!*@*.host` |

## I comandi di MemoServ

MemoServ è un servizio che permette agli utenti di scambiarsi messaggi tra loro, anche quando il destinatario non è connesso alla rete IRC. Per poter utilizzare MemoServ è necessario che il proprio nickname e quello del destinatario siano registrati con NickServ e autorizzati.

È inoltre possibile inviare messaggi ai canali, che verranno letti dal fondatore e dalle categorie di operatori a cui si decide di inoltrare il messaggio, funzionalità che può essere molto utile per mettere in comunicazione i frequentatori di un canale con i suoi gestori.

- **DEL** - Segna il messaggio come "da cancellare"
- **FORWARD** - Seleziona il nickname a cui inoltrare i memo ricevuti
- **HELP** – Help on-line del servizio MemoServ
- **IGNORE** – Permette di gestire la lista Memo Ignore
- **LIST** - Mostra l'elenco dei messaggi
- **NEWS** - Mostra le ultime novità sulla rete Azzurra
- **PURGE** - Elimina i messaggi segnati come "da cancellare"
- **READ** - Legge un messaggio
- **SEND** - Invia un nuovo messaggio ad un utente
- **SENDTO** - Invia un nuovo messaggio ad un canale
- **SET** - Modifica le impostazioni di MemoServ
- **UNDEL** - Annulla la modifica fatta con il comando DEL
- **UNSEND** - Cancella un memo inviato (se il ricevente non l'ha già letto)

Per maggiori informazioni, una volta connessi alla rete IRC, digitare: `/msg MemoServ HELP`

### MemoServ - DEL

Questo comando permette di segnare un messaggio come "da cancellare". Nell'output del comando LIST comparirà una "D" prima del numero del messaggio. Questi memo saranno effettivamente cancellati solo una volta usato il comando PURGE, oppure verranno automaticamente cancellati alla disconnessione.

**Sintassi:**

```text
/msg MemoServ DEL numero
/msg MemoServ DEL ALL [CHANNEL|NEW|USER]
```

ALL segna tutti i memo come da cancellare.

ALL CHANNEL segna tutti i memo inviati a canali.

ALL NEW segna tutti i memo non ancora letti.

ALL USER segna tutti i memo inviati da altri utenti.

NOTA: sostituire numero con il numero del messaggio che si intende cancellare. Per vedere quale numero identifica un certo messaggio utilizzare il comando LIST.

**Esempi:**

```text
/msg MemoServ DEL 6
/msg MemoServ DEL ALL
/msg MemoServ DEL ALL USER
```

### MemoServ - FORWARD

Questo comando permette di selezionare un nickname a cui verranno inoltrati tutti i messaggi che altri utenti inviano. Il nick deve essere registrato e occorre identificarsi. Questo non è un metodo per "nascondersi" in quanto chiunque invia il messaggio viene informato che il suo memo è automaticamente inoltrato ad un nickname diverso. È più che altro inteso per facilitare l'utente che voglia cambiare nickname, e che così non deve avvisare tutti i suoi "corrispondenti" di inviare i messaggi ad un nickname diverso. Per disattivare questa opzione occorre mettere NONE anziché il nick.

**Sintassi:**

```text
/msg MemoServ FORWARD nickname|NONE
```

**Esempio:**

```text
/msg MemoServ FORWARD ^Sanuye^
/msg MemoServ FORWARD NONE
```

### MemoServ - HELP

È il comando per ottenere help on-line sul servizio MemoServ.

**Sintassi:**

```text
/msg MemoServ HELP [comando]
```

**Esempi:**

```text
/msg MemoServ HELP
/msg MemoServ HELP SENDTO
/msg MemoServ HELP SET IGNORETYPE
```

### MemoServ - IGNORE

Questo comando permette di visualizzare e modificare la Memo Ignore List del nick.

A seconda del settaggio dell’opzione IGNORETYPE i memo inviati da nick presenti nella Memo Ignore List saranno ignorati o saranno gli unici considerati.

**Sintassi:**

```text
/msg MemoServ IGNORE ADD nick
/msg MemoServ IGNORE DEL nick|numero
/msg MemoServ IGNORE LIST
/msg MemoServ IGNORE WIPE
```

ADD aggiunge il nick specificato alla Ignore List.

DEL cancella il nick specificato dalla Ignore List, oppure il nick corrispondente al numero specificato.

LIST visualizza la lista completa dei nick nella Ignore List.

WIPE cancella tutti i nick presenti nella Ignore List.

**Esempi:**

```text
/msg MemoServ IGNORE ADD ^L4m3r^
/msg MemoServ IGNORE LIST
/msg MemoServ IGNORE DEL 2
/msg MemoServ IGNORE DEL ^L4m3r^
/msg MemoServ IGNORE WIPE
```

### MemoServ - LIST

Questo comando mostra l'elenco di tutti i messaggi presenti nella propria memobox, che non può contenerne più di 32. Eventuali memo non ancora letti appariranno con un "*" vicino, mentre eventuali memo segnati come cancellati avranno una "D" vicino. I messaggi verranno cancellati comunque dopo 21 giorni.

**Sintassi:**

```text
/msg MemoServ LIST [CHANNEL|USER|NEW]
```

CHANNEL mostra solo i memo inviati a canali.

USER mostra solo i memo inviati da altri utenti.

NEW mostra solo i memo nuovi (non letti).

Senza parametri vengono mostrati tutti i memo.

**Esempi:**

```text
/msg MemoServ LIST
/msg MemoServ LIST CHANNEL
/msg MemoServ LIST USER
/msg MemoServ LIST NEW
```

### MemoServ - NEWS

Legge le ultime novità di Azzurra. MemoServ continuerà a notificare la presenza di questo messaggio finché non verrà letto, dopodiché esso sarà ancora consultabile ma non verrà più notificato. L'invio di NEWS memo è riservato ai soli IRCOp.

**Sintassi:**

```text
/msg MemoServ NEWS
```

**Esempio:**

```text
/msg MemoServ NEWS
```

### MemoServ - PURGE

Questo comando cancella tutti i messaggi segnati come "da cancellare" con il comando DEL, quelli cioè che appaiono con una "D" vicino ad ogni comando LIST.

ATTENZIONE: una volta dato il comando PURGE non sarà più possibile recuperare i messaggi cancellati.

**Sintassi:**

```text
/msg MemoServ PURGE
```

**Esempio:**

```text
/msg MemoServ PURGE
```

### MemoServ - READ

Legge il contenuto di un messaggio. Visualizza il testo del messaggio corrispondente al numero specificato. Per leggere l'ultimo memo arrivato basta specificare LAST come numero.

**Sintassi:**

```text
/msg MemoServ READ numero|LAST
```

NOTA: al posto di numero va inserito il numero del messaggio che si vuole leggere. Per vedere quale numero identifica un certo messaggio utilizzare il comando LIST.

**Esempi:**

```text
/msg MemoServ READ 3
/msg MemoServ READ LAST
```

### MemoServ - SEND

Questo comando permette di inviare dei brevi messaggi (max 400 caratteri) ad altri utenti registrati con NickServ (per inviare memo ai canali vedere il comando SENDTO). Il destinatario verrà notificato dell'arrivo del messaggio a seconda delle sue impostazioni di NOTIFY.

**Sintassi:**

```text
/msg MemoServ SEND nickname messaggio
```

**Esempio:**

```text
/msg MemoServ SEND Nicola Devo dirti una cosa. Querami appena puoi
```

### MemoServ - SENDTO

Questo comando permette di inviare brevi messaggi ad un canale registrato con ChanServ (per inviarne agli utenti vedere il comando SEND). La sintassi è uguale a quella del comando SEND tranne per il fatto che va anche specificata la categoria di utenti (VOP, HOP, AOP, SOP, CF) che riceverà il messaggio. Anche tutte le categorie di utenti superiori a quella specificata riceveranno il messaggio. Solo chi è in una lista pari o superiore a quella specificata con l’opzione MEMOLEVEL potrà inviare memo al canale.

N.B.: Il founder riceverà comunque i memo a prescindere dalla scelta del livello.

**Sintassi:**

```text
/msg MemoServ SENDTO #canale VOP|HOP|AOP|SOP|CF messaggio
```

**Esempi:**

```text
/msg MemoServ SENDTO #irchelp AOP Attenzione a [{^SgRunF^}] è un lamer.
/msg MemoServ SENDTO #irchelp VOP Oggi è primavera!!! Auguri a Benedetta
```

### MemoServ - SET

Permette di configurare le opzioni di MemoServ. Per poter utilizzare questo comando bisogna essere identificati al proprio nick.

- **IGNORETYPE** - Permette di decidere la modalità d'uso della lista Memo Ignore.

  Sintassi:

  ```text
  /msg MemoServ SET IGNORETYPE parametro
  ```

  I parametri disponibili sono:

  | Parametro | Effetto |
  |:---------:|---------|
  | 1 | Verranno ignorati i memo inviati dai nick presenti nella Ignore List. |
  | 2 | Verranno ignorati tutti i memo ad esclusione di quelli inviati dai nick presenti nella Ignore List. |

  Esempio:

  ```text
  /msg MemoServ SET IGNORETYPE 2
  ```

- **NOTIFY** - Permette di scegliere quando si vuole essere notificati della presenza di nuovi memo.

  Sintassi:

  ```text
  /msg MemoServ SET NOTIFY ON
  /msg MemoServ SET NOTIFY LOGON
  /msg MemoServ SET NOTIFY NEW
  /msg MemoServ SET NOTIFY OFF
  ```

  | Parametro | Effetto |
  |-----------|---------|
  | ON | La notifica avviene all’identificazione del nick e all’invio del memo. |
  | LOGON | La notifica avviene solo all’identificazione del nick. |
  | NEW | La notifica avviene all’invio del memo. |
  | OFF | Nessuna notifica. |

  Esempi:

  ```text
  /msg MemoServ SET NOTIFY ON
  /msg MemoServ SET NOTIFY NEW
  ```

### MemoServ - UNDEL

Annulla l'effetto del comando DEL, ovvero toglie il segno "da cancellare" ad un messaggio. Se il memo specificato era stato precedentemente segnato come da cancellare, ovvero ha una "D" vicino, questa viene tolta, e il messaggio non sarà cancellato quando ti disconnetti o usi il comando PURGE. Specificando ALL al posto del numero del memo, la "D" verrà tolta da tutti i messaggi segnati come da cancellare.

**Sintassi:**

```text
/msg MemoServ UNDEL numero|ALL
```

NOTA: al posto di numero inserire il numero del messaggio a cui si intende applicare la modifica. Per vedere quale numero identifica un certo messaggio utilizzare il comando LIST.

**Esempi:**

```text
/msg MemoServ UNDEL 3
/msg MemoServ UNDEL ALL
```

### MemoServ - UNSEND

Recupera un messaggio precedentemente inviato ad un utente o ad un canale. Se l'utente destinatario ha già letto il messaggio, questo comando non sortirà alcun effetto. Se invece il messaggio non è ancora stato letto con questo comando verrà cancellato, e il destinatario, se è on-line in quel momento, verrà avvertito via notice che il memo è stato recuperato.

**Sintassi:**

```text
/msg MemoServ UNSEND nickname|#canale lista
```

**Esempi:**

```text
/msg MemoServ UNSEND debiAn
/msg MemoServ UNSEND #irchelp VOP
```

## I comandi di SeenServ

SeenServ è un servizio che permette di sapere quando un certo utente si è collegato per l'ultima volta

- **HELP** – Help on-line del servizio SeenServ
- **SEEN** - Ricerca un nick specifico nel database
- **SEENNICK** – Simile al comando seen ma fornisce più dettagli

La lingua dei messaggi di SeenServ è legata all’IP con cui ci si connette.

È possibile avere informazioni solo sulle connessioni avvenute negli ultimi 7 giorni.

Per maggiori informazioni, una volta connessi alla rete IRC, digitare: `/msg SeenServ HELP`

### SeenServ - HELP

È il comando per ottenere help on-line sul servizio SeenServ.

**Sintassi:**

```text
/msg SeenServ HELP [comando]
```

**Esempi:**

```text
/msg SeenServ HELP
/msg SeenServ HELP SEENNICK
```

### SeenServ - SEEN

Permette di ricercare un nick all’interno del database (Non sono possibili ricerche con mask o parti del nick).

**Sintassi:**

```text
/msg SeenServ SEEN nickname
```

**Esempio:**

```text
/msg SeenServ SEEN Martin
```

### SeenServ - SEENNICK

Permette di ottenere informazioni sull'ultima volta in cui è stato visto un determinato utente, fra cui quando è stato visto, l'ultimo indirizzo usato, e se era identificato al nick che stava usando e se ha cambiato nick. Non è però possibile sapere quale sia il nuovo nick, per motivi di privacy.

**Sintassi:**

```text
/msg SeenServ SEENNICK nickname
```

**Esempio:**

```text
/msg SeenServ SEENNICK ^Norad^
```

## I comandi di StatServ

StatServ è un servizio che permette di conoscere le statistiche di un canale

- **CHANSTATS** - Mostra le statistiche disponibili per un canale
- **HELP** – Help on-line del servizio StatServ

Per maggiori informazioni, una volta connessi alla rete IRC, digitare: `/msg StatServ HELP`

### StatServ - CHANSTATS

Mostra alcune statistiche di un canale, fra cui il record di utenza, il numero di join, quello di ban, ecc.

Per poter utilizzare questo comando è necessario essere operatori (@) nel canale di cui si richiedono le statistiche.

Legenda dei risultati che si ottengono:

| Sigla | Significato |
|-------|-------------|
| T = Total | (Totale statistiche dall'inizio del monitoraggio) |
| M = Monthly | (Totale del mese in corso) |
| W = Weekly | (Totale della settimana in corso) |
| D = Daily | (Totale della giornata in corso) |

**Sintassi:**

```text
/msg StatServ CHANSTATS #canale
```

**Esempio:**

```text
/msg StatServ CHANSTATS #irchelp
```

### StatServ - HELP

È il comando per ottenere help on-line sul servizio StatServ.

**Sintassi:**

```text
/msg StatServ HELP [comando]
```

**Esempi:**

```text
/msg StatServ HELP
/msg StatServ HELP CHANSTATS
```

## I comandi di HelpServ

Per informazioni sugli aiuti on line digita `/msg HelpServ HELP`

Per visualizzare i modi disponibili su Azzurra per nick e canali sono inoltre disponibili i seguenti comandi:

- **CMODE** - Visualizza i Channel Modes disponibili su questa rete
- **HELP** - Help on-line del servizio HelpServ
- **UMODE** - Visualizza gli User Modes disponibili su questa rete

Sono poi disponibili Help on Line per tutti i comandi.

### HelpServ - CMODE

Con questo comando si ottiene l'elenco dei Channel Modes disponibili su Azzurra.

**Sintassi:**

```text
/msg HelpServ CMODE
```

### HelpServ - HELP

È il comando per ottenere help on-line sul servizio HelpServ.

**Sintassi:**

```text
/msg HelpServ HELP
```

**Esempi:**

```text
/msg HelpServ HELP
```

### HelpServ - UMODE

Con questo comando si ottiene l'elenco degli User Modes disponibili su Azzurra.

**Sintassi:**

```text
/msg HelpServ UMODE
```

### Help on-Line

Per aiuto sulla registrazione e il controllo del nick, digita: `/msg NickServ HELP`

Per aiuto sulla registrazione e il controllo dei canali, digita: `/msg ChanServ HELP`

Per aiuto sul servizio di invio messaggi ad utenti non collegati, digita: `/msg MemoServ HELP`

Per aiuto sulla ricerca di informazioni sui nick, digita: `/msg SeenServ HELP`

Per aiuto sulla ricerca di statistiche dei canali, digita: `/msg StatServ HELP`

Per aiuto sulle modalità degli utenti o dei canali, digita: `/msg HelpServ HELP`

Help sul comando specifico si ottengono digitando:

```text
/msg ChanServ|NickServ|MemoServ|SeenServ|StatServ|HelpServ HELP comando
```

**Esempi:**

```text
/msg ChanServ HELP REGISTER
/msg ChanServ HELP SET DESC
/msg NickServ HELP GHOST
/msg NickServ HELP SET EMAIL
/msg MemoServ HELP SENDTO
/msg HelpServ HELP CMODE
```

## Modes

Su Azzurra sono disponibili vari modi utente e canale:

Le tabelle mostrano solo i modi utilizzabili dagli utenti: non comprendono l'intero set di modi supportati dal server, perché quelli riservati agli IRC Operator sono stati omessi.

- [User Modes](#user-modes) – Modi utente disponibili
- [Channel Modes](#channel-modes) – Modi canale disponibili

### User Modes

| Mode | Descrizione |
|:----:|-------------|
| a | (Services Only) Contraddistingue un Services Administrator. |
| h | (HelpOp Only) Contraddistingue un Help Operator (Il +h si può avere solo via identificazione). |
| i | Invisibile agli utenti che eseguono il comando /names o il comando /who. |
| j | Contraddistingue un client che chatta dal web tramite Java. |
| r | (Services Only) Contraddistingue un nick registrato con NickServ e identificato. |
| R | Accetta query solo da nick registrati con NickServ e identificati. |
| S | Contraddistingue un client che si connette via SSL (Secure Sockets Layer). |
| w | Permette la visione dei messaggi WALLOPS. |
| x | Cripta parte dell'host o dell'IP. |
| z | (Services Only) Contraddistingue un Services Agent. |

**Sintassi:**

```text
/umode [+|-modes]
```

oppure

```text
/mode nick [+|-modes]
```

**Esempi:**

```text
/mode ^Norad^ +w-i
/mode ^Norad^      (per vedere i modes impostati sul proprio nick)
```

### Channel Modes

| Mode | Param | Descrizione |
|:----:|:-----:|-------------|
| b | mask | Permette di bannare una mask nel formato nick!user@host (o anche solo un nick) da un canale. |
| B | | Nasconde la lista dei ban a chi non e' operatore o halfop del canale. |
| c | | Impedisce di inviare al canale messaggi che contengano colori. |
| C | | Impedisce di inviare CTCP al canale. |
| d | | Impedisce di cambiare nick a chi non e' operatore, halfop o voice nel canale. |
| h | nick | Permette di settare un nickname come half operator del canale. |
| i | | Rende il canale solo ad invito. |
| j | | Permette solo a chi è identificato ad un nick registrato di entrare nel canale. |
| k | key | Rende il canale protetto da password. |
| l | max | Setta il massimo numero di utenti che possono stare nel canale. |
| m | | Rende il canale moderato: solo i **+o**, **+h** e **+v** possono parlare. |
| M | | Rende il canale moderato: solo chi è identificato può parlare oppure i **+o**, **+h** e **+v**. |
| n | | Proibisce l'invio al canale di messaggi dall'esterno. |
| o | nick | Permette di settare un nickname come operatore del canale. |
| p | | Rende il canale privato (non appare nei /WHOIS, il topic e' nascosto nei /LIST). |
| r | | (Services Only) Contraddistingue un canale registrato con ChanServ. |
| R | | Permette solo ai nick registrati con NickServ di entrare nel canale. |
| s | | Rende il canale segreto (non appare nei /WHOIS o nei /LIST). |
| S | | Permette solo ai nick connessi in SSL di entrare nel canale. |
| t | | Permette solo agli operatori di cambiare il topic. |
| u | | Non mostra i messaggi di QUIT e PART di utenti del canale. |
| U | | Permette agli utenti esteri non identificati di entrare nel canale. |
| v | nick | Concede ad un nickname il diritto di voce su un canale moderato (+m). |
| z | mask | Chi corrisponde alla mask entra nel canale solo se identificato con NickServ. |

Il mode **j** non è al momento supportato dai servizi.

**Sintassi:**

```text
/mode #canale [+|-modes [parametri]
```

**Esempi:**

```text
/mode #irchelp +mi
/mode #IRCHelp +l 10238
/mode #irchelp +k finalmentesoli
/mode #irchelp +m-si
/mode #irchelp +b *pippo@*interbusiness.it
/mode #irchelp +o Gulliver
/mode #irchelp         (per vedere i mode impostati)
/mode #irchelp +b        (per vedere i ban impostati)
```

## Comandi del server

I comandi utente del server IRC di Azzurra (Bahamut): apri il comando che ti serve.


### ADMIN

Fornisce informazioni amministrative sul server. Se **dest** è specificato, la risposta verrà fornita dal server indicato: può essere specificato un nick o l'indirizzo di un server.

**Sintassi:**

```text
/ADMIN [dest]
```

**Esempi:**

```text
/ADMIN
/ADMIN tin.azzurra.chat
/ADMIN cheapnet*
```

### AWAY

Se il **messaggio** è specificato, mette in away e il **messaggio** appare nel whois; altrimenti rimuove lo stato di away.

**Sintassi:**

```text
/AWAY [:messaggio]
```

**Esempi:**

```text
/AWAY Sto lavorando, non disturbare
/AWAY
```

### DCCALLOW

Aggiunge o rimuove nick dalla lista di DCC permesse. Chi è su questa lista potrà mandarti file con estensioni normalmente bloccate dal server. Con l’opzione list viene fornita la lista delle persone al momento sulla tua DCC allow list. L’opzione help fornisce informazioni analoghe a quanto detto qui.

**Sintassi:**

```text
/DCCALLOW +|-nick[,+|-nick ...]
/DCCALLOW LIST
/DCCALLOW HELP
```

**Esempi:**

```text
/DCCALLOW +Mirtilla,+Antonio
/DCCALLOW –Robert
/DCCALLOW LIST
```

### HELP

Fornisce la lista dei comandi disponibili, uno per riga.

**Sintassi:**

```text
/HELP
```

### INFO

Fornisce informazioni sul server a cui sei connesso, o su un server remoto se è specificato in **dest**: può essere indicato un nick o l'indirizzo di un server.

**Sintassi:**

```text
/INFO [dest]
```

**Esempi:**

```text
/INFO
/INFO sbrize.azzurra.chat
```

### INVITE

Invita **nick** nel canale specificato.

**Sintassi:**

```text
/INVITE nick #canale
```

**Esempio:**

```text
/INVITE kavia #irchelp
```

### ISON

Fornisce la lista dei nick indicati che sono al momento online, se ce ne sono.

**Sintassi:**

```text
/ISON nick[ nick ...]
```

**Esempi:**

```text
/ISON ^Norad^
/ISON Mirtilla ^Ruby^ Casper
```

### JOIN

Cerca di entrare nel(i) canale(i) specificato(i), con la(e) chiave(i) specificata(e), se richiesta(e). Ogni chiave corrisponde ad un canale nella stessa posizione nella lista; per esempio `"JOIN #c1,#c2,#c3 k2,k3"` non è corretto se le chiavi k2 e k3 sono per #c2 e #c3, rispettivamente. Invece `"JOIN #c1,#c2,#c3 k1,k2"` è corretto se i primi due canali richiedono le chiavi indicate. Specificando 0 come nome del canale si ottiene l’uscita da tutti i canali in cui si è.

**Sintassi:**

```text
/JOIN #canale[,#canale ...] [key[,key ...]]
```

**Esempi:**

```text
/join #irchelp
/join #irchelp,#canale
/join #irchelp paperotto
/join #irchelp,#canale war54,ciliegia
```

### KICK

Espelle il(i) nick specificato(i) dal(i) canale(i) specificato(i), con un motivo opzionale. I kick vengono eseguiti per tutti i nick indicati in tutti i canali indicati.

**Sintassi:**

```text
/KICK #canale[,#canale ...] nick[,nick ...(2)] [:motivo]
```

**Esempi:**

```text
/kick #IRCHelp ^L4m3r^ Non disturbare
/kick #irchelp,#canale warBoT Niente guerra qui
```

### LINKS

Fornisce la lista dei server al momento connessi alla rete. Se viene specificata una mask vengono forniti solo i link che corrispondono. Se viene specificato **dest** la richiesta viene inviata al server remoto indicato.

I colori distinguono i server allo stesso “livello”, cioè server con lo stesso hopcount saranno rappresentati con lo stesso colore.

Hopcount è il numero di “salti” che occorre fare per raggiungere quel dato server partendo dal server a cui si è connessi o dal server **dest** specificato.

**Sintassi:**

```text
/LINKS [dest][mask]
```

**Esempi:**

```text
/LINKS
/LINKS 2night.azzurra.chat *.azzurra.chat
```

### LIST

Fornisce la lista dei canali aperti.

**Sintassi:**

```text
/LIST [opzioni]
```

Le opzioni disponibili sono:

| Opzione | Descrizione |
|---------|-------------|
| `>utenti` | fornisce la lista dei canali con almeno un numero di utenti superiore ad utenti |
| `<utenti` | fornisce la lista dei canali con un numero di utenti inferiore ad utenti |
| `mask` | fornisce la lista dei canali il cui nome corrisponde alla mask fornita |
| `!mask` | fornisce la lista dei canali il cui nome non corrisponde alla mask fornita |
| `canale` | la lista comprende solo il canale indicato |

**Esempi:**

```text
/LIST
/LIST >30
/LIST <50
/LIST >1 <20
/LIST *musica*
/LIST #irchelp
```

### LUSERS

Fornisce statistiche sull’utenza. Se viene specificato **dest**, la risposta verrà fornita dal server indicato: può essere specificato un nick o l'indirizzo di un server. Il secondo parametro (*) non ha significato ma viene mantenuto per compatibilità con versioni precedenti.

**Sintassi:**

```text
/LUSERS [* dest]
```

**Esempi:**

```text
/LUSERS
/LUSERS * caltanet.azzurra.chat
```

### MODE nick

Modifica i modi utente (se specificati) e fornisce i modi utente correnti. **nick** deve essere il nick di chi esegue il comando. Un '+' attiva il modo, mentre un '-' lo disattiva. I modi possono essere associati, ad esempio: `"/MODE mynick +i-wg+s"` (attiva i modi 'i' e 's', e disattiva i modi 'w' e 'g'). Si possono settare al massimo 6 modi per comando.

**Sintassi:**

```text
/MODE nick [+|-modes]
```

**Esempi:**

```text
/mode ^Norad^ +w-i
/mode ^Norad^
```

### MODE #canale

Come MODE nick, ma per i canali. Alcuni modi canale richiedono parametri, che sono separati da spazi.

**Sintassi:**

```text
/MODE #canale [+|-modes [parametri]]
```

**Esempi:**

```text
/mode #IRCHelp +l 10526
/mode #irchelp +k finalmentesoli
/mode #irchelp +m-si
/mode #irchelp +b *pippo@*interbusiness.it
/mode #irchelp +o Gulliver
/mode #irchelp (per vedere i mode impostati)
/mode #irchelp +b (per vedere i ban impostati)
```

### MOTD

Fornisce il Messaggio Del Giorno (Message Of The Day). Se viene specificato **dest**, la risposta viene fornita dal server specificato che può essere un nick o l'indirizzo di un server.

**Sintassi:**

```text
/MOTD [dest]
```

**Esempi:**

```text
/MOTD
/MOTD wmgitalia.azzurra.chat
```

### NAMES

Fornisce la lista dei client presenti nel canale specificato, con l’indicazione eventuale dello stato di op o voice. I nomi nei canali +s vengono forniti solo se si è in quel momento presenti nel canale; stessa cosa vale per i client settati +i (invisibili).

**Sintassi:**

```text
/NAMES #canale
```

**Esempio:**

```text
/NAMES #irchelp
```

### NICK

Cambia il tuo nickname.

**Sintassi:**

```text
/NICK nickname
```

**Esempio:**

```text
/NICK ^Norad^
```

### NOTICE

Può essere usato per inviare notice (avvisi) al nick specificato (o a una lista di nick). Se è specificato il nome del server del destinatario l’avviso sarà inviato solo se il nick è connesso a quel server. È una misura di sicurezza, soprattutto per i services del network.

Può anche essere usato per inviare notice al canale specificato (o a una lista di canali). Se il nome del canale è preceduto dal carattere '@', l’avviso sarà inviato a tutti gli op del canale. In modo simile, con il simbolo '+' l’avviso sarà diretto a tutti i voice, e ad entrambi se sono presenti i due simboli insieme.

**Sintassi:**

```text
/NOTICE nick[@nomeserver][,nick[@nomeserver] ...(18)] :messaggio
/NOTICE [@][%][+]#canale[,[@][%][+]#canale ...(18)] :messaggio
```

**Esempi:**

```text
/NOTICE Rodolfo Stammi lontano che non voglio parlarti
/NOTICE Mirtilla,Casper,Antonio Facciamo un quiz?
/NOTICE #irchelp Buonasera!
/NOTICE @+#IRCHelp Ci vediamo domani
```

### PART

Consente di uscire dal #canale con un messaggio opzionale.

**Sintassi:**

```text
/PART #canale[,#canale ...] [:messaggio]
```

**Esempi:**

```text
/PART #irchelp A dopo!
/PART #irchelp,#canale esco, ci vediamo
```

### PRIVMSG

Può essere usato per inviare un messaggio al nick specificato (o a una lista di nick). Se viene specificato il nome del server di destinazione, il messaggio sarà inviato solo se il nick è connesso al server indicato. È una misura di sicurezza, soprattutto per i services del Network.

Pùò anche essere usato per inviare un messaggio ad un canale specificato (o ad una lista di canali). Se il nome del canale è preceduto dal carattere '@', il messaggio sarà inviato a tutti gli op del canale. In modo simile, con il simbolo '+' il messaggio sarà diretto a tutti i voice, e ad entrambi se sono presenti i due simboli insieme.

**Sintassi:**

```text
/PRIVMSG nick[@nomeserver][,nick[@nomeserver] ...(18)] :messaggio
/PRIVMSG [@][%][+]#canale[,[@][%][+]#canale ...(18)] :messaggio
```

**Esempi:**

```text
/PRIVMSG Martin Ti va di chiacchierare?
/PRIVMSG _ZIP_,Jenny Sono tornato!
/PRIVMSG #irchelp Buonasera!
/PRIVMSG @%+#irchelp Ciao
```

### QUIT

Disconnette da IRC, con un commento opzionale.

**Sintassi:**

```text
/QUIT [:commento]
```

**Esempi:**

```text
/QUIT
/QUIT Torno dopo
```

### SILENCE

Aggiunge o toglie la mask nick!user@host specificata dalla silence list. Client che hanno una mask corrispondente ad una nella silence non potranno inviarti PRIVMSG o NOTICE. Se non viene specificata una mask, il comando fornisce un elenco delle mask presenti nella tua silence list. Nella lista possono essere presenti al massimo 10 mask. La lista si svuota alla disconnessione.

**Sintassi:**

```text
/SILENCE [+|-mask]
```

**Esempi:**

```text
/SILENCE +*!*bau@*tiscali.it
/SILENCE –Casper!*@*
/SILENCE
```

### STATS

Fornisce statistiche dal server. Se viene specificato **dest**, la risposta viene fornita dal server indicato: può essere specificato un nick o l'indirizzo di un server.

**Sintassi:**

```text
/STATS flag [dest]
```

Non ci sono flag disponibili per gli utenti

### TIME

Fornisce l’ora locale del server. Se viene specificato **dest**, la risposta viene fornita dal server indicato: può essere specificato un nick o l'indirizzo di un server.

**Sintassi:**

```text
/TIME [dest]
```

**Esempi:**

```text
/TIME
/TIME cheapnet.azzurra.chat
```

### TOPIC

Mostra il topic di un canale o lo cambia se ne viene specificato uno.

**Sintassi:**

```text
/TOPIC #canale [topic]
```

**Esempi:**

```text
/TOPIC #irchelp
/TOPIC #IRCHelp =A= Azzurra IRC Help Channel =A= http://help.azzurra.chat prima di domandare =A=
```

### USERS

Fornisce il numero di utenti locali e globali (correnti e massimi). Se viene specificato **dest**, la risposta verrà fornita dal server indicato: può essere specificato un nick o l'indirizzo di un server.

**Sintassi:**

```text
/USERS [dest]
```

**Esempi:**

```text
/USERS
/USERS ssitalia.azzurra.chat
```

### USERHOST

Fornisce informazioni sintetiche sul(i) nick specificato(i). Per prima cosa il nickname, seguito da un '*' se è un IRCop, il carattere '=', '-' se away ('+' se non lo è), username@hostname. Risposte multiple sono separate da spazi.

**Sintassi:**

```text
/USERHOST nick[ nick ...(3)]
```

**Esempi:**

```text
/USERHOST Casper,Mirtilla,Alberto
/USERHOST ^Norad^
        > ^Norad^*=-~Norad@birillo.tiscali.com
```

### VERSION

Fornisce informazioni sulla versione dell’IRCd per il server a cui sei connesso, o per un server remoto se specificato. Se viene specificato **dest**, la risposta verrà fornita dal server indicato: può essere specificato un nick o l'indirizzo di un server.

**Sintassi:**

```text
/VERSION [dest]
```

**Esempi:**

```text
/VERSION
/VERSION b-network.azzurra.chat
```

### WATCH

Aggiunge o toglie il(i) nick specificato(i) dalla watch list. Verrai notificato quando qualcuno nella tua watch list si connette o si sconnette. Se non viene specificato un nick, verrà fornita la lista dei nick nella watch list al momento online. Lo stesso comando si usa per avere informazioni sulla propria watch list. Nella lista possono essere presenti al massimo 128 nick.

**Sintassi:**

```text
/WATCH [+|-nick][ +|-nick ...]
/WATCH [flag]
```

Flag disponibili sono:

| Flag | Descrizione |
|------|-------------|
| `c\|C` | pulisce la watch list |
| `s\|S` | mostra lo stato generale |
| `l` | fornisce informazioni sui nick online al momento |
| `L` | fornisce informazioni su tutti i nick |

**Esempi:**

```text
/WATCH +Mirtilla
/WATCH C
/WATCH L
```

Normalmente questi comandi vengono gestiti dal client. In mIRC dal comando NOTIFY.

### WHO

Fornisce informazioni sul nick, canale o utenti specificati.

**Sintassi:**

```text
/WHO nick
/WHO #canale
/WHO mask
/WHO +|-flags [parametri]
```

Specificando un nick o un canale fornisce le informazioni seguenti: canale nickname, username, hostname, server di connessione, hopcount cioè numero di server tra nick e chi da il comando, flag di stato, e real name, nel formato:

```text
[server] [#canale] nickname H|G[S][*][@|%|+] user host :hopcount real_name
```

Specificando un canale fornisce informazioni su tutti i client in quel canale. Mirc non mostra il server di connessione; il canale viene specificato solo se viene eseguito un `/who #canale`.

Le lettere H|G stanno a significare Here (presente) e Gone (away, non presente).

S è presente se l’utente usa una connessione SSL.

L’asterisco * contraddistingue gli IRCop.

@ % e + sono il livello di accesso al canale: Op, HalfOp o Voice.

Hopcount è il numero di “salti” di server che occorre fare per raggiungere quel dato utente.

Ad esempio:

```text
#irchelp ^Norad^ H*S @ ~Norad@birillo.tiscali.com :3 =^.^= Rauha =^.^=
```

Fornendo una mask: se la mask contiene un '.', viene confrontata con gli hostnames di tutti client online visibili (non settati +i); altrimenti viene confrontata con i nick di tutti i client online visibili. Vengono fornite informazioni su tutti i client per cui è stata trovata una corrispondenza.

I flag devono essere specificati come i modi utenti o canale – p.es. "-a+c" significa "non away" e "sul canale specificato". I flag sono i seguenti:

| Flag | Parametro | Descrizione |
|------|-----------|-------------|
| `a` | | l’utente è away |
| `C` | | mostra il primo canale visibile in cui è l’utente |
| `M` | | cerca utenti nello stesso canale in cui sono io |
| `c` | `#canale` | l’utente è sul canale specificato (no wildcards) |
| `h` | `mask` | l’host dell’utente corrisponde alla mask |
| `m` | `umodes` | l’utente ha gli specificati usermodes (solo o/A/a) |
| `n` | `mask` | il nick corrisponde alla mask specificata |
| `s` | `server` | l’utente è sul server specificato (no wildcards) |
| `u` | `mask` | l’username dell’utente corrisponde alla mask specificata |

**Esempi:**

```text
/WHO ^Norad^
/WHO #irchelp
/WHO +ch #irchelp *pool8250.interbusiness.it
```

### WHOIS

Fornisce informazioni sul nick specificato (o su una lista di nick): nickname, username, hostname, real name, canali in cui è, server di connessione, info sul server di connessione, stato di registrazione del nick, stato di away, stato di IRC operator, modi utente e tempo di inattività (idle time) [Quest’ultima solo nel caso che l’utente sia sullo stesso server o che la richiesta venga fatta al server a cui è connesso, oppure mettendo il nick anche come **dest**]. Se viene specificato **dest** la richiesta è inviata al server indicato: può essere specificato un nick o l'indirizzo di un server.

**Sintassi:**

```text
/WHOIS [dest] nick[,nick ...]
```

**Esempi:**

```text
/WHOIS Mirtilla
/WHOIS Antonio,Robert
/WHOIS Casper Casper
/WHOIS libero.azzurra.chat Casper
```

### WHOWAS

Fornisce le informazioni registrate sul nick specificato (o su una lista di nick) quando era online: nickname, username, hostname, real name, server di connessione, e ora di disconnessione (UTC). Se viene specificato **max**, le informazioni vengono fornite solo per le ultime **max** volte che il nick è stato usato; di default vengono fornite tutte. Se viene specificato **dest**, la richiesta è inviata al server remoto (le informazioni vengono limitate agli ultimi 20 casi): può essere specificato un nick o l'indirizzo di un server.

**Sintassi:**

```text
/WHOWAS nick[,nick ...] [max [dest]]
```

**Esempi:**

```text
/WHOWAS ^Norad^
/WHOWAS Mirtilla,Casper
/WHOWAS Alfredo5 nexlab.azzurra.chat
```

**NOTA:** I due punti (:) nella sintassi di alcuni comandi servono per far capire all’IRCd che quello che segue è di lunghezza indefinita; in realtà molti client elaborano i comandi per cui i due punti non sono necessari (e non sono stati inseriti negli esempi), anzi se vengono inseriti nel comando appaiono poi nel messaggio o nel motivo specificato.

Alcuni comandi inoltre vengono riconosciuti dai client come comandi propri. Per fare in modo che vengano passati al server senza essere processati dal client occorre anteporre `/QUOTE` al comando.

**Esempi:**

```text
/QUOTE VERSION
/QUOTE HELP
```

## Varie

Una breve guida per spiegare come risolvere alcuni dei problemi più comuni che gli utenti potrebbero rilevare.

- [Comandi IRC](#comandi-del-server) – I comandi utente dell’IRC daemon di Azzurra
- [Help Ident](#help-ident) - Cos'è la ~ davanti allo username
- [Help DCC](#help-dcc) - Alcuni trasferimenti di files possono venire bloccati dal server
- [Maschere di riconoscimento](#maschere-di-riconoscimento-su-irc) – A cosa servono e come si determinano le mask
- [Dettagli di Azzurra](#dettagli-di-azzurra-irc-network) – Particolarità della rete
- [I Server di Azzurra](#i-server-di-azzurra) – Server linkati ed indirizzi

Per maggiori informazioni, una volta connessi al network digitare: `/join #IRCHelp`

### Help Ident

Non serve configurare nulla: su Azzurra l'Ident non è obbligatorio. Se il tuo client non risponde alla richiesta Ident, il server mette una `~` davanti al tuo username (ad esempio `~pippo@host`) e la connessione prosegue normalmente.

Se lo username contiene caratteri non ammessi, il server li sostituisce con `_`; rifiuta la connessione solo se lo username contiene una `@` o è comunque non valido. In quel caso cambia lo username (o l'indirizzo e-mail, da cui molti client lo ricavano) nelle opzioni del client.

### Help DCC

Per default, il server blocca il trasferimento in DCC di files con estensioni .JS, .PL, .EXE, .COM, .BAT, .DLL, .INI, .VBS, .PIF, .MRC, .SCR, .DOC, .XLS, .LNK, .SHS, .ZIP, .RAR, .ACE, .PHP, .ASP, .HTA, .HTM e .HTML in quanto probabili veicoli di virus e trojans. In questo caso chi invia il file avrà un messaggio di questo genere:

```text
-irc.azzurra.chat- Per l'invio di files *.exe e' richiesta l'autorizzazione del ricevente. Fai sapere a NICK che deve digitare /DCCALLOW +NICK per poter ricevere questo file.
```

mentre chi dovrebbe riceverlo avrà una notice di questo tipo:

```text
-irc.azzurra.chat- L'utente NICK (user@host) ha provato ad inviarti un file chiamato nomefile.exe. Per la ricezione di questo file e' necessaria la tua autorizzazione. Se hai la certezza che non si tratti di un file infetto, digita /DCCALLOW +NICK per riceverlo.
```

Nel caso comunque in cui il ricevente sia certo della sicurezza del file, è necessario utilizzare il comando `/DCCALLOW` per permettere la ricezione di files di quel tipo provenienti da un determinato nick.

Sintassi del comando **DCCALLOW**:

- `/DCCALLOW +nickmittente` (permette la ricezione di file provenienti da nickmittente)
- `/DCCALLOW -nickmittente` (blocca la ricezione di file sospetti provenienti da nickmittente)
- `/DCCALLOW LIST` (visualizza la lista dei nick dai quali si consente la ricezione di file sospetti)

**Nota**: La DCCALLOW list si svuota ogni qualvolta vi disconnettete dal server. Inoltre, appena un utente presente nella vostra lista si disconnette dal server, viene automaticamente tolto dalla vostra lista.

**Esempio:**

**nick1** invia via DCC file.exe a **nick2**\
a **nick1** verrà visualizzato il messaggio di cui sopra\
**nick2**, per ricevere il file, dovrà digitare `/DCCALLOW +nick1` e farsi inviare di nuovo il file\
per togliere poi **nick1** dalla lista, **nick2** dovrà digitare `/DCCALLOW -nick1`

### Maschere di riconoscimento su IRC

Spesso e volentieri i comandi di IRC e dei servizi chiedono come parametro una 'mask', e questo lascia interdetti coloro che non hanno dimestichezza al riguardo. Questo breve testo si propone di chiarire un po’ le idee su cosa sia una mask e come possa essere usata per identificare un utente o una connessione.

A ciascun utente su IRC è associata una mask, ossia un insieme di caratteri e numeri che caratterizzano la sua connessione al server.\
Questa mask è visibile attraverso un certo numero di comandi, per esempio il whois. Dunque andiamo ad esaminare la maschera più nel dettaglio, richiedendo informazioni su un ipotetico nick 'pippo' con il comando `/whois pippo`.\
Verrà fuori qualcosa di questo tipo:

```text
pippo is carota@62.98.Azzurra-3A0D51CC
...
altre informazioni
...
```

La parte del whois che ci interessa è quella dove compare la mask (di solito una delle prime righe). La maschera è strutturata in tre parti:

```text
nick!user@host
```

Come si può vedere un punto esclamativo separa il nick dall'user e una chiocciola separa l'user id dall'host. In particolare nel whois viene mostrata solo la parte user@host , senza il nick che del resto è lì vicino. Quindi riprendendo l'esempio precedente, la mask completa sarebbe:

```text
pippo!carota@62.98.Azzurra-3A0D51CC
```

Dunque, così come possiamo fare riferimento ad un utente attraverso il suo nick (quello che siamo abituati a fare), per determinati scopi può far comodo fare riferimento alla sua maschera o, meglio ancora, a parte di essa.

Prendiamo per esempio un classico comando in cui si adopera la mask, il ban. Per bannare possiamo usare `/mode #canale +b NICK` , ma questo metterà semplicemente un ban sul nick, nella forma `nick!*@*`\
Cosa siano quegli asterischi che sostituiscono gli altri due campi vuoti lo vedremo dopo.

In base a quanto detto prima, potremmo bannare utilizzando, invece che il nick, un'altra parte della maschera. Del resto un ban sul nick è piuttosto inefficace, visto che all'interessato basterà cambiare nick per rientrare sul canale.\
Dunque ricaviamo la maschera del tizio (magari attraverso un whois) e usiamola per un ban. Immaginiamo che la mask sia sempre

```text
pippo!carota@62.98.Azzurra-3A0D51CC .
```

Scriviamo `/mode #canale +b *!*@62.98.Azzurra-3A0D51CC`\
Questo è un ban più interessante. E' bene a questo punto spiegare cosa siano quegli asterischi. Il carattere **\*** un 'carattere jolly' e il significato è 'qualunque cosa sia scritta al mio posto'. Quindi, quel ban si può leggere così:

> effettua l'operazione (in questo caso il ban) su:\
> qualunque nick e qualunque user id che abbia come host\
> 62.98.Azzurra-3A0D51CC

È facile immaginare che a questo punto al tizio non basterà cambiare nick per rientrare nel canale, visto che il ban è specificato con la **\*** al posto del nick nella maschera, per cui il ban funziona su qualunque nick. Dovrà cambiarsi l'host, e questo nella migliore delle ipotesi significherà ricollegarsi ad internet, con tutti i disagi del caso (specie considerando che un ban si rimette in un attimo).

Analogamente potremmo mettere un ban di questo tipo:

```text
/mode #canale +b *!carota@*
```

Se avete afferrato il concetto, avrete già interpretato in modo corretto nella vostra mente questo ban:

> qualunque nick e qualunque host, che abbiano come userid\
> carota

Immaginate cosa succederebbe mettendo un ban di questo tipo:

```text
/mode #canale +b *!*@*
```

Bisognerebbe avere delle ragioni particolari per mettere una cosa del genere:\
in effetti il suo significato è 'tutto': qualunque nick, qualunque user id, qualunque host. Applicando una maschera simile ad un ban il suo effetto sarebbe tener fuori tutti gli utenti da un canale.\
È questa infatti la mask che usa ChanServ per bannare tutti gli utenti di un canale in caso di masskick.

Non è detto che un carattere jolly debba prendersi per forza un intero campo della maschera tutto per sé.. ci si può divertire molto di più, vediamo qualche esempio...

`/mode #canale +b pi*!*@*` , questo ban viene attivato su tutti quelli che hanno un nick che comincia per pi (con qualunque user id e qualunque mask). Quindi sia pippo che pirata e pikachu saranno tenuti fuori da un ban di questo tipo.

`/mode #canale +b *pi*!*@*` , questo ban viene attivato su tutti quelli che hanno un nick che contiene pi (con qualunque user id e qualunque mask). Per esempio saranno tenuti fuori pippo, bepi, arpia.

`/mode #canale +b *p*i*!*@*` , questo ban viene attivato su tutti quelli che hanno un nick che contiene le lettere 'p' e 'i' , in quell'ordine ma non per forza attaccate (con qualunque user id e qualunque mask). Per esempio saranno tenuti fuori pippo, pamila, serpi.

`/mode #canale +b pippo!*@*carota.it` , questo ban viene attivato su tutti quelli che hanno il nick pippo E hanno l'host che finisce per carota.it

`/mode #canale +b man?!*@*` , qui usiamo l'altro carattere jolly a nostra disposizione, ossia ? . Mentre * voleva dire 'qualunque cosa (anche nulla) al mio posto' , il carattere ? vuol dire 'un solo carattere o numero al mio posto (e deve esserci per forza)'. Dunque questo ban funzionerà come sempre su qualunque user id e qualunque host, che abbiano come nick mano , mani, mant , man5, man] . NON funzionerà invece su man oppure su manto. Questo perché il simbolo ? chiede un solo carattere al suo posto, e lo chiede in modo obbligatorio.

`/mode #canale +b *!????@*` , questo ban viene attivato su tutti quelli che hanno un ident di esattamente 4 caratteri, con qualunque nick e qualunque host.

Tutto questo l'abbiamo visto per il ban, ma è chiaro che tutto questo discorso è utile per definire un utente o un insieme di utenti che sono coinvolti in un qualsiasi comando che permetta l'uso di una mask.

### Dettagli di Azzurra IRC Network

L’IRCd utilizzato su Azzurra è Bahamut con patch sviluppate dallo staff per la criptazione dell’IP e per il supporto SSL (Secure Sockets Layer) e IPv6.

I servizi, in precedenza basati sui Sirv, sono stati riscritti da zero dallo staff di Azzurra, che si occupa costantemente del loro aggiornamento.

Su Azzurra gli stati possibili sono voice (+v), halfop (+h) e op (+o), contraddistinti rispettivamente da + , % e @.

Su Azzurra possono essere aperti &canali locali, accessibili solo dai client connessi allo stesso server di chi ha aperto il canale, e #canali globali. Solo questi ultimi possono essere registrati.

Il nome del canale può essere al massimo di 32 caratteri, compreso il # iniziale.

È possibile entrare in un massimo di 15 canali contemporaneamente.

In un canale è possibile settare un massimo di 100 ban.

Nel nick sono ammessi i caratteri ascii da ALT+65 ad ALT+125, cioè le lettere maiuscole e minuscole ed i caratteri `` [ \ ] ^ _ ` { | } `` ; anche i numeri e – sono ammessi, ma non come primo carattere.

Un nick può essere lungo al massimo 30 caratteri, il realname al massimo 50.

L’User ID o ident può essere lungo al massimo 10 caratteri. Come primo carattere è presente ~ se non si dispone di un ident server.

L’host può essere lungo al massimo 63 caratteri; nel caso sia più lungo, compare l’IP (criptato o meno a seconda che sia impostata l’opzione +x sul nick oppure no).

Su Azzurra sono consentite 3 connessioni simultanee (cloni) dallo stesso IP. Alla quinta si viene akillati (bannati da Azzurra) per 10 minuti.

I topic e i messaggi di kick possono essere lunghi al massimo 307 caratteri, quelli di quit al massimo 301 (poiché il messaggio comprende “quit: ”).

Per quanto riguarda la lunghezza massima di messaggi e notice: il massimo consentito è **512** caratteri, ma in questi sono compresi anche quelli del comando stesso: “nick_mittente!user@host PRIVMSG nick_destinatario :”, nonché due caratteri di controllo finali.

Al momento della connessione sono riportati molti dati utili. Ad esempio:

| Dato | Significato |
|------|-------------|
| `sbrize.azzurra.chat` `bahamut(enterprise)-1.4(34)-azzurra(4.6rc9)-ssl(1.1)` | [server, ircd utilizzato e versione] |
| `oOiwscrknfydaAbghexzSjFI` `bhijklmMnoOprRstvcdSuU` | [usermodes e chanmodes disponibili] |
| `NOQUIT` | [impostazione dell'ircd sul comportamento durante i netsplit] |
| `WATCH=128` | [numero massimo di entry nella notify list] |
| `SAFELIST` | [con questo parametro il comando /list non causa disconnessione per flood] |
| `MODES=6` | [numero massimo di modes impostabili contemporaneamente] |
| `MAXCHANNELS=15` | [numero massimo di canali joinabili contemporaneamente] |
| `MAXBANS=100` | [numero massimo di ban impostabili su un canale] |
| `NICKLEN=30` | [lunghezza massima dei nick] |
| `TOPICLEN=307` | [lunghezza massima dei topic] |
| `KICKLEN=307` | [lunghezza massima dei messaggi di kick] |
| `CHANTYPES=&#` | [tipi di chan disponibili: & locali; # globali] |
| `PREFIX=(ohv)@%+` | [livelli di accesso al canale possibili: @ op, % halfop, + voice] |
| `NETWORK=Azzurra` | [nome del network] |
| `SILENCE=10` | [numero massimo di mask impostabili in silence] |
| `CASEMAPPING=ascii` | [indica il sistema utilizzato dall'ircd per il confronto maiuscole/minuscole] |
| `CHANMODES=b,k,l,cdijmMnOprRsStuU` | [chanmodes disponibili] |

### I server di Azzurra

È possibile vedere i server che formano la rete di Azzurra con il comando **LINKS**. L'elenco cambia nel tempo: per connettersi basta l'indirizzo round robin, che indirizza al primo server disponibile.

| Parametro | Valore |
|-----------|--------|
| **Server** | `irc.azzurra.chat` |
| **Porte** | `6666`, `6667`, `6668`, `6669` (non cifrate; `6667` è la standard) |
| **Porte SSL** | `6697`, `9999` (consigliate) |
| **IPv6** | supportato, stesso indirizzo |

Per chi non vuole installare un client, o si trova in una rete che lascia passare solo il web, c'è la webchat dal browser:\
<https://webchat.azzurra.chat>
