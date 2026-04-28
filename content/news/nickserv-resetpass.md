---
title: "NickServ: nuovo comando RESETPASS per recuperare la password"
date: 2026-04-20
author: "Staff Azzurra"
tags: ["annuncio", "services", "nickserv"]
summary: "Recuperare un nick con password dimenticata non implica più ricevere la password in chiaro via e-mail: ora arriva un codice monouso e la nuova password la scegli tu."
---

Siamo lieti di annunciare una **nuova funzionalità dei servizi**: il comando **RESETPASS** di NickServ, che permette di reimpostare la password del proprio nick quando la si è dimenticata — a patto di avere un'**e-mail registrata valida**.

Il flusso utente resta sostanzialmente lo stesso di prima — passi sempre da uno staffer in `#IRCHelp` — ma cambia la **meccanica dietro le quinte**, e cambia in meglio dal punto di vista della sicurezza:

- **Prima:** lo staff faceva partire l'invio della tua password **in chiaro** alla tua e-mail registrata. Tu la usavi per identificarti e poi, eventualmente, la cambiavi a mano.
- **Adesso:** lo staff fa partire l'invio di un **codice di autorizzazione monouso**. Tu lo usi insieme a una **nuova password scelta da te** per fare il reset. La tua password vecchia non viene mai recuperata, e la nuova non transita mai dalle mani dello staff.

## Come funziona

1. **Chiedi il reset in `#IRCHelp`**: uno staffer farà partire l'invio alla tua e-mail registrata di un **codice di autorizzazione** monouso (il passaggio è mediato dallo staff per evitare abusi automatizzati).
2. **Controlla la tua casella e-mail** e copia il codice ricevuto.
3. **Esegui RESETPASS** scegliendo tu la nuova password:

   ```
   /ns RESETPASS <nick> <codice> <nuova-password>
   ```

   Se il codice è corretto, la password viene sostituita immediatamente e puoi fare `/ns identify` con la nuova.

## Requisiti

- Il nick deve avere un'**e-mail registrata** e ancora valida.
- La password precedente **non è necessaria** — lo scopo del comando è proprio recuperare l'accesso senza conoscerla.
- Il codice è monouso e ha una scadenza; se scade, basta richiederne uno nuovo in `#IRCHelp`.

## Se non hai più l'e-mail

Se non hai più accesso all'e-mail registrata, il reset via codice non è possibile: in quel caso resta valida la procedura manuale tramite staff.

## Perché il cambiamento

L'invio della password **in chiaro** via e-mail era una pratica che mostrava la sua età: una password recuperabile in chiaro è una password che, di fatto, lo staff è in grado di leggere prima di te, e che chiunque abbia accesso temporaneo alla tua casella di posta può estrarre senza nemmeno dover cambiare nulla. Spostare il flusso a un **codice di autorizzazione monouso** seguito da un reset scelto dall'utente elimina entrambi i problemi senza richiedere modifiche al modo in cui si chiede aiuto.

---

Come sempre, continuiamo a lavorare per rendere i servizi più accessibili e la vita degli utenti più semplice.

Ci vediamo in chat 👋
