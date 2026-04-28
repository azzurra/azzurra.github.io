---
title: "NickServ: nuovo comando RESETPASS per recuperare la password"
date: 2026-04-20
author: "Staff Azzurra"
tags: ["annuncio", "services", "nickserv"]
summary: "Chi ha dimenticato la password del nick e ha un'e-mail registrata valida può ora reimpostarla autonomamente, ricevendo un codice di autorizzazione via e-mail."
---

Siamo lieti di annunciare una **nuova funzionalità dei servizi**: il comando **RESETPASS** di NickServ, che permette di reimpostare la password del proprio nick quando la si è dimenticata — a patto di avere un'**e-mail registrata valida**.

Fino ad oggi l'unico modo per recuperare un nick con password persa era passare dallo staff e farsi resettare la password manualmente. Da adesso il reset è **basato sull'e-mail registrata** e affidato all'utente: la nuova password la scegli tu, lo staff non la vede mai.

## Come funziona

1. **Chiedi il codice in `#IRCHelp`**: uno staffer farà partire l'invio del **codice di autorizzazione** monouso alla tua e-mail registrata. Questo passaggio è mediato dallo staff per evitare abusi automatizzati.
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

---

Come sempre, continuiamo a lavorare per rendere i servizi più accessibili e la vita degli utenti più semplice.

Ci vediamo in chat 👋
