---
title: "Games"
lead: "The games you can play in channel on Azzurra: how to start, the commands, the rules."
translationKey: page-giochi
---

On Azzurra you play right inside the channel: nothing to install and no account needed, just commands typed in the channel or sent privately to the bot. The games are in Italian. On **#italia** your host is **MikeBongiorno**; for a quick list of the Trivial and Sillabah commands in channel, type `!giochi` (or `!help`).

Each channel runs one game at a time: while a game is in progress, GameBot's included, the other games won't start until it's over.

---

## UNO

The classic card game: in turn, discard a card matching the colour or the value of the one in play. The first player to run out of cards wins.

{{< info title="ℹ️ Getting it into your channel" >}}
This game is run by **GameBot**, which has to be invited into the channel with `/invite GameBot #channel`. GameBot leaves on its own shortly after the game ends, if no other game is running in the channel. `!listgames` shows the list of available games.
{{< /info >}}

### How to play

- Start with `!uno`. To take part, type `jo` within **30 seconds**; at least two players are needed.
- Your cards are sent privately. Play with `pl` followed by colour and value: the colours are `r` (rosso, red), `g` (giallo, yellow), `b` (blu, blue), `v` (verde, green); the value is a number or `s` (skip), `r` (reverse), `+2`. Examples: `pl v7`, `pl bs`, `pl r+2`.
- Play a wild card with `pl j` and a wild +4 with `pl j+4`; either way, then choose the colour with `co` followed by the colour, for example `co b`.
- You can discard several cards of the same value at once: `pl r9g9`.
- No playable card? `pe` to draw, then `pa` to pass.
- A player hit by a `+2` can answer with another `+2`; otherwise they draw all the stacked cards and lose their turn.
- A player idle for 2 minutes draws a card and passes.

### Commands

| Command | What it does |
|---------|--------------|
| `!uno` | Starts a game |
| `jo` | Join the game |
| `pl <card>` | Play a card (e.g. `pl v7`, `pl j`, `pl j+4`) |
| `co <colour>` | Choose the colour after a wild card |
| `pe` | Draw a card |
| `pa` | Pass your turn |
| `ca` | Sends your cards again |
| `cd` | Shows the card in play |
| `ct` | How many cards each player holds |
| `tu` | Whose turn it is |
| `!remove` | Leave the game |
| `!unocmds` | Full command list |

After a game: `!toppunti` (highest scores), `!topwin` (most games won), `!topchan` (channel ranking), `!topchans` (channels with the most points).

---

## Texas Hold'em

The world's most popular poker, channel edition: played with virtual credits, no real money. A player who runs out of credits is eliminated; the last one at the table wins.

{{< info title="ℹ️ Getting it into your channel" >}}
This game is run by **GameBot**, which has to be invited into the channel with `/invite GameBot #channel`. GameBot leaves on its own shortly after the game ends, if no other game is running in the channel. `!listgames` shows the list of available games.
{{< /info >}}

### How to play

- Start with `!holdem`, or `!holdem <money> <big_blind>` to choose the starting credits and the big blind (defaults: 5000 credits, big blind 20).
- To take part, type `jo` within **20 seconds**.
- Your two hole cards are sent privately. On your turn the bot lists your possible moves; you have **90 seconds** to act, or you're out of the hand.

### Commands

| Command | What it does |
|---------|--------------|
| `!holdem [money] [big_blind]` | Starts a game |
| `jo` | Join the game |
| `!check` | Check, if nobody has bet |
| `!bet <n>` | Open the betting |
| `!call` | Call the bet |
| `!raise <n>` / `!raise +n` | Raise to n, or by n |
| `!allin` | Go all-in |
| `!fold` | Fold the hand |
| `!hstatus` | Game status |
| `!holdemhelp` | Command list |

---

## Sette e Mezzo

The classic Italian card game: get as close as you can to seven and a half without going over.

{{< info title="ℹ️ Getting it into your channel" >}}
This game is run by **GameBot**, which has to be invited into the channel with `/invite GameBot #channel`. GameBot leaves on its own shortly after the game ends, if no other game is running in the channel. `!listgames` shows the list of available games.
{{< /info >}}

### How to play

- Start with `!sette`. To take part, type `!join` (or `jo`) within **20 seconds**. With a single player, the bot plays too.
- On your turn ask for another card with `!carta`, or stand with `!sto`. At the end of the round the bot shows the ranking.

### Commands

| Command | What it does |
|---------|--------------|
| `!sette` | Starts a game |
| `!join` / `jo` | Join the game |
| `!carta` | Ask for another card |
| `!sto` | Stand |

---

## Trivial

A hangman-style quiz: the bot asks a question and shows the answer masked, one dash per letter (the spaces between words stay visible). The first to type the right answer wins the question.

### How to play

- Open a game by choosing a question set: `!trivial <set>`, for example `!trivial babbani`. A game lasts **10 questions**; to change that, add a number: `!trivial babbani 25`.
- `!trivial` on its own lists the available sets: `tutte` (all), `nerd` (computing, networking, security, IRC…), `babbani` (everything else) and the single categories, such as `cultura`, `scienza`, `storia`, `natura`, `cucina`, `moda`, `religioni`.
- While a question is open you can type in the channel:
  - **a single letter**: if it's in the answer, every occurrence is revealed; if it isn't, the bot stays silent;
  - **one word** of the answer: it gets revealed;
  - **the whole answer**: one point, and on to the next question.
- Once half of the answer is revealed, letters and hints stop working: from then on only the full answer counts.
- A game closes on its own after 10 minutes with nobody playing.

### Commands

| Command | What it does |
|---------|--------------|
| `!trivial <set> [n]` | Opens a game on the chosen set, n questions long (aliases `!trivia`, `!allegria`) |
| `!trivial` | Lists the sets; during a game, repeats the question |
| `.h` | Reveals one random letter |
| `.v` | Reveals all the vowels |
| `!skip` | Skips the question (channel operators only) |
| `!stop` | Ends the game |
| `!classifica trivial` | Ranking |

---

## Sillabah

The syllable game. Each round the bot announces a syllable and a letter limit, for example "RI, max 7 letters": you need an Italian word that **contains the syllable** and **doesn't exceed the limit**. Every letter is worth points and the word is worth the sum, so words with rare letters pay off.

### How to play

- Open a game with `!sillabah` (10 rounds) or `!sillabah N` (N rounds, max 30).
- Words are **not** typed in the channel: send them **in private** to the bot, `/msg MikeBongiorno word`, or with `/notice MikeBongiorno word`. The bot replies privately telling you whether the word was accepted or why it was rejected.
- One word per player per round: sending another replaces the previous one. `-delete` withdraws yours.
- Each round lasts **60 seconds**. At the end the channel sees the best words and the points go to the ranking.
- Accented letters count as their plain counterparts. Valid words are those in the game's dictionary: foreign words only pass if they're in common Italian use.
- A game closes on its own after two rounds with no words. Only one game runs at a time across the network, because words arrive in private and the bot must know which game they belong to.

### Letter values

| Points | Letters |
|--------|---------|
| 1 | A C E I O R S T |
| 2 | L M N |
| 3 | B D F G P U V |
| 5 | Z |
| 6 | H Q |
| 8 | J K W X Y |

### Commands

| Command | What it does |
|---------|--------------|
| `!sillabah [n]` | Opens a game of n rounds (10 by default) |
| `!sillabah stop` | Ends the game |
| `!sillaba` | Repeats the current round's syllable and limit |
| `!valori` | Letter values |
| `!punti [nick]` | Your score, or someone else's |
| `!classifica sillabah` | Ranking |
| `-delete` | (in private) Withdraws your word |

The dictionary is derived from [Morph-it!](https://docs.sslmit.unibo.it/doku.php?id=resources:morph-it) (Baroni, Zanchetta — SSLMIT, University of Bologna), Creative Commons BY-SA 2.0 license. The original rules come from the syllable game on the rinoadiary.it forum.

---

## Rankings

`!classifica` on its own shows the Trivial and Sillabah rankings; `!classifica trivial` or `!classifica sillabah` only the one you name. The UNO rankings are shown with `!toppunti`, `!topwin`, `!topchan` and `!topchans`.

Have fun!
