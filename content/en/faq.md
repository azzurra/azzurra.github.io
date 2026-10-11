---
title: "FAQ"
lead: "Frequently asked questions about the Azzurra IRC Network."
translationKey: page-faq
---

## General

### What is Azzurra?

Azzurra is the longest-running Italian IRC network, founded in 1997. It offers a free, organised chat space for the Italian community and beyond.

### Is IRC still used in 2026?

Yes! IRC is one of the most stable and open messaging protocols around. Azzurra still hosts an active community with dozens of channels in daily use.

### Do I need to create an account to connect?

No. You can connect with any nickname without registering. **NickServ** registration is optional, but recommended to protect your nickname.

---

## Connection

### How do I connect?

Use the [webchat](https://webchat.azzurra.chat) right from your browser, or an IRC client like HexChat, WeeChat or mIRC. See the [How to Connect](/en/connect) page for full details.

### Which ports should I use?

- Ports **6666**–**6669** for plaintext connections
- Ports **6697** and **9999** for TLS-encrypted connections (recommended)

### Can I connect to a specific server?

Yes. `irc.azzurra.chat` hands you one of the public servers, but you can also pick one:

| Server | Protocol | Ports | TLS ports |
|--------|----------|-------|-----------|
| `ruby.azzurra.chat` | IPv4 | `6666`–`6669` | `6697` `9999` |
| `raccooncity.azzurra.chat` | IPv4 | `6666`–`6669` | `6697` `9999` |
| `nightwish.azzurra.chat` | IPv6 | `6666`–`6669` | `6697` `9999` |
| `allnight6.azzurra.chat` | IPv6 | `6666`–`6669` | `6697` `9999` |

### What about void, devel and raptor?

They are the network's **hubs**: `void.azzurra.chat` is the main hub, `raptor.azzurra.chat` the secondary hub, `devel.azzurra.chat` the development hub. Hubs **do not accept user connections**: they exist for technical routing reasons and link the public servers and services together.

### Can I use IPv6?

Yes — the network fully supports IPv6.

---

## Nicknames and accounts

### How do I register my nickname?

```
/msg NickServ REGISTER <password> <your@email.com>
```


---

## Channels

### How do I create a channel?

Join the channel with `/join #channelname`. If the channel doesn't exist, it'll be created and you'll automatically become its operator.

### How do I register a channel with ChanServ?

```
/msg ChanServ REGISTER #channelname password description
```

You must be a channel operator (have the `@` flag) to register it.

### I need help in a channel. Who do I ask?

Hop into `#IRCHelp`: staff and experienced users will be glad to help.

---

## Issues and reports

### How do I report a user violating the rules?

Join `#IRCHelp` and describe the problem. As an alternative, use the [contact form](/en/contact).

### My IP has been banned (K-Line). What do I do?

Head over to the [K-Line removal request](/en/kline) page and fill in the form.
