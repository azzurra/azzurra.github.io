---
title: "Giochi"
lead: "I giochi che si possono fare in canale su Azzurra: come si comincia, i comandi, le regole."
translationKey: page-giochi
---

Su Azzurra si gioca direttamente in canale: non serve installare niente né registrarsi, bastano i comandi scritti in canale o in privato al bot. Su **#italia** i giochi li conduce **MikeBongiorno**; per avere in canale l'elenco rapido dei comandi di Trivial e Sillabah si scrive `!giochi` (oppure `!help`).

In ogni canale si gioca una partita alla volta: se ce n'è una in corso, anche di GameBot, gli altri giochi non partono finché non è finita.

---

## UNO

Il classico gioco di carte: a turno si scarta una carta dello stesso colore o dello stesso valore di quella in gioco. Vince chi resta per primo senza carte.

{{< info title="ℹ️ Come averlo nel canale" >}}
Questo gioco lo porta **GameBot**, che va invitato nel canale con `/invite GameBot #canale`. GameBot esce da solo poco dopo la fine della partita, se nel canale non ci sono altre partite in corso. L'elenco dei giochi disponibili si ottiene con `!listgames`.
{{< /info >}}

### Come si gioca

- Si avvia con `!uno`. Per partecipare si scrive `jo` entro **30 secondi**; servono almeno due giocatori.
- Le carte arrivano in privato. Si gioca con `pl` seguito da colore e valore: i colori sono `r` (rosso), `g` (giallo), `b` (blu), `v` (verde); il valore è un numero oppure `s` (salta), `r` (inverti), `+2`. Esempi: `pl v7`, `pl bs`, `pl r+2`.
- Il jolly si gioca con `pl j`, il jolly +4 con `pl j+4`; in tutti e due i casi poi si sceglie il colore con `co` seguito dal colore, ad esempio `co b`.
- Si possono scartare insieme più carte dello stesso valore: `pl r9g9`.
- Se non hai una carta buona: `pe` per pescare, poi `pa` per passare.
- Chi riceve un `+2` può rispondere con un altro `+2`; altrimenti pesca tutte le carte accumulate e salta il turno.
- Chi resta inattivo per 2 minuti pesca una carta e passa il turno.

### Comandi

| Comando | Cosa fa |
|---------|---------|
| `!uno` | Avvia una partita |
| `jo` | Entri nella partita |
| `pl <carta>` | Giochi una carta (es. `pl v7`, `pl j`, `pl j+4`) |
| `co <colore>` | Scegli il colore dopo un jolly |
| `pe` | Peschi una carta |
| `pa` | Passi il turno |
| `ca` | Ti rimanda le tue carte |
| `cd` | Mostra la carta in gioco |
| `ct` | Quante carte ha ogni giocatore |
| `tu` | Di chi è il turno |
| `!remove` | Ti ritiri dalla partita |
| `!unocmds` | Elenco completo dei comandi |

A fine partita: `!toppunti` (punteggi più alti), `!topwin` (chi ha vinto più partite), `!topchan` (classifica del canale), `!topchans` (canali con più punti).

---

## Texas Hold'em

Il poker più diffuso, in versione canale: si gioca con crediti virtuali, senza soldi veri. Chi resta senza crediti viene eliminato; vince l'ultimo rimasto al tavolo.

{{< info title="ℹ️ Come averlo nel canale" >}}
Questo gioco lo porta **GameBot**, che va invitato nel canale con `/invite GameBot #canale`. GameBot esce da solo poco dopo la fine della partita, se nel canale non ci sono altre partite in corso. L'elenco dei giochi disponibili si ottiene con `!listgames`.
{{< /info >}}

### Come si gioca

- Si avvia con `!holdem`, oppure `!holdem <soldi> <grande_buio>` per scegliere i crediti iniziali e il grande buio (se non si dice altro: 5000 crediti, grande buio 20).
- Per partecipare si scrive `jo` entro **20 secondi**.
- Le due carte coperte arrivano in privato. Quando è il tuo turno il bot ricorda le mosse possibili; hai **90 secondi** per agire, altrimenti sei fuori dalla mano.

### Comandi

| Comando | Cosa fa |
|---------|---------|
| `!holdem [soldi] [grande_buio]` | Avvia una partita |
| `jo` | Entri nella partita |
| `!check` | Passi, se nessuno ha puntato |
| `!bet <n>` | Apri la puntata |
| `!call` | Vedi la puntata |
| `!raise <n>` / `!raise +n` | Rilanci fino a n, oppure di n |
| `!allin` | Punti tutto |
| `!fold` | Lasci la mano |
| `!hstatus` | Stato della partita |
| `!holdemhelp` | Elenco dei comandi |

---

## Sette e Mezzo

Il classico gioco di carte italiano: bisogna avvicinarsi il più possibile a sette e mezzo senza superarlo.

{{< info title="ℹ️ Come averlo nel canale" >}}
Questo gioco lo porta **GameBot**, che va invitato nel canale con `/invite GameBot #canale`. GameBot esce da solo poco dopo la fine della partita, se nel canale non ci sono altre partite in corso. L'elenco dei giochi disponibili si ottiene con `!listgames`.
{{< /info >}}

### Come si gioca

- Si avvia con `!sette`. Per partecipare si scrive `!join` (o `jo`) entro **20 secondi**. Se c'è un solo giocatore, gioca anche il bot.
- Al tuo turno chiedi un'altra carta con `!carta`, oppure ti fermi con `!sto`. A fine giro il bot mostra la classifica della mano.

### Comandi

| Comando | Cosa fa |
|---------|---------|
| `!sette` | Avvia una partita |
| `!join` / `jo` | Entri nella partita |
| `!carta` | Chiedi un'altra carta |
| `!sto` | Ti fermi |

---

## Trivial

Un quiz "a impiccato": il bot fa una domanda e mostra la risposta coperta, un trattino per ogni lettera (gli spazi fra le parole restano visibili). Vince la domanda chi scrive per primo la risposta giusta.

### Come si gioca

- Si apre una partita scegliendo un set di domande: `!trivial <set>`, ad esempio `!trivial babbani`. Una partita dura **10 domande**; per cambiarne il numero si aggiunge in coda: `!trivial babbani 25`.
- `!trivial` da solo elenca i set disponibili: `tutte`, `nerd` (informatica, reti, sicurezza, IRC…), `babbani` (tutto il resto) e le singole categorie, come `cultura`, `scienza`, `storia`, `natura`, `cucina`, `moda`, `religioni`.
- Durante la domanda si può scrivere in canale:
  - **una lettera**: se c'è nella risposta, si scoprono tutte le sue occorrenze; se non c'è, il bot non dice niente;
  - **una parola** della risposta: viene scoperta;
  - **la risposta intera**: vale un punto, e si passa alla domanda successiva.
- Quando metà della risposta è scoperta, lettere e aiuti non funzionano più: da lì vale solo la risposta intera.
- La partita si chiude da sola dopo 10 minuti in cui nessuno gioca.

### Comandi

| Comando | Cosa fa |
|---------|---------|
| `!trivial <set> [n]` | Apre una partita sul set scelto, di n domande (alias `!trivia`, `!allegria`) |
| `!trivial` | Elenca i set; a partita in corso ripete la domanda |
| `.h` | Scopre una lettera a caso |
| `.v` | Scopre tutte le vocali |
| `!skip` | Salta la domanda (solo operatori del canale) |
| `!stop` | Chiude la partita |
| `!classifica trivial` | Classifica |

---

## Sillabah

Il gioco delle sillabe. A ogni manche il bot annuncia una sillaba e un limite di lettere, ad esempio «RI, massimo 7 lettere»: bisogna trovare una parola italiana che **contenga la sillaba** e **non superi il limite**. Ogni lettera vale dei punti e la parola vale la somma: conviene cercare parole con lettere rare.

### Come si gioca

- Si apre una partita con `!sillabah` (10 manche) o `!sillabah N` (N manche, massimo 30).
- Le parole **non** si scrivono in canale: si mandano **in query** al bot, `/msg MikeBongiorno parola`, oppure con `/notice MikeBongiorno parola`. Il bot risponde in privato se la parola è accettata o perché è stata scartata.
- Una parola a testa per manche: se ne mandi un'altra, sostituisce la precedente. `-delete` ritira la tua.
- Ogni manche dura **60 secondi**. Alla fine il canale vede le parole migliori e i punti vanno in classifica.
- Le lettere accentate valgono come quelle senza accento. Le parole valide sono quelle del dizionario del gioco: le parole straniere passano solo se sono d'uso comune in italiano.
- La partita si chiude da sola dopo due manche senza parole. Si gioca una partita alla volta in tutta la rete, perché le parole arrivano in query e il bot deve sapere a quale partita vanno.

### Valore delle lettere

| Punti | Lettere |
|-------|---------|
| 1 | A C E I O R S T |
| 2 | L M N |
| 3 | B D F G P U V |
| 5 | Z |
| 6 | H Q |
| 8 | J K W X Y |

### Comandi

| Comando | Cosa fa |
|---------|---------|
| `!sillabah [n]` | Apre una partita di n manche (10 se non si dice altro) |
| `!sillabah stop` | Chiude la partita |
| `!sillaba` | Ripete la sillaba e il limite della manche in corso |
| `!valori` | Il valore delle lettere |
| `!punti [nick]` | Il tuo punteggio, o quello di un altro |
| `!classifica sillabah` | Classifica |
| `-delete` | (in query) Ritira la tua parola |

Il dizionario è derivato da [Morph-it!](https://docs.sslmit.unibo.it/doku.php?id=resources:morph-it) (Baroni, Zanchetta — SSLMIT, Università di Bologna), licenza Creative Commons BY-SA 2.0. Il regolamento originale è quello del gioco delle sillabe del forum di rinoadiary.it.

---

## Classifiche

`!classifica` da solo mostra le classifiche di Trivial e Sillabah; `!classifica trivial` o `!classifica sillabah` solo quella del gioco indicato. Le classifiche di UNO si vedono con `!toppunti`, `!topwin`, `!topchan` e `!topchans`.

Buon divertimento!
