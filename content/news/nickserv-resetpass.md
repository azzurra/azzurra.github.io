---
title: "NickServ: nuovo comando RESETPASS per recuperare la password"
date: 2026-04-20
author: "Staff Azzurra"
tags: ["annuncio", "services", "nickserv"]
summary: "Chi ha dimenticato la password del nick e ha un'e-mail registrata valida può ora resettarla in autonomia tramite un codice di autorizzazione inviato via e-mail."
---

Siamo lieti di annunciare una **nuova funzionalità dei servizi**: il comando **RESETPASS** di NickServ, che permette di reimpostare la password del proprio nick quando la si è dimenticata — a patto di avere un'**e-mail registrata valida**.

Fino ad oggi l'unico modo per recuperare un nick con password persa era passare dallo staff. Da adesso la procedura è completamente **self-service** e basata sull'e-mail già associata al nick.

## Come funziona

Il flusso è in **due passaggi** e richiede che un services operator esegua per te il primo passo (per evitare abusi automatizzati):

1. Uno services operator esegue `/ns SENDPASS <nick>` — i servizi inviano all'e-mail registrata un **codice di autorizzazione** monouso.
2. Tu, controllata la casella, esegui:

   ```
   /ns RESETPASS <nick> <codice> <nuova-password>
   ```

   Se il codice è corretto, la password viene sostituita immediatamente e puoi fare `/ns identify` con la nuova.

## Requisiti

- Il nick deve avere un'**e-mail registrata** e ancora valida.
- La password precedente **non è necessaria** — lo scopo del comando è proprio recuperare l'accesso senza conoscerla.
- Il codice è monouso e ha una scadenza; se scade, basta richiedere un nuovo SENDPASS.

## Annullare un reset in corso

Se per qualsiasi motivo vuoi annullare un reset password già richiesto (ad esempio hai cambiato idea o il codice è finito nelle mani sbagliate), uno services operator può eseguire:

```
/ns AUTHRESET <nick> RESETPASS
```

che pulisce lo stato di reset pendente **senza toccare e-mail e password** registrate.

## Come si chiede un reset

Se hai perso la password e hai ancora accesso all'e-mail registrata, scrivi in `#IRCHelp` chiedendo a uno staffer di eseguire lo `SENDPASS` per il tuo nick. Ricevuto il codice via e-mail, procedi autonomamente con `RESETPASS`.

Se invece **non hai più accesso** all'e-mail registrata, il reset self-service non è possibile: in quel caso resta valida la procedura manuale tramite staff.

---

Come sempre, continuiamo a lavorare per rendere i servizi più accessibili e la vita degli utenti più semplice.

Ci vediamo in chat 👋
