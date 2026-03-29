---
title: "Il Network"
lead: "L'infrastruttura tecnica di Azzurra: server, servizi e architettura della rete."
---

## Architettura

Azzurra utilizza il protocollo IRC su daemon **Bahamut**, un IRCd sviluppato originariamente da DALnet e mantenuto e personalizzato dallo staff della rete nel corso degli anni.

La rete è strutturata con server **hub** (smistamento) e server **leaf** (connessione utenti), collegati tra loro in modo da garantire stabilità e ridondanza.

## Server

Il round robin principale è raggiungibile all'indirizzo:

```
irc.azzurra.chat
```

Porte standard: `6666` `6667` `6668` `6669`  
Porte SSL/TLS: `6697` `9999` 
IPv6: supportato

## Servizi

I seguenti servizi IRC sono disponibili sulla rete:

| Servizio | Descrizione |
|----------|-------------|
| **NickServ** | Registrazione e protezione dei nickname |
| **ChanServ** | Gestione e protezione dei canali |
| **MemoServ** | Sistema di messaggi offline |
| **SeenServ** | Statistiche di presenza utenti |
| **StatServ** | Statistiche di rete |

Per ottenere aiuto su un servizio: `/msg NickServ HELP` (o il nome del servizio desiderato).

## Connettività

La rete supporta connessioni sia in **IPv4** che **IPv6**. È disponibile la connessione cifrata via **TLS** su porte 6697 e 9999.

{{< info title="👋 Staff" >}}
Per informazioni tecniche sulla rete, entra su `#IRCHelp` o contatta lo staff dalla sezione [Contatti](/contatti).
{{< /info >}}
