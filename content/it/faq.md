---
title: "FAQ"
lead: "Domande frequenti su Azzurra IRC Network."
translationKey: page-faq
---

## Generali

### Cos'è Azzurra?

Azzurra è la più longeva rete IRC italiana, fondata nel 1997. Offre uno spazio di chat libero e organizzato per la community italiana e non solo.

### IRC è ancora usato oggi?

Sì! IRC è uno dei protocolli di messaggistica più stabili e aperti esistenti. Azzurra conta ancora una community attiva con decine di canali frequentati quotidianamente.

### Devo creare un account per entrare?

No. Puoi collegarti con qualsiasi nickname senza registrazione. La registrazione via **NickServ** è opzionale ma consigliata per proteggere il tuo nickname.

---

## Connessione

### Come mi connetto?

Usa la [webchat](https://webchat.azzurra.chat) direttamente dal browser, oppure un client IRC come HexChat, WeeChat o mIRC. Consulta la pagina [Come Connettersi](/come-connettersi) per tutti i dettagli.

### Quali porte devo usare?

- Porte **6666**–**6669** per connessioni in chiaro
- Porte **6697** e **9999** per connessioni cifrate TLS (consigliate)

### Posso collegarmi a un server preciso?

Sì. `irc.azzurra.chat` ti assegna uno dei server pubblici, ma puoi anche sceglierne uno:

| Server | Protocollo | Porte | Porte TLS |
|--------|-----------|-------|-----------|
| `ruby.azzurra.chat` | IPv4 | `6666`–`6669` | `6697` `9999` |
| `raccooncity.azzurra.chat` | IPv4 | `6666`–`6669` | `6697` `9999` |
| `nightwish.azzurra.chat` | IPv6 | `6666`–`6669` | `6697` `9999` |
| `allnight6.azzurra.chat` | IPv6 | `6666`–`6669` | `6697` `9999` |

### E void, devel e raptor?

Sono gli **hub** della rete: `void.azzurra.chat` è l'hub principale, `raptor.azzurra.chat` l'hub secondario, `devel.azzurra.chat` l'hub di sviluppo. Gli hub **non accettano connessioni dagli utenti**: esistono per ragioni tecniche di instradamento e collegano tra loro i server pubblici e i servizi.

### Posso usare IPv6?

Sì, la rete supporta pienamente IPv6.

---

## Nickname e account

### Come registro il mio nickname?

```
/msg NickServ REGISTER <password> <tua@email.com>
```


---

## Canali

### Come creo un canale?

Entra nel canale con `/join #nomedelcanale`. Se il canale non esiste, verrà creato e ne diventerai automaticamente l'operatore.

### Come registro un canale con ChanServ?

```
/msg ChanServ REGISTER #nomedelcanale password descrizione
```

Devi essere operatore del canale (avere il flag `@`) per registrarlo.

### Ho bisogno di aiuto in canale. A chi mi rivolgo?

Entra su `#IRCHelp`: lo staff e gli utenti esperti saranno felici di aiutarti.

---

## Problemi e segnalazioni

### Come segnalo un utente che viola il regolamento?

Entra su `#IRCHelp` e descrivi il problema. In alternativa, usa il [modulo contatti](/contatti).

### Il mio IP è stato bannato (K-Line). Cosa faccio?

Accedi alla pagina [Richiesta rimozione K-Line](/kline) e compila il modulo.
