---
title: "The Story of Azzurra"
lead: "From the origins in 1997 to today: how Italy's longest-running IRC network was born and grew."
translationKey: page-storia
aliases: [/en/storia/]
---

## The origins of IRC (1988–1995)

Back in the summer of 1988, Jarkko Oikarinen, a student at the University of Oulu in Finland, came up with the idea of a new multi-user chat system. Starting from existing software such as *MUT* (Multi User Talk) and Unix *talk*, Jarkko created IRC, a revolutionary chat system. What made his software special was the ability to link two or more IRC daemons together.

Thanks to this innovation, Finland grew a university IRC network that let students from every university in the country talk to each other from their Unix terminals. When Internet links between countries became available, the Finnish IRC network expanded to reach a few servers in the United States, and shortly afterwards the first international IRC network still in existence was born: **Eris Free Net** (EFnet).

In the following years a huge number of national and international IRC networks appeared, and the number of users worldwide grew exponentially, making IRC the most popular chat system of its time. IRC arrived in Italy around **1995**, when the first national IRC servers were set up: here too it quickly found a large following, helped by a few universities and major providers that supplied the resources for the first Italian IRC servers.

## The birth of Azzurra (1997)

IRC was originally designed as an "anarchic" chat system, with no control over what users did. The sharp growth in users during the first half of the '90s turned most IRC networks into chaotic, unlivable places. The lack of moderation was the main cause behind the rise of the **IRCWar**: the use of more or less legitimate techniques, from DoS (Denial of Service) attacks to hacking, to take over other users' chatrooms.

With the aim of creating a stable, safe and above all moderated chat environment, Azzurra IRC Network was born in **1997**: the first entirely Italian IRC network.

Azzurra was born from the merger of the `xfiles.azzurra.com` server run by NetCom Telematica S.p.A. with `irc.filmaker.it` run by Filmaker Videoproduzione S.r.l., both previously part of the FastNet network; a few days later the IRC server of Leonet S.r.l. joined as well.

From the very beginning the staff put all its effort into building a controlled chat environment that would stand apart from the more chaotic IRC networks already on the Internet. Azzurra was the first Italian network, and the second in Europe, to introduce **nickname and channel registration services**, along with user protections such as IP address encryption: with the address no longer fully visible, the IRCWar phenomenon was kept as limited as possible.

## The golden years (2000–2008)

Many Italian providers supported Azzurra over the years, providing the stability and resources that brought the network a user base beyond anything its founders had expected. In the early 2000s Azzurra peaked at almost **10,000 simultaneous users**, 30,000 registered nicknames and over two million connections a month: numbers that placed it firmly among the top 15 IRC networks in the world, despite being used almost exclusively by Italian speakers.

Technically the network was built around two HUBs housed at Blixer S.p.A. and Infostrada Wind S.p.A., linked to each other over fibre through the MIX (Milan Internet eXchange). The main address, `irc.azzurra.org`, rotated across all the main servers to balance the load. Italian speakers connecting from the United States, Canada and Australia had dedicated addresses, `irc.us.azzurra.org` and `irc.as.azzurra.org`, pointing to servers configured specifically for connections from abroad.

Azzurra was also one of the first IRC networks to open **IPv6** access, thanks to the support of NgNet, the Telecom Italia Lab S.p.A. initiative (formerly CSELT – Centro Studi E Laboratori Telecomunicazioni) promoting innovation in the Internet and IP networks. To protect users, the **+x** usermode, set automatically by every server on connect, masks part of the IP address by encrypting it; those looking for more security can also connect over **SSL**.

Between 2006 and 2008 came the **UnoBot** bot (November 2006), the new name **Azzurra Web Community** (November 2007), a new server, `seeweb.azzurra.org`, offered by Seeweb S.r.l. (March 2008), and a new website with a revamped ChanList and ChanStats, running on a CMS developed by the staff (May 2008).

## The transition (2020–2024)

In May 2020 the staff started a deep reorganisation of the network, with the goal of bringing back all the historic services in a stable, modern form. **SeenServ**, **StatServ** and the **UnoBot** bot all returned to active duty.

In June 2024 the network formally adopted the **azzurra.chat** domain, giving the current staff direct, independent governance and carrying forward a 27-year tradition.

## Today

Almost thirty years after its birth, Azzurra continues its mission: offering a free, stable and welcoming space for conversation to the Italian community.

The network still runs on **Bahamut**, the IRCd born on DALnet and maintained and customised by the staff over the years, with hub servers routing traffic and leaf servers handling user connections. The sources of the IRCd and of the services are public on GitHub, under the [azzurra](https://github.com/azzurra) organisation.

The services that made the network's history are still there: **NickServ** and **ChanServ** to register and protect nicknames and channels, **MemoServ** for offline messages, **SeenServ** and **StatServ** for presence and statistics. The **+x** usermode, which masks part of the IP address, is still set automatically on connect.

Connect to `irc.azzurra.chat`, over **IPv4** and **IPv6**: ports `6666`–`6669` in plain text, `6697` and `9999` encrypted with **TLS**. If you'd rather not install anything, you can join from your browser through the webchat at [webchat.azzurra.chat](https://webchat.azzurra.chat). For any question, staff and helpers answer on `#IRCHelp`.

---

*The sections on the origins and the golden years are based on the history written by **debiAn** for Webbit 2003 and revised by **maruscia**, published on azzurra.org until 2024; the 2006–2008 dates come from the same site's news archive.*
