---
title: "The Network"
lead: "The technical infrastructure of Azzurra: servers, services and network architecture."
translationKey: page-network
---

## Architecture

Azzurra runs the IRC protocol on the **Bahamut** daemon, an IRCd originally developed by DALnet and maintained and customised by the network staff over the years.

The network is structured around **hub** servers (routing) and **leaf** servers (user connections), linked together to guarantee stability and redundancy.

## Servers

The main round-robin is reachable at:

```
irc.azzurra.chat
```

Standard ports: `6666` `6667` `6668` `6669`  
SSL/TLS ports: `6697` `9999`  
IPv6: supported

## Services

The following IRC services are available on the network:

| Service | Description |
|---------|-------------|
| **NickServ** | Nickname registration and protection |
| **ChanServ** | Channel management and protection |
| **MemoServ** | Offline messages system |
| **SeenServ** | User presence statistics |
| **StatServ** | Network statistics |

For help on a service: `/msg NickServ HELP` (or the name of the service you want).

## Connectivity

The network supports both **IPv4** and **IPv6**. Encrypted **TLS** connections are available on ports 6697 and 9999.

{{< info title="👋 Staff" >}}
For technical info about the network, drop into `#IRCHelp` or reach the staff from the [Contact](/en/contact) page.
{{< /info >}}
