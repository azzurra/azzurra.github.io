---
title: "Services"
lead: "The bots and services available on the Azzurra network for managing nicknames, channels and much more."
translationKey: page-servizi
aliases: [/en/servizi/]
---

## NickServ

Handles nickname registration and protection.

| Command | Description |
|---------|-------------|
| `REGISTER <pass> <email>` | Register the current nickname |
| `IDENTIFY <pass>` | Authenticate the nickname |
| `HELP` | Show all available commands |

Usage: `/msg NickServ <command>`

---

## ChanServ

Handles channel registration and protection.

| Command | Description |
|---------|-------------|
| `REGISTER #channel` | Register the channel (you must be the founder) |
| `SET #channel TOPIC <text>` | Set a permanent topic |
| `HELP` | Show all available commands |

Usage: `/msg ChanServ <command>`

---

## MemoServ

Lets you send offline messages to other registered users.

| Command | Description |
|---------|-------------|
| `SEND <nick> <message>` | Send a memo |
| `LIST` | List received memos |
| `READ <number>` | Read a memo |
| `DEL <number>` | Delete a memo |

Usage: `/msg MemoServ <command>`

---

## SeenServ

Shows the last time a user was seen on the network.

```
/msg SeenServ SEEN <nickname>
```

---

## StatServ

Provides network statistics (connected users, channels, servers).

```
/msg StatServ HELP
```
