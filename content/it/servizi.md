---
title: "I Servizi"
lead: "I bot e servizi disponibili sulla rete Azzurra per gestire nickname, canali e molto altro."
translationKey: page-servizi
---

## NickServ

Gestisce la registrazione e la protezione dei nickname.

| Comando | Descrizione |
|---------|-------------|
| `REGISTER <pass> <email>` | Registra il nickname corrente |
| `IDENTIFY <pass>` | Autentica il nickname |
| `HELP` | Mostra tutti i comandi disponibili |

Utilizzo: `/msg NickServ <comando>`

---

## ChanServ

Gestisce la registrazione e la protezione dei canali.

| Comando | Descrizione |
|---------|-------------|
| `REGISTER #canale` | Registra il canale (devi essere fondatore) |
| `SET #canale TOPIC <testo>` | Imposta il topic permanente |
| `HELP` | Mostra tutti i comandi disponibili |

Utilizzo: `/msg ChanServ <comando>`

---

## MemoServ

Permette di inviare messaggi offline ad altri utenti registrati.

| Comando | Descrizione |
|---------|-------------|
| `SEND <nick> <messaggio>` | Invia un memo |
| `LIST` | Elenca i memo ricevuti |
| `READ <numero>` | Legge un memo |
| `DEL <numero>` | Elimina un memo |

Utilizzo: `/msg MemoServ <comando>`

---

## SeenServ

Mostra l'ultima volta che un utente è stato visto sulla rete.

```
/msg SeenServ SEEN <nickname>
```

---

## StatServ

Fornisce statistiche sulla rete (utenti connessi, canali, server).

```
/msg StatServ HELP
```

