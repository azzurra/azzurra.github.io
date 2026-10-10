---
title: "IRC Help"
lead: "The guide to Azzurra's services commands and the IRC server: pick a service, open the command you need."
translationKey: page-irc-help
layout: irchelp
---

*Original guide by Laura ^Norad^ Tommasini, Mask section by City_Hunter, update by Delphino (Help v2.6, 2007). 2026 revision by the Azzurra staff.*

> [!WARNING]
> **N.B.** Square brackets, which enclose an optional parameter, must never be used in commands. Options separated by the `|` character (for example `ON|OFF`) mean you must type either `ON` or `OFF`.

Command parts shown in UPPERCASE, as well as `/msg NickServ`, `/msg ChanServ` etc., must not be modified.

The commands `/msg NickServ`, `/msg ChanServ`, `/msg MemoServ`, `/msg SeenServ`, `/msg StatServ`, `/msg HelpServ` can be abbreviated as `/NickServ`, `/ChanServ`, `/MemoServ`, `/SeenServ`, `/StatServ`, `/HelpServ`, or as `/ns`, `/cs`, `/ms`, `/ss`, `/st`, `/hs` respectively, giving the exact same result unless there are client- or script-specific issues.

If the abbreviated command gives unexpected or confusing results, it is advisable to use the full command.

## NickServ commands

NickServ allows anyone to register their own nickname, which ensures that it can only be used by its owner, by entering a password chosen at registration time.

Nicknames that have had no (identified) access for a period of 3650 days (ten years) are automatically removed from the system.

A registered nickname can appear on the lists (Founder, CF, SOP, AOP, HOP, VOP) of at most 40 channels.

- **ACC** - Shows the access level
- **ACCESS** - Manages the access list
- **AUTH** – Authorizes the nickname
- **DROP** - Deletes the registration
- **GHOST** - Terminates "ghost" connections
- **HELP** – On-line help for the NickServ service
- **IDENTIFY** - Identifies you as the owner of the nickname
- **INFO** - Information about a registered nickname
- **LISTCHANS** - Shows the channels the user has access to
- **RECOVER** - Disconnects someone who is using the nickname
- **REGISTER** - Registers the nickname
- **RELEASE** - Releases a nickname held by the services
- **SET** - Sets various parameters

For more information, once connected to the IRC network, type: `/msg NickServ HELP`

### NickServ - ACC

Every user currently using a nickname is assigned an access level, as described in the table below. The ACC command is used to find out a user's access level for a given nickname.

**Syntax:**

```text
/msg NickServ ACC nickname
```

The following values are NickServ's possible replies:

| Value | Meaning |
|:------:|-------------|
| 0 | The specified nickname is not registered |
| 1 | Nickname registered but the user is not using it |
| 2 | The user has not identified |
| 3 | The user has identified by entering the password |
| 4 | The user is connected with a mask present in the access list |
| 5 | The specified nick is locked and cannot be used |
| 6 | The specified nick is forbidden and cannot be used |

**Example:**

```text
/msg NickServ ACC ^Norad^
```

### NickServ - ACCESS

This command is used to manage the nickname's Access List. In practice it serves to add or remove masks, in the user@host format, from the list (it is possible to use "wildcard characters", such as asterisk * and ?). All users whose username and hostname match the specified mask will not be required to provide the password in order to use the nickname. This does NOT mean, however, that they are identified for that nickname: ChanServ will still give op in channels where the nick is registered (provided the channel does not have the IDENT option enabled) and they will be able to read memos, but to change their own settings they will need to provide the password with the IDENTIFY command.

A maximum of 5 masks can be entered in the access list.

You must be identified before you can use this command.

**Syntax:**

```text
/msg NickServ ACCESS ADD user@host
/msg NickServ ACCESS DEL user@host
/msg NickServ ACCESS LIST
/msg NickServ ACCESS WIPE
```

ADD adds a mask to the Access list.

DEL removes a mask from the Access list.

LIST displays the masks present in the Access list.

WIPE removes all masks present in the Access list.

**Examples:**

```text
/msg NickServ ACCESS ADD capoz@*.aruba.it
/msg NickServ ACCESS DEL manu@*.jnet.it
/msg NickServ ACCESS WIPE
/msg NickServ ACCESS LIST
```

For problems determining masks, consult the Recognition Masks section or ask an operator on #IRCHelp.

### NickServ - AUTH

The AUTH command is used to complete the registration of a nick; after registering a nick with the REGISTER command, you receive, at the address you specified, an email containing a numeric code to be used with this command in order to unlock access to NickServ's settings functions for that nick, to channel registration, and to sending Memos.

**Syntax:**

```text
/msg NickServ AUTH codice
```

**Example:**

```text
/msg NickServ AUTH 1757420068
```

### NickServ - DROP

This command deletes the registration of the specified nickname: this means it will become available again to all users. It will also drop all channels on which the nick is founder, if no SUCCESSOR has been set. You must be identified (with the IDENTIFY command) to the nickname you wish to delete before using this command.

A confirmation code will be sent by e-mail to the address specified at registration time, which must be entered within 24 hours as stated in the e-mail, to confirm deletion of the nick.

A drop request can be cancelled with the UNDO parameter.

Use is limited to once per day.

**Syntax:**

```text
/msg NickServ DROP nickname
/msg NickServ DROP nickname codice
/msg NickServ DROP nickname UNDO
```

**Examples:**

```text
/msg NickServ DROP mirtilla86
/msg NickServ DROP mirtilla86 1757420068
/msg NickServ DROP ^^Mauro^^ UNDO
```

### NickServ - GHOST

Sometimes, perhaps due to a poor connection, you may get disconnected from the IRC server, and even though your client has disconnected, the server may not have correctly received the QUIT command and therefore may not have released the nickname you were using. As a result, upon reconnecting you will not be able to use your old nickname until the server realizes that the previous connection is no longer active. NickServ's GHOST command speeds up this process by telling the server that connection is no longer active, making the nickname available again.

This is not the command to use to disconnect a user who is using your own nick; in that case, use RECOVER.

**Syntax:**

```text
/msg NickServ GHOST nickname password
```

**Example:**

```text
/msg NickServ GHOST Cleo^ 19851208
```

### NickServ - HELP

This is the command to get on-line help for the NickServ service.

**Syntax:**

```text
/msg NickServ HELP [comando]
```

**Examples:**

```text
/msg NickServ HELP
/msg NickServ HELP REGISTER
/msg NickServ HELP SET LANG
```

### NickServ – IDENTIFY (or ID or IDENT)

This command (an alias for `/PASS`) is used to provide NickServ with the password for the nickname you are currently using. This is necessary to identify yourself as the owner of the nickname currently in use.

**Syntax:**

```text
/msg NickServ IDENTIFY password
```

or

```text
/msg NickServ ID password
```

or

```text
/msg NickServ IDENT password
```

or

```text
/PASS password
```

It is also possible to identify to a nick other than the one you are currently using. This way you can be opped by ChanServ in channels where you are on a list.

There is no limit to the number of nicks you can be identified to at the same time. For example, if you have two registered nicks, you can identify to both and thus have access to ChanServ's commands for all the channels where you are on a list with at least one of the two nicks.

**Syntax:**

```text
/msg NickServ IDENTIFY nickname password_del_nick
```

**Examples:**

```text
/msg NickServ IDENTIFY 20030303
/msg NickServ IDENT 08051973
/msg NickServ ID Casper 12AB56cd
/pass carota
```

### NickServ - INFO

This command gives you further information about a registered nickname, such as its registration date or the last time it was used.

**Syntax:**

```text
/msg NickServ INFO nickname
```

**Example:**

```text
/msg NickServ INFO ^Norad^
```

### NickServ - LISTCHANS

Shows the list of channels the nick you are using has access to. It will display the channels where you are VOP, HOP, AOP, SOP, CF or Founder. N.B. you can be added to the lists of a maximum of 40 channels, including those of which you are Founder.

**Syntax:**

```text
/msg NickServ LISTCHANS
```

**Example:**

```text
/msg NickServ LISTCHANS
```

### NickServ - RECOVER

This command lets you immediately recover your own nick if it is in use by another user. NickServ changes the other user's nick to GuestXXXXX, which is what would happen automatically if the KILL option were active. To use this command you need to know the password of the nick you want to recover.

**Syntax:**

```text
/msg NickServ RECOVER nickname password
```

**Example:**

```text
/msg NickServ RECOVER Casper 12AB56cd
```

### NickServ - REGISTER

This is the command to use to register your own nickname.

Registering a nick lets you make full use of the NickServ service. Among other things, it makes it possible to immediately recover your own nick if it is in use by someone else, register channels, send memos, etc.

At registration time an e-mail is sent containing an authorization code, which must be entered within 24 hours to confirm the nick's registration. Instructions on how to do this are included in the e-mail itself. Nicks not authorized within 24 hours expire.

The nick is set +r only after authorization.

The password must be a string between 5 and 32 characters long, with no control codes or spaces, and cannot be the same as the nick for security reasons. It is also not advisable to use your own name as a password, since it is often too easy to guess.

It is obviously essential that the e-mail address be valid at registration time, in order to receive the authorization code. The e-mail address is needed both by staff, to recognize or contact you if needed, and by you, in case you forget the password for your nick or for a channel of which you are Founder and need to request it by mail.

N.B.: The e-mail address provided at registration is NOT visible to regular users, unless you want it to be. The line `* Questo nick e' stato autorizzato tramite: indirizzo@email` in the nick's INFO is visible only to the user identified to that nick. The address can be made visible with the `/msg NickServ SET EMAIL SHOW` command and hidden with the `/msg NickServ SET EMAIL HIDE` command.

A nick's registration can be deleted with the DROP command.

**Syntax:**

```text
/msg NickServ REGISTER password indirizzo@email
```

**Examples:**

```text
/msg NickServ REGISTER 12AB56cd antonio.rossi@libero.it
/msg NickServ REGISTER g3j39sew66 mario.bianchi@tin.it
```

### NickServ - RELEASE

If you do not identify within the set time to a nick that has the KILL option enabled, NickServ changes the nickname to GuestXXXXX and holds that nickname for 5 minutes, meaning no one will be able to use it.

A `/whois` of this kind:

```text
nick is enforcer@azzurra.chat * Nick Protection Enforcement
nick using services.azzurra.chat Azzurra IRC Services
nick End of /WHOIS list.
```

means precisely that the nick is being held by the services.

The RELEASE command lets the owner make their nickname available again immediately, so it can be used.

**Syntax:**

```text
/msg NickServ RELEASE nickname password
```

**Example:**

```text
/msg NickServ RELEASE Mirtilla 12AB56cd
```

### NickServ - SET

This command lets you set various options or enable particular functions for managing your own nickname.

- **EMAIL** - Lets you manage the e-mail address associated with your nick.

  By specifying a new e-mail address you can request a change of address. An e-mail containing the registration code will be sent to the old address, and the code must be entered via the AUTH command to confirm the change. If the old address is no longer valid, or is wrong, the change will be made automatically after a period of 7 days, during which the request can be cancelled with the UNDO command to prevent the change.

  Use of this command, as far as changing the e-mail address is concerned, is limited to once per day.

  WARNING: The validity of the new address will not be checked; it is in your own interest to enter a valid e-mail address, since if there are problems with the nick, or the password is forgotten, it will not be possible to receive any help if the e-mail address is not valid.

  Syntax:

  ```text
  /msg NickServ SET EMAIL nuovo_indirizzo@email
  /msg NickServ SET EMAIL AUTH codice
  /msg NickServ SET EMAIL SHOW|HIDE|UNDO
  ```

  HIDE hides the e-mail address from anyone who requests an INFO on the nick.

  SHOW makes the e-mail address visible to anyone who requests an INFO on the nick.

  UNDO cancels the address change request.

  Examples:

  ```text
  /msg NickServ SET email norad@azzurra.chat
  /msg NickServ SET EMAIL AUTH 1757420068
  /msg NickServ SET EMAIL SHOW
  /msg NickServ SET EMAIL UNDO
  ```

- **KILL** - Users not on the Access List will be forced to enter the password within a time set by the chosen parameter.

  Enables the nick's Enforced option. If any other user tries to use your nick while you are not around, they will be given a limited time to change nick, after which they will be forcibly changed to GuestXXXXX. This option is enabled by default when a nick is registered, with the SLOW parameter.

  SLOW (alias for ON) sets a 60-second countdown.\
  NORMAL sets a 20-second countdown.\
  FAST sets a 5-second countdown.

  Syntax:

  ```text
  /msg NickServ SET KILL SLOW|NORMAL|FAST|OFF
  ```

  Examples:

  ```text
  /msg NickServ SET KILL FAST
  /msg NickServ SET KILL OFF
  /msg NickServ SET KILL ON
  ```

- **LANG** - Changes the language used by the services to send messages, such as replies to commands used.

  N.B.: You do not need a registered nick to use this command. However, if the nick is not registered, the language change will need to be repeated on every connection.

  To get the list of available languages, specify LIST as the number.

  Syntax:

  ```text
  /msg NickServ SET LANG numero
  /msg NickServ SET LANG LIST
  ```

  Example:

  ```text
  /msg NickServ SET LANG 1
  ```

- **NEVEROP** - Makes ChanServ not automatically op you when you join a channel where you are registered on one of the lists.

  You will also be de-opped by ChanServ whenever another user tries to op you. The only way to get op while NEVEROP is active is to use ChanServ's OP command.

  Syntax:

  ```text
  /msg NickServ SET NEVEROP ON|OFF
  ```

  Example:

  ```text
  /msg NickServ SET NEVEROP ON
  ```

- **NOCHANMEMO** - If enabled, blocks receipt of all and only the memos sent to channels where you are on a list, except for those of which you are founder.

  Syntax:

  ```text
  /msg NickServ SET NOCHANMEMO ON|OFF
  ```

  Example:

  ```text
  /msg NickServ SET NOCHANMEMO OFF
  ```

- **NOMEMO** - If enabled, prevents other users from sending you any memo.

  You will still be able to send memos to other users even with the NOMEMO option active.

  Syntax:

  ```text
  /msg NickServ SET NOMEMO ON|OFF
  ```

  Example:

  ```text
  /msg NickServ SET NOMEMO ON
  ```

- **NOOP** - Prevents other users from adding you to any list (VOP, HOP, AOP, SOP, CF) of any channel.

  This command will not remove you from any lists you were added to previously.

  Syntax:

  ```text
  /msg NickServ SET NOOP ON|OFF
  ```

  Example:

  ```text
  /msg NickServ SET NOOP ON
  ```

- **NOWELCOME** - If enabled, lets you avoid receiving any Welcome Message when joining a registered channel, even if the founder has set one.

  Syntax:

  ```text
  /msg NickServ SET NOWELCOME ON|OFF
  ```

  Example:

  ```text
  /msg NickServ SET NOWELCOME OFF
  ```

- **PASSWD** - Lets you change the password of the nick you are currently using when you issue the command.

  Syntax:

  ```text
  /msg NickServ SET PASSWD vecchia_pass nuova_pass
  ```

  Example:

  ```text
  /msg NickServ SET PASSWD 030574 ab98df3DD4
  ```

- **SECURE** - Enables the Secure option for your nick.

  With Secure set, NickServ will no longer take your Access list into account; you will therefore need to identify to your nick with your password every time you connect.

  Syntax:

  ```text
  /msg NickServ SET SECURE ON|OFF
  ```

  Example:

  ```text
  /msg NickServ SET SECURE ON
  ```

- **URL** - Lets you associate a URL with the specified nick.

  This URL is what will be shown to any user who requests the nick's information via the INFO command.

  To remove the current URL, specify NONE as the address.

  Syntax:

  ```text
  /msg NickServ SET URL indirizzo
  ```

  Example:

  ```text
  /msg NickServ SET URL http://www.garzantilinguistica.it/
  ```

### Available languages

These are the languages available for NickServ's and ChanServ's LANG setting:

| Number | Language |
|:------:|--------|
| 1 | Italian |
| 2 | English |
| 3 | Spanish |
| 4 | French |

## ChanServ commands

ChanServ allows anyone who has registered and authorized their own nickname with NickServ to register their own channel, so they can manage it fully without needing a BOT.

The Founder is automatically opped by ChanServ when they join the channel, and has access to all commands and can manage the CF, SOP, AOP, HOP, VOP, AKICK lists, as well as lock them with the LOCK option of the various commands.

They can also op (make operator) users not on a list even if the channel is set with OpGuard ON.

Channels expire automatically if no operator from the lists accesses the channel within 3650 days (ten years) while identified to their nick, or if the Founder's nick expires, unless a successor has been set.

A channel's lists can hold at most 500 users total across VOP, HOP, AOP, SOP and CF, and 300 AKICK entries.

- **AKICK** - Manages the permanent ban list
- **AOP** - Manages the AutoOp list
- **CFOUNDER** - Manages the CoFounder list
- **COUNT** - Shows how many users are present on the channel's lists
- **DEHALFOP** - Removes halfop status from a user
- **DEOP** - Removes operator status from a user
- **DEVOICE** - Removes the ability to speak on moderated channels
- **DROP** - Deletes the channel's registration
- **HALFOP** - Grants halfop status to a user
- **HELP** – On-line help for the ChanServ service
- **HOP** - Manages the AutoHalfOp list
- **IDENTIFY** - Identifies a user as founder
- **INFO** - Shows further information about the channel
- **INVITE** - Invites yourself into an invite-only channel
- **MDEHALFOP** - Removes halfop from everyone on the channel
- **MDEOP** - Removes operator status from everyone on the channel
- **MDEVOICE** - Removes voice from everyone on the channel
- **MKICK** - Kickbans all users from the channel
- **MODE** - Changes the channel's modes
- **OP** - Grants operator status to a user
- **REGISTER** - Registers a channel
- **REMOVE** - Lets you remove yourself from a channel's lists
- **RESETMODES** - Resets all Channel Modes set on the channel
- **SET** - Lets you change the channel's settings
- **SOP** - Manages the SuperOp list
- **UNBAN** - Removes a ban from the channel
- **VOICE** - Grants voice to a user on a moderated channel
- **VOP** - Manages the VoiceOp list
- **WHY** - Explains why a user is operator on the specified channel

For more information, once connected to the IRC network, type: `/msg ChanServ HELP`

### ChanServ - AKICK

This command allows anyone who is at least SOP, and if the list has not been locked by the Founder with the LOCK command, to add registered nicks and masks in the nick!user@host format to the channel's AutoKick list. These are essentially permanent bans, no different in effect from the `/MODE canale +b` command. Anyone identified to a nick present in the list, or whose mask matches or is similar to the one specified (the "wildcard characters", * and ?, are allowed), will be immediately kicked from the channel and banned by ChanServ.

**Syntax:**

```text
/msg ChanServ AKICK #canale ADD nick|mask [bantype] [ragione]
/msg ChanServ AKICK #canale DEL mask|numero
/msg ChanServ AKICK #canale LIST [mask]
/msg ChanServ AKICK #canale WIPE
/msg ChanServ AKICK #canale LOCK [mask]
/msg ChanServ AKICK #canale UNLOCK [mask]
```

ADD adds the specified nick or mask to the AutoKick list. If an unregistered nick is specified, the mask `nick!*@*` will be added instead.

It is possible to specify the type of ban to apply to users who join and match the mask set in Akick; in that case they will be recognized according to the mask set in akick, but the ban will be set according to the chosen bantype. If this parameter is not specified, the mask set in akick will be banned. If a registered nick is the one in akick, the person will be banned even if using a different nick, as long as they are identified to the nick in the akick list. In this case the ban will default to bantype 2 (`*!*@host`) unless a different one is specified in the command itself, or a different bantype has been set with SET BANTYPE .

If a reason is specified (max 200 characters, including color control codes etc.), it will be used as the reason at the time of the kick, otherwise the default one will be used: "Sei bannato da questo canale".

The maximum number of nicks and masks allowed in the AutoKick list is 300.

DEL removes the specified mask or number (relative to the list) from the AutoKick list. However, it does not remove any bans set by ChanServ as a result of previous AutoKicks; those must be removed manually.

LIST displays the full list of the channel's AutoKicks, or optionally only those containing the specified mask.

WIPE deletes all the masks and nicks present in the AutoKick list.

LOCK locks the list, allowing only the founder to modify it. If one of the masks already in the list is specified, only that one will be locked.

UNLOCK unlocks the list, in case it had been locked with the LOCK command. If a mask is specified, only that one will be unlocked.

N.B.: replace #canale with the name of the channel on which you want to make the change, and in place of mask put the nick!user@host-style mask to be entered.

The encrypted part of the host (e.g.: Azzurra-18DD91B7) must be replaced with * if you want the akick to be effective in case of dynamic IP. If the host to be entered contains a dash (-) or an equals sign (=) as in the host Azzurra-18DD91B7, the symbol will need to be replaced with a question mark (?), obtaining for example: `*!*@Azzurra?18DD91B7`. If the substitution is not applied, you will receive the error `-ChanServ- La mask inserita non e' valida, o contiene caratteri non validi.`

**Examples:**

```text
/msg ChanServ AKICK #IRCHelp ADD Saitta 3 Basta spammare!
/msg ChanServ AKICK #IRCHelp ADD *!*saitta@*.dialup.tiscali.it
/msg ChanServ AKICK #IRCHelp DEL *!*pippo@*.carota.net
/msg ChanServ AKICK #IRCHelp LIST *saitta*
/msg ChanServ AKICK #IRCHelp WIPE
/msg ChanServ AKICK #IRCHelp LOCK Saitta
/msg ChanServ AKICK #IRCHelp UNLOCK *!*pippo@*.carota.net
```

For problems determining masks, consult the Recognition Masks section or contact an operator on #IRCHelp.

### ChanServ - AOP

This command is used to manage the channel's AutoOp (AOP) list. AOPs are automatically opped by ChanServ when they join the channel; they can give VOICE, HALFOP or OP to themselves or to other users, use DEVOICE, DEHALFOP and DEOP on themselves and on other users, and use the INVITE and UNBAN ME commands; they cannot manage the VOP, HOP, AOP, SOP, CF or AKICK lists. SOPs and CoFounders can add and remove AOPs, but only if the AOP list is not locked by the Founder with the LOCK option.

Only registered nicknames can be added to the list, unless the IDENT option is disabled, in which case it is also possible to add masks in the user@host or nick!user@host format.

**Syntax:**

```text
/msg ChanServ AOP #canale ADD nick|mask
/msg ChanServ AOP #canale DEL nick|mask|numero
/msg ChanServ AOP #canale LIST [mask]
/msg ChanServ AOP #canale FIND mask
/msg ChanServ AOP #canale CLEAN
/msg ChanServ AOP #canale EXPLIST
/msg ChanServ AOP #canale WIPE
/msg ChanServ AOP #canale LOCK [nick|mask]
/msg ChanServ AOP #canale UNLOCK [nick|mask]
```

ADD adds the specified mask or nick to the channel's Auto-Op list. If the nick or mask is already present in another list, their access level will be changed to AOP.

DEL deletes the specified mask or nick from the channel's Auto-Op list, or the entry corresponding to the specified number.

LIST displays the full list of the channel's Auto-Ops, or optionally only those containing the specified mask.

FIND searches for entries matching the specified mask (in nick!user@host format).

CLEAN deletes from the Auto-Op list all nicks that have expired.

EXPLIST shows the expired nicks present in the Auto-Op list.

WIPE deletes all nicks and masks present in the Auto-Op list.

LOCK locks the list, allowing only the founder to modify it. If one of the masks already in the list is specified, only that one will be locked.

UNLOCK unlocks the list, in case it had been locked with the LOCK command. If a mask is specified, only that one will be unlocked.

N.B.: replace #canale with the name of the channel on which you want to make the change, and replace [nick|mask] with the nick or mask to be entered.

**Examples:**

```text
/msg ChanServ AOP #ToonTown ADD Casper
/msg ChanServ AOP #IRCHelp ADD *!*pippo@*.carota.net
/msg ChanServ AOP #IRCHelp DEL 2
/msg ChanServ AOP #IRCHelp FIND *!*@*.interbusiness.it
/msg ChanServ AOP #IRCHelp LIST *.it
/msg ChanServ AOP #WILAMER LOCK ^{l4m3r}^
/msg ChanServ AOP #Gianicolo UNLOCK Rodolfo
```

For problems determining masks, consult the Recognition Masks section or contact an operator on #IRCHelp.

### ChanServ – CFOUNDER (o CF)

This command is used to manage the channel's CoFounder (CF) list. CoFounders are automatically opped by ChanServ when they join the channel, and have access to all the commands the Founder has access to, except DROP, SET PASSWD, SET FOUNDER, SET NOMKICK, SET SUCCESSOR and SET MEMOLEVEL, and can manage the VOP, HOP, AOP, SOP, AKICK lists (but not the CF list), if they are not locked by the Founder. Only the Founder can modify the CF list.

They can also op users who are not on the list even if the channel is set with OpGuard ON.

Only registered nicknames can be added to the list, unless the IDENT option is disabled, in which case it is also possible to add masks in the user@host or nick!user@host format.

**Syntax:**

```text
/msg ChanServ CFOUNDER #canale ADD nick|mask
/msg ChanServ CFOUNDER #canale DEL nick|mask|numero
/msg ChanServ CFOUNDER #canale LIST [mask]
/msg ChanServ CFOUNDER #canale FIND mask
/msg ChanServ CFOUNDER #canale CLEAN
/msg ChanServ CFOUNDER #canale EXPLIST
/msg ChanServ CFOUNDER #canale WIPE
```

ADD adds the specified mask or nick to the channel's Co-Founder list. If the nick or mask is already present in another list, their access level will be changed to Co-Founder.

DEL deletes the specified mask or nick from the channel's Co-Founder list, or the mask or nick corresponding to the specified number.

LIST displays the full list of the channel's Co-Founders, or optionally only those containing the specified mask.

FIND searches for entries matching the specified mask (in nick!user@host format).

CLEAN deletes from the Co-Founder list all nicks that have expired.

EXPLIST shows the expired nicks present in the Co-Founder list.

WIPE deletes all nicks and masks present in the Co-Founder list.

The CF list obviously cannot be locked, since it can only be managed by the Founder.

N.B.: replace #canale with the name of the channel on which you want to make the change, and replace [nick|mask] with the nick or mask to be entered.

**Examples:**

```text
/msg ChanServ CFOUNDER #WiLamer ADD I_am_l4m3r
/msg ChanServ CFOUNDER #IRCHelp ADD *!*pippo@*.carota.net
/msg ChanServ CFOUNDER #IRCHelp DEL 3
/msg ChanServ CFOUNDER #IRCHelp LIST *pippo*
/msg ChanServ CFOUNDER #italia FIND *!*@*.carota.net
```

For problems determining masks, consult the Recognition Masks section or contact an operator on #IRCHelp.

### ChanServ - COUNT

Shows the number of users in each of the channel's lists as follows:

```text
Count di #canale: VOP: 2, HOP: 3, AOP: 11, SOP: 3, CF: 1, AKICK: 5
```

You must be at least VOP to be able to use this command.

**Syntax:**

```text
/msg ChanServ COUNT #canale
```

**Example:**

```text
/msg ChanServ COUNT #Soleluna
```

### ChanServ - DEHALFOP

Removes the channel halfop status from the specified user. This has no effect on the HOP list. Up to 6 nicks can be specified. You must be at least HOP in the channel to use this command on yourself, and at least AOP to use it on others.

**Syntax:**

```text
/msg ChanServ DEHALFOP #canale nickname1 [nickname2] ... [nickname6]
```

**Examples:**

```text
/msg ChanServ DEHALFOP #liberozone Alberto
/msg ChanServ DEHALFOP #MioCanale Luca3 ^martina^ AnToNeLla
```

### ChanServ - DEOP

Removes the channel operator status from the specified user. This has no effect on the AOP, SOP and CF lists. Up to 6 nicks can be specified. You must be at least AOP in the channel to be able to use this command.

**Syntax:**

```text
/msg ChanServ DEOP #canale nickname1 [nickname2] ... [nickname6]
```

**Examples:**

```text
/msg ChanServ DEOP #liberozone Alberto
/msg ChanServ DEOP #MioCanale Luca3 ^martina^ AnToNeLla
```

### ChanServ - DEVOICE

Removes the specified user's ability to send text on a moderated channel. This has no effect on the VOP list. Up to 6 nicks can be specified. You must be at least VOP in the channel to use this command on yourself, and at least HOP to use it on others.

**Syntax:**

```text
/msg ChanServ DEVOICE #canale nickname1 [nickname2] ... [nickname6]
```

**Examples:**

```text
/msg ChanServ DEVOICE #MioCanale Papero
/msg ChanServ DEVOICE #Soleluna ^Bang^ [Roberto] Cucciola
```

### ChanServ - DROP

This command allows you to delete the registration of a given channel. To use this command you must be identified both to the founder's nick and to the channel with the IDENTIFY command.

A confirmation code will be sent via E-Mail to the address specified at the time of registration of the nick of the user who is the Founder, which must be entered within 24 hours as stated in the E-Mail to confirm the deletion of the channel.

It is possible to cancel an ongoing DROP request with the UNDO parameter.

Use is limited to once a day.

**Syntax:**

```text
/msg ChanServ DROP #canale
/msg ChanServ DROP #canale codice
/msg ChanServ DROP #canale UNDO
```

**Examples:**

```text
/msg ChanServ DROP #WiLamer
/msg ChanServ DROP #WiLamer 1064149619
/msg ChanServ DROP #WiLamer UNDO
```

### ChanServ - HALFOP

This command grants HalfOp status to the specified user. It has no effect on the HOP list. Up to 6 nicks can be specified. You must be at least HOP in the channel to use this command on yourself, and at least AOP to use it on others.

**Syntax:**

```text
/msg ChanServ HALFOP #canale nickname1 [nickname2] ... [nickname6]
```

**Examples:**

```text
/msg ChanServ HALFOP #Italia MaSCiA
/msg ChanServ HALFOP #Baraonda Gino^ mirtilla2 ]Antonio[ _ZIP_
```

### ChanServ - HELP

This is the command to get on-line help on the ChanServ service.

**Syntax:**

```text
/msg ChanServ HELP [comando]
```

**Examples:**

```text
/msg ChanServ HELP
/msg ChanServ HELP AOP
/msg ChanServ HELP SET MLOCK
```

### ChanServ - HOP

This command is used to manage the channel's AutoHalfOp (HOP) list. HOPs are automatically half-opped by ChanServ when they join the channel; they can give themselves HALFOP, give VOICE to themselves or to other users, use DEVOICE and DEHALFOP on themselves and DEVOICE on other users, and use the INVITE and UNBAN ME commands; they cannot manage the VOP, HOP, AOP, SOP, CF or AKICK lists. SOPs and CoFounders can add and remove HOPs, but only if the HOP list is not locked by the Founder with the LOCK option.

Only registered nicknames can be added to the list, unless the IDENT option is disabled, in which case it is also possible to add masks in the user@host or nick!user@host format.

**Syntax:**

```text
/msg ChanServ HOP #canale ADD nick|mask
/msg ChanServ HOP #canale DEL nick|mask|numero
/msg ChanServ HOP #canale LIST [mask]
/msg ChanServ HOP #canale FIND mask
/msg ChanServ HOP #canale CLEAN
/msg ChanServ HOP #canale EXPLIST
/msg ChanServ HOP #canale WIPE
/msg ChanServ HOP #canale LOCK [nick|mask]
/msg ChanServ HOP #canale UNLOCK [nick|mask]
```

ADD adds the specified mask or nick to the channel's Auto-HalfOp list. If the nick or mask is already present in another list, their access level will be changed to HOP.

DEL deletes the specified mask or nick from the channel's Auto-HalfOp list, or the entry corresponding to the specified number.

LIST displays the full list of the channel's Auto-HalfOps, or optionally only those containing the specified mask.

FIND searches for entries matching the specified mask (in nick!user@host format).

CLEAN deletes from the Auto-HalfOp list all nicks that have expired.

EXPLIST shows the expired nicks present in the Auto-HalfOp list.

WIPE deletes all nicks and masks present in the Auto-HalfOp list.

LOCK locks the list, allowing only the founder to modify it. If one of the masks already in the list is specified, only that one will be locked.

UNLOCK unlocks the list, in case it had been locked with the LOCK command. If a mask is specified, only that one will be unlocked.

N.B.: replace #canale with the name of the channel on which you want to make the change, and replace [nick|mask] with the nick or mask to be entered.

**Examples:**

```text
/msg ChanServ HOP #ToonTown ADD Casper
/msg ChanServ HOP #IRCHelp ADD *!*pippo@*.carota.net
/msg ChanServ HOP #IRCHelp DEL 2
/msg ChanServ HOP #IRCHelp LIST *.it
/msg ChanServ HOP #IRCHelp LIST *!*@*.interbusiness.it
/msg ChanServ HOP #WILAMER LOCK ^{l4m3r}^
/msg ChanServ HOP #Gianicolo UNLOCK Rodolfo
```

For problems determining masks, consult the Recognition Masks section or contact an operator on #IRCHelp.

### ChanServ – IDENTIFY ( o ID)

This is used to identify yourself as the channel's founder, in case you are using a different nickname from the one with which the registration was made.

Some commands, such as DROP, SET FOUNDER, SET NOMKICK, require identification to ChanServ with this command.

**Syntax:**

```text
/msg ChanServ IDENTIFY #canale password
```

**Example:**

```text
/msg ChanServ IDENTIFY #WiLamer h4rt34c330
/msg ChanServ IDENTIFY #Baraonda zupercaoz
```

### ChanServ - INFO

Provides all the available information about the specified channel, if it is registered, such as the Founder's nick, the successor's nick if one has been set, the description entered at registration, the welcome message if there is one, the registration date, the last time it was visited by an operator, the last topic and who set it, the access level required to send memos to the channel, the website address and e-mail (if set), the settings and mode locks, if any.

**Syntax:**

```text
/msg ChanServ INFO #canale
```

**Example:**

```text
/msg ChanServ INFO #Italia
```

**Result:**

```text
ChanServ- Info sul canale #italia:
ChanServ- Founder: MariaM (tarokker@exclusive.property.of.evilmaio.com)
ChanServ- Successor: kernella
ChanServ- Descrizione: Il vostro canale di conversazione
ChanServ- Messaggio di benvenuto: Benvenuti su #italia, buona permanenza e buon divertimento! Istruzioni per l'uso: http://forum.azzurra.chat/showthread.php?t=4886 | fai richiesta anche tu per la tua scheda su http://italia.azzurra.chat/invio-scheda.php
Data registrazione: 25 Mar 1999 - 22:32:56 (CET)
Ultimo join: 03 Giu 2005 - 01:20:45 (CEST) [meno di 1 ora fa]
Ora corrente: 03 Giu 2005 - 01:38:43 (CEST)
Ultimo topic: Per il sito di #Italia http://italia.azzurra.chat, il resto son solo chiacchiere. Entra nella community! Per inserire la tua scheda--> http://italia.azzurra.chat/invio-scheda.php'
ChanServ- Topic cambiato da: Barbatruk
ChanServ- Memo Level: VOP
ChanServ- Lingua: Italiano (Italian)
ChanServ- URL: http://italia.azzurra.chat
ChanServ- Indirizzo E-Mail: italia@azzurra.chat
ChanServ- Opzioni: Topic Lock (AOP), Topic Retention, Ident, No MassKick, Verbose (1)
ChanServ- Modelock: +nt-ckps
ChanServ- *** Fine delle Info ***
```

### ChanServ - INVITE

Used to invite yourself into a channel. You must be at least VOP to use this command, and it can be used to invite yourself in emergencies, such as a ban or the channel being set to invite-only (mode +i), with a user limit (+l) or with a password (+k).

**Syntax:**

```text
/msg ChanServ INVITE #canale
```

**Example:**

```text
/msg ChanServ INVITE #soleluna
```

### ChanServ - MDEHALFOP

Performs a MassDehalfop, removing halfop status from all users in the channel except the one who runs it. You must be at least SOP to use this command. This command should only be used in emergency situations.

**Syntax:**

```text
/msg ChanServ MDEHALFOP #canale
```

**Example:**

```text
/msg ChanServ MDEHALFOP #IPv6
```

### ChanServ - MDEOP

Performs a MassDeop, removing operator status from all users in the channel except the one who runs it. You must be at least SOP to use this command. This command should only be used in emergency situations.

**Syntax:**

```text
/msg ChanServ MDEOP #canale
```

**Example:**

```text
/msg ChanServ MDEOP #IPv6
```

### ChanServ - MDEVOICE

Performs a MassDevoice, removing voice status from all users in the channel. You must be at least SOP to use this command.

**Syntax:**

```text
/msg ChanServ MDEVOICE #canale
```

**Example:**

```text
/msg ChanServ MDEVOICE #Liberozone
```

### ChanServ - MKICK

Following the execution of this command, which is intended for emergency ("takeover") use only, ChanServ joins the channel, sets a ban on `*!*@*` (all users) and kicks all users, including the one who ran it. The reason can be at most 200 characters long. You must be at least SOP to use this command, unless the channel has the NOMKICK setting, which prevents its use. ChanServ stays in the channel for 2 minutes keeping the ban in place, before removing it and automatically leaving.

It is not possible to interact with a channel on which a masskick has been performed, until ChanServ leaves it.

It is therefore not possible to use the DEOP, DROP, INVITE, MDEHALFOP, MDEOP, MDEVOICE, MKICK, HALFOP, MODE, OP, UNBAN, SET TOPIC, VOICE commands during a masskick.

**Syntax:**

```text
/msg ChanServ MKICK #canale [motivo]
```

**Example:**

```text
/msg ChanServ MKICK #WiLamer
/msg ChanServ MKICK #Gulp Facciamo ordine
```

### ChanServ - MODE

This command has the same syntax as `/MODE`, and is used to change the channel's settings. While with the `/MODE` command it is the user themselves who changes the settings, in this case it will be ChanServ making the changes, useful in case you have been accidentally locked out of your own channel.

You must be at least SOP to use this command. Only CF and Founder can use it to modify settings locked with the MLOCK command. Up to 6 modes (whether + or -) can be specified on the same line.

**Syntax:**

```text
/msg ChanServ MODE #canale +|-modes [parametri]
```

**Examples:**

```text
/msg ChanServ MODE #WiLamer +l 20
/msg ChanServ MODE #WiLamer +k hh3er45
/msg ChanServ MODE #WiLamer -k *
/msg ChanServ MODE #WiLamer -cdu
/msg ChanServ MODE #WiLamer +nt-is
```

NOTE: check your IRC client's help for the valid Channel modes, their function and syntax, or once connected type `/msg HelpServ CMODE`.

N.B. It is not possible to use the +|- b, o, h, v modes with this command, meaning it is not possible to ban or unban, or give or take op, halfop and voice.

### ChanServ - OP

The OP command grants channel operator status to a user. This command has no effect on the channel's AOP, SOP and CF lists. Up to 6 nicks can be specified. You must be at least AOP in the channel to use this command.

**Syntax:**

```text
/msg ChanServ OP #canale nickname1 [nickname2] ... [nickname6]
```

**Examples:**

```text
/msg ChanServ OP #Soleluna ^Norad^
/msg ChanServ OP #Radioitalia kavia typedef_c
```

### ChanServ - REGISTER

Registers a channel in ChanServ's database. To use this command you must be an operator in the channel you intend to register. The password will later be needed to identify as founder and modify the channel's settings.

The last parameter, which must be included, is a brief general description of the topics discussed in the channel (maximum 400 characters). The password must be a string between 5 and 32 characters, with no control codes or spaces, and cannot be the same as the founder's nick password for security reasons. It is also advised not to use your own name as the password, as it is often too easy to guess.

At the time of channel registration, the nick running the command will be set as founder, and as founder will be able to modify all the channel's options. In addition, ChanServ will automatically op the nick when it joins the channel, but only if it has previously identified.

N.B.: To register a channel you must use a nick that is registered with NickServ and authorized.

A channel's registration can be removed by the founder with the DROP command.

**Syntax:**

```text
/msg ChanServ REGISTER #canale password descrizione
```

NOTE: replace #channel with the name of the channel to register, password with what will be your founder password, and description with a short sentence about the channel's topic.

**Examples:**

```text
/msg ChanServ REGISTER #OrtolaniUniti 12A04B57C Il canale per discutere sulle verdure
/msg ChanServ REGISTER #Pennac FataCarabina Chiacchiere su Belleville e la famiglia Malaussène
```

### ChanServ - REMOVE

This command allows you to remove yourself from the VOP, HOP, AOP, SOP, CF lists of any channel without having to ask the founder or an SOP/CF to do it.

To use this command you must be identified to the nick you want to remove from the list.

It is not possible to remove with this command any masks that contain the nick currently in use.

**Syntax:**

```text
/msg ChanServ REMOVE #canale
```

**Example:**

```text
/msg ChanServ REMOVE #WiLamer
```

### ChanServ - RESETMODES

This command resets all channel modes (c, C, i, k, l, m, M, n, p, R, s, t, u, U), removing all those that are not present in the MLOCK. You must be at least SOP to use this command.

**Syntax:**

```text
/msg ChanServ RESETMODES #canale
```

**Example:**

```text
/msg ChanServ RESETMODES #IPv6
```

### ChanServ - SET

This command allows you to permanently change the channel's settings, and can only be used by the Founder or a CoFounder (with the exceptions noted below). The options that are set are visible in the channel's INFO.

- **AUTOOP** - Sets +o on anyone who joins.

  The Op granted by the AUTOOP option is only temporary; no nick will be added to or removed from the AOP, SOP, CF lists. This option and the NEVEROP option cannot be set at the same time.

  Syntax:

  ```text
  /msg ChanServ SET #canale AUTOOP ON|OFF
  ```

  Examples:

  ```text
  /msg ChanServ SET #debian AUTOOP ON
  /msg ChanServ SET #irchelp AUTOOP OFF
  ```

- **AUTOHALFOP** - Sets +h on anyone who joins.

  The HalfOp granted by the AUTOHALFOP option is only temporary; no nick will be added to or removed from the HOP list.

  Syntax:

  ```text
  /msg ChanServ SET #canale AUTOHALFOP ON|OFF
  ```

  Examples:

  ```text
  /msg ChanServ SET #debian AUTOHALFOP ON
  /msg ChanServ SET #irchelp AUTOHALFOP OFF
  ```

- **AUTOVOICE** - Sets +v on anyone who joins.

  The Voice granted by the AUTOVOICE option is only temporary; no nick will be added to or removed from the VOP list.

  Syntax:

  ```text
  /msg ChanServ SET #canale AUTOVOICE ON|OFF
  ```

  Examples:

  ```text
  /msg ChanServ SET #WiLamer AUTOVOICE ON
  /msg ChanServ SET #irchelp AUTOVOICE OFF
  ```

- **BANTYPE** - Sets the type of ban.

  This option lets you choose the type of ban to apply to users who are automatically banned by the Restrict option, or in the case of an akick on a registered nick. There are 10 possible values. The initial BANTYPE value for a channel (set at registration) is 2.

  Syntax:

  ```text
  /msg ChanServ SET #canale BANTYPE valore
  ```

  Example:

  ```text
  /msg ChanServ SET #Io&Te BANTYPE 3
  ```

- **DESC** - Sets the channel's description.

  This description is the one initially set at registration and is shown to any user who requests the channel's information with the INFO command. It can be at most 400 characters long and cannot be removed.

  Syntax:

  ```text
  /msg ChanServ SET #canale DESC descrizione
  ```

  Example:

  ```text
  /msg ChanServ SET #Io&Te DESC Canale privato di ^Cindy^ e Robert
  ```

- **EMAIL** - Configures the channel's reference email.

  This email address is the one shown to any user who requests the channel's information with the INFO command. In case of a lost password request, the email will NOT be sent to this address but to the one registered to the founder's nick. To remove the current email, specify NONE as the email address.

  Syntax:

  ```text
  /msg ChanServ SET #canale EMAIL indirizzo@email
  ```

  Example:

  ```text
  /msg ChanServ SET #irchelp EMAIL irchelp@ml.azzurra.chat
  ```

- **FOUNDER** - Changes the channel's founder.

  The specified nickname must be registered, online, and identified. To use this command you must be identified both to the current founder's nick and to the channel with the IDENTIFY command. The channel's password is changed to a random one at the time of the handover and sent to the new founder via memo.

  Syntax:

  ```text
  /msg ChanServ SET #canale FOUNDER nickname
  ```

  Example:

  ```text
  /msg ChanServ SET #NoiDue FOUNDER Mary
  ```

- **IDENT** - If enabled, you will need to be identified to NickServ to be recognized.

  When the IDENT option is set to ON, ChanServ will automatically grant the corresponding status (op, halfop, voice) only to users on the lists who are identified to their own nick.

  N.B.: If the IDENT option is set to ON, the VOP/HOP/AOP/SOP/CF lists cannot contain masks, only registered nicks. The option is set to ON by default when the channel is registered.

  Syntax:

  ```text
  /msg ChanServ SET #canale IDENT ON|OFF
  ```

  Examples:

  ```text
  /msg ChanServ SET #Baraonda IDENT OFF
  /msg ChanServ SET #irchelp IDENT ON
  ```

- **KEEPTOPIC** - Keeps the topic when the channel is empty.

  Enables or disables the Topic Retention option for the specified channel. When it is enabled, ChanServ will store the topic when the channel becomes empty, and set it again as soon as someone joins. The option is set to ON by default when the channel is registered.

  Syntax:

  ```text
  /msg ChanServ SET #canale KEEPTOPIC ON|OFF
  ```

  Examples:

  ```text
  /msg ChanServ SET #Baraonda KEEPTOPIC OFF
  /msg ChanServ SET #Liberozone KEEPTOPIC ON
  ```

- **LANG** - Changes the language used by ChanServ to send messages.

  To get the list of available languages, specify LIST as the number

  Syntax:

  ```text
  /msg ChanServ SET #canale LANG numero
  ```

  Example:

  ```text
  /msg ChanServ SET #irchelp LANG 1
  ```

- **MEMOLEVEL** - Defines which category of users can send memos to the channel.

  The MEMOLEVEL option lets you specify the minimum access level required to send memos to the entire channel with the SENDTO command. The level parameter can be any of VOP, HOP, AOP, SOP, CF, or FOUNDER.

  The option is set to VOP by default when the channel is registered and can only be changed by the founder.

  To make it impossible to send memos to the entire channel, specify NONE as the level.

  Syntax:

  ```text
  /msg ChanServ SET #canale MEMOLEVEL livello
  ```

  Examples:

  ```text
  /msg ChanServ SET #irchelp MEMOLEVEL VOP
  /msg ChanServ SET #Silenziosi MEMOLEVEL NONE
  ```

- **MLOCK** - Defines which channel modes are locked.

  Sets the mode lock for a channel. ChanServ lets you make sure certain channel modes are always enabled or disabled. The modes that can be locked are c, C, i, k, l, m, M, n, p, R, s, t, u and U. Parameters preceded by a + are enabled and locked, those preceded by a – cannot be set on the channel. Locked modes can only be changed by the Founder and CF with the MODE command.

  At registration ChanServ sets mlock +nt by default. Mode j is not currently supported by the services and therefore cannot be locked.

  N.B.: If a channel's modelock is currently +nt and you also want mode +s to be locked, you must specify +nts as the mode, not +s, which would instead lock only mode +s and no longer +nt as well.

  To make ChanServ not lock anything, specify NONE as the mode.

  Syntax:

  ```text
  /msg ChanServ SET #canale MLOCK +|-modes [parametri]
  ```

  Examples:

  ```text
  /msg ChanServ SET #irchelp MLOCK +cnt
  /msg ChanServ SET #Silenziosi MLOCK +ntmcu-il
  /msg ChanServ SET #SoloNoi MLOCK +ntk 040283
  /msg ChanServ SET #Liberi MLOCK NONE
  ```

- **NOMKICK** - Blocks the MKICK command for the channel.

  It can only be set by the Founder identified to the nick and to the channel. If set to ON, masskicks on the channel are not possible. It is set to ON by default at registration.

  Syntax:

  ```text
  /msg ChanServ SET #canale NOMKICK ON|OFF
  ```

  Example:

  ```text
  /msg ChanServ SET #debian NOMKICK OFF
  ```

- **NEVEROP** - Does not automatically op AOP and above on joining the channel.

  When the NEVEROP option is set to ON, AOP and above will not be opped by ChanServ on joining, even if already identified to their own nick. To get op they will necessarily have to use ChanServ's OP command whenever they want it. This option and the AUTOOP option cannot be set at the same time.

  Syntax:

  ```text
  /msg ChanServ SET #canale NEVEROP ON|OFF
  ```

  Example:

  ```text
  /msg ChanServ SET #irchelp NEVEROP ON
  ```

- **OPGUARD** - If enabled, does not allow regular users to be opped.

  Only users on the AOP/SOP/CF lists, besides the founder, can be operators in the channel. Regular users can, however, be opped by the Founder or CF through ChanServ.

  Syntax:

  ```text
  /msg ChanServ SET #canale OPGUARD ON|OFF
  ```

  Example:

  ```text
  /msg ChanServ SET #soleluna OPGUARD ON
  ```

- **PASSWD** - Changes the specified channel's password to the new specified password.

  You must be identified to the founder's nick to use this command.

  Syntax:

  ```text
  /msg ChanServ SET #canale PASSWD vecchiapassword nuovapassword
  ```

  Example:

  ```text
  /msg ChanServ SET #italia PASSWD carota ndtw564Ac4W
  ```

- **PROTECT** - Protects the operators registered on the lists.

  The PROTECT option makes it so that in the specified channel all users registered on the AOP/SOP/CF lists are automatically re-opped if someone deops them, unless they are deopped by someone of higher rank.

  Syntax:

  ```text
  /msg ChanServ SET #canale PROTECT ON|OFF
  ```

  Example:

  ```text
  /msg ChanServ SET #gdp PROTECT ON
  ```

- **RESTRICT** - Restricts access to the channel to only nicks registered on the lists.

  Enables or disables the Restricted Access option for the specified channel. If enabled, only VOP, HOP, AOP, SOP, CoFounder and the Founder can join the channel; everyone else will be banned (with a mask set according to BANTYPE) and immediately kicked by ChanServ.

  Syntax:

  ```text
  /msg ChanServ SET #canale RESTRICT ON|OFF
  ```

  Example:

  ```text
  /msg ChanServ SET #Io&Te RESTRICT ON
  ```

- **SUCCESSOR** – Sets a successor for the channel.

  If a channel founder's nick should expire or be dropped, the channel will pass to the Successor, who will become the new Founder. The Successor must be a Co-Founder of the channel. The successor can only be set by the founder.

  To remove a channel's Successor, specify NONE as the nick.

  N.B.: If a channel has no Successor and the founder's nick should expire or be dropped, the channel will be immediately dropped and can be registered by anyone.

  Syntax:

  ```text
  /msg ChanServ SET #canale SUCCESSOR nickname
  ```

  Examples:

  ```text
  /msg ChanServ SET #SoloNoi SUCCESSOR Jenny
  /msg ChanServ SET #Baraonda SUCCESSOR NONE
  ```

- **TOPIC** – Changes the channel's topic.

  Makes ChanServ change the specified channel's topic to the new specified topic.

  Syntax:

  ```text
  /msg ChanServ SET #canale TOPIC messaggio
  ```

  Example:

  ```text
  /msg ChanServ SET #italia TOPIC :: Benvenuti in #Italia :: Chattate & Divertitevi. No flame - No parolacce e offese - No spam ::
  ```

- **TOPICLOCK** - Only allows the specified category of users to change the topic.

  Enables or disables the Topic Lock option for the specified channel. When enabled, only those with the minimum required access level will be able to change the channel's topic. The level can be any of VOP|HOP|AOP|SOP|CF|FOUNDER. CFounders can change this option unless it is set to the FOUNDER level. To disable this option, specify OFF as the level.

  Syntax:

  ```text
  /msg ChanServ SET #canale TOPICLOCK livello
  ```

  Examples:

  ```text
  /msg ChanServ SET #irchelp TOPICLOCK AOP
  /msg ChanServ SET #Soleluna TOPICLOCK OFF
  ```

- **URL** - Sets the channel's home page address.

  Lets you associate a URL with the specified channel. This URL is the one shown to any user who requests the channel's information with the INFO command. To remove the current URL, specify NONE as the address.

  Syntax:

  ```text
  /msg ChanServ SET #canale URL indirizzo
  ```

  Examples:

  ```text
  /msg ChanServ SET #irchelp URL http://www.azzurra.chat/irchelp.php
  /msg ChanServ SET #Soleluna URL NONE
  ```

- **VERBOSE** - Lets you choose which opnotices to receive.

  Lets you choose which ChanServ commands should send a notice to the channel's operators when executed successfully. The default Verbose level is 0.

  - Level 0: No opnotice will be sent to the channel
  - Level 1: The OP, DEOP, HALFOP, DEHALFOP, VOICE, DEVOICE, MKICK, MDEOP, MDEHALFOP, MDEVOICE, UNBAN commands send an opnotice to the channel
  - Level 2: Every change to the VOP/HOP/AOP/SOP/CF/AKICK lists, including via the REMOVE command, also sends an opnotice to the channel; additionally, if a user on the akick list joins the channel, the akick for which they were banned is notified
  - Level 3: Every change to settings with the SET command also sends an opnotice to the channel

  Syntax:

  ```text
  /msg ChanServ SET #canale VERBOSE livello
  ```

  Examples:

  ```text
  /msg ChanServ SET #irchelp VERBOSE 3
  /msg ChanServ SET #Io&Te VERBOSE 0
  ```

- **WELCOME** - Defines the welcome message that ChanServ will send as a notice to everyone who joins the specified channel.

  It can be at most 400 characters long. To remove the current welcome message, specify NONE as the message. GREETING or MOTD can be used in place of WELCOME

  Syntax:

  ```text
  /msg ChanServ SET #canale WELCOME messaggio
  ```

  Examples:

  ```text
  /msg ChanServ SET #irchelp WELCOME NONE
  /msg ChanServ SET #italia MOTD Benvenuti nel canale #Italia di Azzurra IRC Network
  /msg ChanServ SET #OrtolaniUniti WELCOME Mercoledì mercato!!! Prezzi senza confronti!
  ```

### ChanServ - SOP

This command manages the channel's SuperOp list. SOPs are automatically opped by ChanServ when they join the channel, can use mass commands such as MDEVOICE, MDEHALFOP, MDEOP and MKICK (if NOMKICK is set to OFF), use the UNBAN ALL, MODE and RESETMODES commands, add or remove users from the VOP, HOP and AOP lists (but not SOP or CF), and manipulate the AKICK list, provided the lists are not locked by the Founder. CoFounders can add and remove SOP, but only if the SOP list is not locked by the Founder with the LOCK option.

Only registered nicknames can be added to the list, unless the IDENT option is disabled, in which case masks in the format user@host or nick!user@host can also be added.

**Syntax:**

```text
/msg ChanServ SOP #canale ADD nick|mask
/msg ChanServ SOP #canale DEL nick|mask|numero
/msg ChanServ SOP #canale LIST [mask]
/msg ChanServ SOP #canale FIND mask
/msg ChanServ SOP #canale CLEAN
/msg ChanServ SOP #canale EXPLIST
/msg ChanServ SOP #canale WIPE
/msg ChanServ SOP #canale LOCK [nick|mask]
/msg ChanServ SOP #canale UNLOCK [nick|mask]
```

ADD adds the specified mask or nick to the channel's Super-Op list. If the nick or mask is already present in another list, its access will be changed to SOP.

DEL removes the specified mask or nick from the channel's Super-Op list, or the mask or nick corresponding to the specified number.

LIST shows the complete list of the channel's Super-Ops, or optionally only those matching the specified mask.

FIND searches for entries matching the specified mask (in the format nick!user@host).

CLEAN removes all expired nicks from the Super-Op list.

EXPLIST shows the expired nicks present in the Super-Op list.

WIPE removes all nicks and masks present in the Super-Op list.

LOCK locks the list, allowing only the founder to manipulate it. If one of the masks already in the list is specified, only that one will be locked.

UNLOCK unlocks the list, in case it was locked with the LOCK command. If a mask is specified, only that one will be unlocked.

NOTE: replace #channel with the name of the channel you wish to modify, and [nick|mask] with the nick or mask of the user to add.

**Examples:**

```text
/msg ChanServ SOP #IRCHelp ADD [^BodyZen
/msg ChanServ SOP #IRCHelp ADD *!*pippo@*.carota.net
/msg ChanServ SOP #IRCHelp DEL 5
/msg ChanServ SOP #IRCHelp LIST *carota*
/msg ChanServ SOP #IRCHelp FIND *!*@*carota.net
/msg ChanServ SOP #IRCHelp LOCK [^BodyZen
/msg ChanServ SOP #IRCHelp UNLOCK
```

For issues determining masks, see the Recognition Masks section or contact an operator on #IRCHelp.

### ChanServ - UNBAN

This command removes all bans preventing a user from joining, or clears the channel's entire ban list.

**Syntax:**

```text
/msg ChanServ UNBAN #canale ME
/msg ChanServ UNBAN #canale ALL
```

ME removes all bans that prevent the nick issuing the command from joining the channel.

You must be at least VOP to use this command.

ALL removes all bans on the channel. You must be at least SOP to use it.

**Examples:**

```text
/msg ChanServ UNBAN #IRCHelp me
/msg ChanServ UNBAN #Soleluna ALL
```

### ChanServ - VOICE

This command grants "voice", i.e. the ability to send text on a moderated channel (mode +m), to the specified user. It has no effect on the VOP list. Up to 6 nicks can be specified. You must be at least VOP on the channel to use this command on yourself, and at least HOP to use it on others.

**Syntax:**

```text
/msg ChanServ VOICE #canale nickname1 [nickname2] ... [nickname6]
```

**Examples:**

```text
/msg ChanServ VOICE #Italia MaSCiA
/msg ChanServ VOICE #Baraonda Gino^ mirtilla2 ]Antonio[ _ZIP_
```

### ChanServ - VOP

This command manages the channel's VoiceOp list. VOPs are automatically set +v by ChanServ when they join the channel, and can only give VOICE to themselves and remove it (DEVOICE), and use the INVITE and UNBAN ME commands. SOP and CoFounder can add and remove VOP, but only if the VOP list is not locked by the Founder with the LOCK option.

Only registered nicknames can be added to the list, unless the IDENT option is disabled, in which case masks in the format user@host or nick!user@host can also be added.

**Syntax:**

```text
/msg ChanServ VOP #canale ADD nick|mask
/msg ChanServ VOP #canale DEL nick|mask|numero
/msg ChanServ VOP #canale LIST [mask]
/msg ChanServ VOP #canale FIND mask
/msg ChanServ VOP #canale CLEAN
/msg ChanServ VOP #canale EXPLIST
/msg ChanServ VOP #canale WIPE
/msg ChanServ VOP #canale LOCK [nick|mask]
/msg ChanServ VOP #canale UNLOCK [nick|mask]
```

ADD adds the specified mask or nick to the channel's Voice-Op list. If the nick or mask is already present in another list, its access will be changed to VOP.

DEL removes the specified mask or nick from the channel's Voice-Op list, or the mask or nick corresponding to the specified number.

LIST shows the complete list of the channel's Voice-Ops, or optionally only those matching the specified mask.

FIND searches for entries matching the specified mask (in the format nick!user@host).

CLEAN removes all expired nicks from the Voice-Op list.

EXPLIST shows the expired nicks present in the Voice-Op list.

WIPE removes all nicks and masks present in the Voice-Op list.

LOCK locks the list, allowing only the founder to manipulate it. If one of the masks already in the list is specified, only that one will be locked.

UNLOCK unlocks the list, in case it was locked with the LOCK command. If a mask is specified, only that one will be unlocked.

NOTE: replace #channel with the name of the channel you wish to modify, and [nick|mask] with the nick or mask of the user to add.

**Examples:**

```text
/msg ChanServ VOP #Italia ADD MaSCiA
/msg ChanServ VOP #IRCHelp ADD Kab00m
/msg ChanServ VOP #IRCHelp ADD *!*pippo@*.carota.net
/msg ChanServ VOP #IRCHelp DEL 4
/msg ChanServ VOP #IRCHelp LIST pippo*
/msg ChanServ VOP #IRCHelp FIND *!*mau@*.fastweb.fw
/msg ChanServ VOP #IRCHelp LOCK
/msg ChanServ VOP #IRCHelp UNLOCK Kab00m
```

For issues determining masks, see the Recognition Masks section or contact an operator on #IRCHelp.

### ChanServ - WHY

Explains why and on what basis ChanServ grants a certain access level on the channel to the specified user (for example, the reason a user is an operator). It can only be used by a user present in one of the channel's lists.

**Syntax:**

```text
/msg ChanServ WHY #canale nickname
```

**Example:**

```text
/msg ChanServ WHY #soleluna ^Norad^
```

### BanType

These are the available values for SET BANTYPE and for the bantype parameter of the AKICK command

| Value | Ban format |
|:------:|-----------------|
| 0 | Ban in the format `*!user@host` |
| 1 | Ban in the format `*!*user@host` |
| 2 | Ban in the format `*!*@host` |
| 3 | Ban in the format `*!*user@*.host` |
| 4 | Ban in the format `*!*@*.host` |
| 5 | Ban in the format `nick!user@host` |
| 6 | Ban in the format `nick!*user@host` |
| 7 | Ban in the format `nick!*@host` |
| 8 | Ban in the format `nick!*user@*.host` |
| 9 | Ban in the format `nick!*@*.host` |

## MemoServ commands

MemoServ is a service that allows users to exchange messages with each other, even when the recipient is not connected to the IRC network. To use MemoServ, both your nickname and the recipient's must be registered with NickServ and authenticated.

It is also possible to send messages to channels, which will be read by the founder and by the operator categories you decide to forward the message to, a feature that can be very useful for putting a channel's regulars in touch with its managers.

- **DEL** - Marks the message as "to be deleted"
- **FORWARD** - Selects the nickname to which received memos should be forwarded
- **HELP** – On-line help for the MemoServ service
- **IGNORE** – Allows you to manage the Memo Ignore list
- **LIST** - Shows the list of messages
- **NEWS** - Shows the latest news on the Azzurra network
- **PURGE** - Deletes messages marked as "to be deleted"
- **READ** - Reads a message
- **SEND** - Sends a new message to a user
- **SENDTO** - Sends a new message to a channel
- **SET** - Changes MemoServ settings
- **UNDEL** - Undoes the change made with the DEL command
- **UNSEND** - Deletes a sent memo (if the recipient has not already read it)

For more information, once connected to the IRC network, type: `/msg MemoServ HELP`

### MemoServ - DEL

This command allows you to mark a message as "to be deleted". In the LIST command output a "D" will appear before the message number. These memos will actually only be deleted once the PURGE command is used, or they will be automatically deleted on disconnection.

**Syntax:**

```text
/msg MemoServ DEL numero
/msg MemoServ DEL ALL [CHANNEL|NEW|USER]
```

ALL marks all memos as to be deleted.

ALL CHANNEL marks all memos sent to channels.

ALL NEW marks all memos not yet read.

ALL USER marks all memos sent by other users.

NOTE: replace numero with the number of the message you intend to delete. To see which number identifies a given message, use the LIST command.

**Examples:**

```text
/msg MemoServ DEL 6
/msg MemoServ DEL ALL
/msg MemoServ DEL ALL USER
```

### MemoServ - FORWARD

This command allows you to select a nickname to which all messages sent by other users will be forwarded. The nick must be registered and you must be identified. This is not a way to "hide" since whoever sends the message is informed that their memo is automatically forwarded to a different nickname. It is mainly intended to make it easier for a user who wants to change nickname, so that they don't have to tell all their "correspondents" to send messages to a different nickname. To disable this option, set NONE instead of the nick.

**Syntax:**

```text
/msg MemoServ FORWARD nickname|NONE
```

**Example:**

```text
/msg MemoServ FORWARD ^Sanuye^
/msg MemoServ FORWARD NONE
```

### MemoServ - HELP

This is the command to get on-line help on the MemoServ service.

**Syntax:**

```text
/msg MemoServ HELP [comando]
```

**Examples:**

```text
/msg MemoServ HELP
/msg MemoServ HELP SENDTO
/msg MemoServ HELP SET IGNORETYPE
```

### MemoServ - IGNORE

This command allows you to view and modify the nick's Memo Ignore List.

Depending on the IGNORETYPE option setting, memos sent by nicks present in the Memo Ignore List will either be ignored or will be the only ones considered.

**Syntax:**

```text
/msg MemoServ IGNORE ADD nick
/msg MemoServ IGNORE DEL nick|numero
/msg MemoServ IGNORE LIST
/msg MemoServ IGNORE WIPE
```

ADD adds the specified nick to the Ignore List.

DEL removes the specified nick from the Ignore List, or the nick corresponding to the specified number.

LIST displays the complete list of nicks in the Ignore List.

WIPE removes all nicks present in the Ignore List.

**Examples:**

```text
/msg MemoServ IGNORE ADD ^L4m3r^
/msg MemoServ IGNORE LIST
/msg MemoServ IGNORE DEL 2
/msg MemoServ IGNORE DEL ^L4m3r^
/msg MemoServ IGNORE WIPE
```

### MemoServ - LIST

This command shows the list of all messages present in your memobox, which cannot contain more than 32. Any memos not yet read will appear with a "*" next to them, while any memos marked as deleted will have a "D" next to them. Messages will in any case be deleted after 21 days.

**Syntax:**

```text
/msg MemoServ LIST [CHANNEL|USER|NEW]
```

CHANNEL shows only memos sent to channels.

USER shows only memos sent by other users.

NEW shows only new (unread) memos.

With no parameters, all memos are shown.

**Examples:**

```text
/msg MemoServ LIST
/msg MemoServ LIST CHANNEL
/msg MemoServ LIST USER
/msg MemoServ LIST NEW
```

### MemoServ - NEWS

Reads the latest Azzurra news. MemoServ will keep notifying you of this message's presence until it is read, after which it will still be available but will no longer be notified. Sending NEWS memos is reserved to IRCOps only.

**Syntax:**

```text
/msg MemoServ NEWS
```

**Example:**

```text
/msg MemoServ NEWS
```

### MemoServ - PURGE

This command deletes all messages marked as "to be deleted" with the DEL command, i.e. those that appear with a "D" next to them in the LIST command.

WARNING: once the PURGE command is given, it will no longer be possible to recover the deleted messages.

**Syntax:**

```text
/msg MemoServ PURGE
```

**Example:**

```text
/msg MemoServ PURGE
```

### MemoServ - READ

Reads the content of a message. Displays the text of the message corresponding to the specified number. To read the latest memo received, simply specify LAST as the number.

**Syntax:**

```text
/msg MemoServ READ numero|LAST
```

NOTE: in place of numero enter the number of the message you want to read. To see which number identifies a given message, use the LIST command.

**Examples:**

```text
/msg MemoServ READ 3
/msg MemoServ READ LAST
```

### MemoServ - SEND

This command allows you to send short messages (max 400 characters) to other users registered with NickServ (to send memos to channels, see the SENDTO command). The recipient will be notified of the message's arrival according to their NOTIFY settings.

**Syntax:**

```text
/msg MemoServ SEND nickname messaggio
```

**Example:**

```text
/msg MemoServ SEND Nicola Devo dirti una cosa. Querami appena puoi
```

### MemoServ - SENDTO

This command allows you to send short messages to a channel registered with ChanServ (to send them to users, see the SEND command). The syntax is the same as the SEND command except that you must also specify the user category (VOP, HOP, AOP, SOP, CF) that will receive the message. All user categories above the specified one will also receive the message. Only those in a list equal to or higher than the one specified with the MEMOLEVEL option will be able to send memos to the channel.

NOTE: The founder will receive memos regardless of the chosen level.

**Syntax:**

```text
/msg MemoServ SENDTO #canale VOP|HOP|AOP|SOP|CF messaggio
```

**Examples:**

```text
/msg MemoServ SENDTO #irchelp AOP Attenzione a [{^SgRunF^}] è un lamer.
/msg MemoServ SENDTO #Soleluna VOP Oggi è primavera!!! Auguri a Benedetta
```

### MemoServ - SET

Allows you to configure MemoServ options. To use this command you must be identified to your own nick.

- **IGNORETYPE** - Allows you to decide how the Memo Ignore list is used.

  Syntax:

  ```text
  /msg MemoServ SET IGNORETYPE parametro
  ```

  The available parameters are:

  | Parameter | Effect |
  |:---------:|---------|
  | 1 | Memos sent by nicks present in the Ignore List will be ignored. |
  | 2 | All memos will be ignored except those sent by nicks present in the Ignore List. |

  Example:

  ```text
  /msg MemoServ SET IGNORETYPE 2
  ```

- **NOTIFY** - Allows you to choose when you want to be notified of the presence of new memos.

  Syntax:

  ```text
  /msg MemoServ SET NOTIFY ON
  /msg MemoServ SET NOTIFY LOGON
  /msg MemoServ SET NOTIFY NEW
  /msg MemoServ SET NOTIFY OFF
  ```

  | Parameter | Effect |
  |-----------|---------|
  | ON | Notification occurs when the nick is identified and when a memo is sent. |
  | LOGON | Notification occurs only when the nick is identified. |
  | NEW | Notification occurs when a memo is sent. |
  | OFF | No notification. |

  Examples:

  ```text
  /msg MemoServ SET NOTIFY ON
  /msg MemoServ SET NOTIFY NEW
  ```

### MemoServ - UNDEL

Undoes the effect of the DEL command, i.e. removes the "to be deleted" mark from a message. If the specified memo had previously been marked as to be deleted, i.e. it has a "D" next to it, this is removed, and the message will not be deleted when you disconnect or use the PURGE command. By specifying ALL instead of the memo number, the "D" will be removed from all messages marked as to be deleted.

**Syntax:**

```text
/msg MemoServ UNDEL numero|ALL
```

NOTE: in place of numero enter the number of the message you want to apply the change to. To see which number identifies a given message, use the LIST command.

**Examples:**

```text
/msg MemoServ UNDEL 3
/msg MemoServ UNDEL ALL
```

### MemoServ - UNSEND

Retrieves a message previously sent to a user or a channel. If the recipient user has already read the message, this command will have no effect. If instead the message has not yet been read, it will be deleted with this command, and the recipient, if they are on-line at that moment, will be warned via notice that the memo has been retrieved.

**Syntax:**

```text
/msg MemoServ UNSEND nickname|#canale lista
```

**Examples:**

```text
/msg MemoServ UNSEND debiAn
/msg MemoServ UNSEND #irchelp VOP
```

## SeenServ commands

SeenServ is a service that allows you to know when a given user last connected

- **HELP** – On-line help for the SeenServ service
- **SEEN** - Searches for a specific nick in the database
- **SEENNICK** – Similar to the seen command but provides more detail

The language of SeenServ messages is tied to the IP you connect with.

Information is only available for connections that occurred in the last 7 days.

For more information, once connected to the IRC network, type: `/msg SeenServ HELP`

### SeenServ - HELP

This is the command to get on-line help on the SeenServ service.

**Syntax:**

```text
/msg SeenServ HELP [comando]
```

**Examples:**

```text
/msg SeenServ HELP
/msg SeenServ HELP SEENNICK
```

### SeenServ - SEEN

Allows you to search for a nick within the database (searches with masks or parts of a nick are not possible).

**Syntax:**

```text
/msg SeenServ SEEN nickname
```

**Example:**

```text
/msg SeenServ SEEN Martin
```

### SeenServ - SEENNICK

Allows you to obtain information about the last time a given user was seen, including when they were seen, the last address used, and whether they were identified to the nick they were using and whether they changed nick. However, it is not possible to know what the new nick is, for privacy reasons.

**Syntax:**

```text
/msg SeenServ SEENNICK nickname
```

**Example:**

```text
/msg SeenServ SEENNICK ^Norad^
```

## StatServ commands

StatServ is a service that allows you to know the statistics of a channel

- **CHANSTATS** - Shows the statistics available for a channel
- **HELP** – On-line help for the StatServ service

For more information, once connected to the IRC network, type: `/msg StatServ HELP`

### StatServ - CHANSTATS

Shows some statistics for a channel, including the user record, the number of joins, the number of bans, etc.

To use this command you must be an operator (@) in the channel for which you are requesting statistics.

Legend of the results obtained:

| Code | Meaning |
|-------|-------------|
| T = Total | (Total statistics since the start of monitoring) |
| M = Monthly | (Total for the current month) |
| W = Weekly | (Total for the current week) |
| D = Daily | (Total for the current day) |

**Syntax:**

```text
/msg StatServ CHANSTATS #canale
```

**Example:**

```text
/msg StatServ CHANSTATS #Italia
```

### StatServ - HELP

This is the command to get on-line help on the StatServ service.

**Syntax:**

```text
/msg StatServ HELP [comando]
```

**Examples:**

```text
/msg StatServ HELP
/msg StatServ HELP CHANSTATS
```

## HelpServ commands

For information about on-line help type `/msg HelpServ HELP`

To display the modes available on Azzurra for nicks and channels, the following commands are also available:

- **CMODE** - Displays the Channel Modes available on this network
- **HELP** - On-line help for the HelpServ service
- **UMODE** - Displays the User Modes available on this network

On-line help is also available for all commands.

### HelpServ - CMODE

This command gives you the list of Channel Modes available on Azzurra.

**Syntax:**

```text
/msg HelpServ CMODE
```

### HelpServ - HELP

This is the command to get on-line help on the HelpServ service.

**Syntax:**

```text
/msg HelpServ HELP
```

**Examples:**

```text
/msg HelpServ HELP
```

### HelpServ - UMODE

This command gives you the list of User Modes available on Azzurra.

**Syntax:**

```text
/msg HelpServ UMODE
```

### Help on-Line

For help on nick registration and control, type: `/msg NickServ HELP`

For help on channel registration and control, type: `/msg ChanServ HELP`

For help on the message-sending service for users not connected, type: `/msg MemoServ HELP`

For help on searching for information about nicks, type: `/msg SeenServ HELP`

For help on searching channel statistics, type: `/msg StatServ HELP`

For help on user or channel modes, type: `/msg HelpServ HELP`

Help on a specific command is obtained by typing:

```text
/msg ChanServ|NickServ|MemoServ|SeenServ|StatServ|HelpServ HELP comando
```

**Examples:**

```text
/msg ChanServ HELP REGISTER
/msg ChanServ HELP SET DESC
/msg NickServ HELP GHOST
/msg NickServ HELP SET EMAIL
/msg MemoServ HELP SENDTO
/msg HelpServ HELP CMODE
```

## Modes

Several user and channel modes are available on Azzurra:

- [User Modes](#user-modes) – Available user modes
- [Channel Modes](#channel-modes) – Available channel modes

### User Modes

| Mode | Description |
|:----:|-------------|
| a | (Services Only) Marks a Services Administrator. |
| h | (HelpOp Only) Marks a Help Operator (+h can only be obtained via identification). |
| i | Invisible to users running the /names or /who command. |
| j | Marks a client chatting from the web via Java. |
| r | (Services Only) Marks a nick registered with NickServ and identified. |
| R | Accepts queries only from nicks registered with NickServ and identified. |
| S | Marks a client connecting via SSL (Secure Sockets Layer). |
| w | Allows viewing WALLOPS messages. |
| x | Encrypts part of the host or IP. |
| z | (Services Only) Marks a Services Agent. |

**Syntax:**

```text
/umode [+|-modes]
```

or

```text
/mode nick [+|-modes]
```

**Examples:**

```text
/mode ^Norad^ +w-i
/mode ^Norad^      (per vedere i modes impostati sul proprio nick)
```

### Channel Modes

| Mode | Param | Description |
|:----:|:-----:|-------------|
| b | mask | Allows banning a mask in the format nick!user@host (or just a nick) from a channel. |
| B | | Hides the ban list from anyone who is not a channel operator or halfop. |
| c | | Prevents sending messages containing colors to the channel. |
| C | | Prevents sending CTCP to the channel. |
| d | | Prevents nick changes for anyone who is not an operator, halfop or voice in the channel. |
| h | nick | Allows setting a nickname as half operator of the channel. |
| i | | Makes the channel invite-only. |
| j | | Allows only users identified to a registered nick to join the channel. |
| k | key | Makes the channel password-protected. |
| l | max | Sets the maximum number of users who can be in the channel. |
| m | | Makes the channel moderated: only **+o**, **+h** and **+v** can speak. |
| M | | Makes the channel moderated: only those who are identified can speak, or **+o**, **+h** and **+v**. |
| n | | Prohibits sending messages to the channel from outside. |
| o | nick | Allows setting a nickname as channel operator. |
| p | | Makes the channel private (does not appear in /WHOIS, the topic is hidden in /LIST). |
| r | | (Services Only) Marks a channel registered with ChanServ. |
| R | | Allows only nicks registered with NickServ to join the channel. |
| s | | Makes the channel secret (does not appear in /WHOIS or /LIST). |
| S | | Allows only nicks connected via SSL to join the channel. |
| t | | Allows only operators to change the topic. |
| u | | Does not show QUIT and PART messages of channel users. |
| U | | Allows unidentified foreign users to join the channel. |
| v | nick | Grants a nickname voice rights on a moderated channel (+m). |
| z | mask | Anyone matching the mask can only join the channel if identified with NickServ. |

The **j** mode is not currently supported by services.

**Syntax:**

```text
/mode #canale [+|-modes [parametri]
```

**Examples:**

```text
/mode #baruffa +mi
/mode #IRCHelp +l 10238
/mode #Io&Te +k finalmentesoli
/mode #hack +m-si
/mode #Operhelp +b *pippo@*interbusiness.it
/mode #Lilliput +o Gulliver
/mode #Soleluna         (per vedere i mode impostati)
/mode #Italia +b        (per vedere i ban impostati)
```

## Miscellaneous

A brief guide explaining how to solve some of the most common problems users may encounter.

- [IRC Commands](#bahamut---user-commands) – The user commands of Azzurra's IRC daemon
- [Help Ident](#help-ident) - A misconfigured Ident may prevent connecting
- [Help DCC](#help-dcc) - Some file transfers may be blocked by the server
- [Recognition masks](#recognition-masks-on-irc) – What masks are for and how they are determined
- [Azzurra details](#azzurra-irc-network-details) – Network particulars
- [Azzurra's Servers](#azzurras-servers) – Linked servers and addresses
- [Useful links](#useful-links) – Help and information about Azzurra

For more information, once connected to the network type: `/join #IRCHelp`

### Bahamut - User Commands

#### ADMIN

Provides administrative information about the server. If **dest** is specified, the reply will be provided by the indicated server: a nick or a server address can be specified.

**Syntax:**

```text
/ADMIN [dest]
```

**Examples:**

```text
/ADMIN
/ADMIN tin.azzurra.chat
/ADMIN cheapnet*
```

#### AWAY

If a **message** is specified, it sets away status and the **message** appears in the whois; otherwise it removes away status.

**Syntax:**

```text
/AWAY [:messaggio]
```

**Examples:**

```text
/AWAY Sto lavorando, non disturbare
/AWAY
```

#### DCCALLOW

Adds or removes nicks from the allowed DCC list. Anyone on this list will be able to send you files with extensions normally blocked by the server. With the list option you get the list of people currently on your DCC allow list. The help option provides information similar to what is described here.

**Syntax:**

```text
/DCCALLOW +|-nick[,+|-nick ...]
/DCCALLOW LIST
/DCCALLOW HELP
```

**Examples:**

```text
/DCCALLOW +Mirtilla,+Antonio
/DCCALLOW –Robert
/DCCALLOW LIST
```

#### HELP

Provides the list of available commands, one per line.

**Syntax:**

```text
/HELP
```

#### INFO

Provides information about the server you are connected to, or about a remote server if specified in **dest**: a nick or a server address can be indicated.

**Syntax:**

```text
/INFO [dest]
```

**Examples:**

```text
/INFO
/INFO sbrize.azzurra.chat
```

#### INVITE

Invites **nick** to the specified channel.

**Syntax:**

```text
/INVITE nick #canale
```

**Example:**

```text
/INVITE kavia #radioitalia
```

#### ISON

Provides the list of the indicated nicks that are currently online, if any.

**Syntax:**

```text
/ISON nick[ nick ...]
```

**Examples:**

```text
/ISON ^Norad^
/ISON Mirtilla ^Ruby^ Casper
```

#### JOIN

Attempts to join the specified channel(s), with the specified key(s), if required. Each key corresponds to a channel in the same position in the list; for example `"JOIN #c1,#c2,#c3 k2,k3"` is not correct if keys k2 and k3 are for #c2 and #c3, respectively. Instead `"JOIN #c1,#c2,#c3 k1,k2"` is correct if the first two channels require the indicated keys. Specifying 0 as the channel name results in leaving all channels you are currently in.

**Syntax:**

```text
/JOIN #canale[,#canale ...] [key[,key ...]]
```

**Examples:**

```text
/join #Italia
/join #Soleluna,#IRCHelp
/join #SoloNoi paperotto
/join #Antipatici,#Macedonia war54,ciliegia
```

#### KICK

Kicks the specified nick(s) from the specified channel(s), with an optional reason. The kicks are carried out for all indicated nicks in all indicated channels.

**Syntax:**

```text
/KICK #canale[,#canale ...] nick[,nick ...(2)] [:motivo]
```

**Examples:**

```text
/kick #IRCHelp ^L4m3r^ Non disturbare
/kick #Soleluna,#Liberozone,#Italia warBoT Niente guerra qui
```

#### LINKS

Provides the list of servers currently connected to the network. If a mask is specified, only the matching links are provided. If **dest** is specified, the request is sent to the indicated remote server.

Colors distinguish servers at the same "level", meaning servers with the same hopcount will be represented with the same color.

Hopcount is the number of "hops" needed to reach that given server, starting from the server you are connected to or from the specified **dest** server.

**Syntax:**

```text
/LINKS [dest][mask]
```

**Examples:**

```text
/LINKS
/LINKS 2night.azzurra.chat *.azzurra.chat
```

#### LIST

Provides the list of open channels.

**Syntax:**

```text
/LIST [opzioni]
```

The available options are:

| Option | Description |
|---------|-------------|
| `>utenti` | provides the list of channels with at least a number of users greater than utenti |
| `<utenti` | provides the list of channels with a number of users lower than utenti |
| `mask` | provides the list of channels whose name matches the given mask |
| `!mask` | provides the list of channels whose name does not match the given mask |
| `canale` | the list includes only the specified channel |

**Examples:**

```text
/LIST
/LIST >30
/LIST <50
/LIST >1 <20
/LIST *musica*
/LIST #Soleluna
```

#### LUSERS

Provides statistics about the user base. If **dest** is specified, the reply will be provided by the indicated server: a nick or a server address can be specified. The second parameter (*) has no meaning but is kept for backward compatibility with previous versions.

**Syntax:**

```text
/LUSERS [* dest]
```

**Examples:**

```text
/LUSERS
/LUSERS * caltanet.azzurra.chat
```

#### MODE

Changes the user modes (if specified) and provides the current user modes. **nick** must be the nick of whoever runs the command. A '+' enables the mode, while a '-' disables it. Modes can be combined, for example: `"/MODE mynick +i-wg+s"` (enables modes 'i' and 's', and disables modes 'w' and 'g'). At most 6 modes can be set per command.

**Syntax:**

```text
/MODE nick [+|-modes]
```

**Examples:**

```text
/mode ^Norad^ +w-i
/mode ^Norad^
```

#### MODE

The same as above, but for channels. Some channel modes require parameters, which are separated by spaces.

**Syntax:**

```text
/MODE #canale [+|-modes [parametri]]
```

**Examples:**

```text
/mode #IRCHelp +l 10526
/mode #Io&Te +k finalmentesoli
/mode #hack +m-si
/mode #Operhelp +b *pippo@*interbusiness.it
/mode #Lilliput +o Gulliver
/mode #Soleluna (per vedere i mode impostati)
/mode #Italia +b (per vedere i ban impostati)
```

#### MOTD

Provides the Message Of The Day. If **dest** is specified, the reply is provided by the specified server, which can be a nick or a server address.

**Syntax:**

```text
/MOTD [dest]
```

**Examples:**

```text
/MOTD
/MOTD wmgitalia.azzurra.chat
```

#### NAMES

Provides the list of clients present in the specified channel, with an indication of op or voice status where applicable. Names on +s channels are only provided if you are currently present in that channel; the same applies to clients set +i (invisible).

**Syntax:**

```text
/NAMES #canale
```

**Example:**

```text
/NAMES #Liberozone
```

#### NICK

Changes your nickname.

**Syntax:**

```text
/NICK nickname
```

**Example:**

```text
/NICK ^Norad^
```

#### NOTICE

Can be used to send a notice to the specified nick (or a list of nicks). If the recipient's server name is specified, the notice will only be sent if the nick is connected to that server. This is a security measure, especially for the network's services.

It can also be used to send a notice to the specified channel (or a list of channels). If the channel name is preceded by the '@' character, the notice will be sent to all of the channel's ops. Similarly, with the '+' symbol the notice will be directed to all voices, and to both if the two symbols are present together.

**Syntax:**

```text
/NOTICE nick[@nomeserver][,nick[@nomeserver] ...(18)] :messaggio
/NOTICE [@][%][+]#canale[,[@][%][+]#canale ...(18)] :messaggio
```

**Examples:**

```text
/NOTICE Rodolfo Stammi lontano che non voglio parlarti
/NOTICE Mirtilla,Casper,Antonio Facciamo un quiz?
/NOTICE #Liberozone Buonasera!
/NOTICE @+#IRCHelp Ci vediamo domani
```

#### PART

Lets you leave the #canale with an optional message.

**Syntax:**

```text
/PART #canale[,#canale ...] [:messaggio]
```

**Examples:**

```text
/PART #Italia A dopo!
/PART #Soleluna,#italia esco, ci vediamo
```

#### PRIVMSG

Can be used to send a message to the specified nick (or a list of nicks). If the destination server name is specified, the message will only be sent if the nick is connected to the indicated server. This is a security measure, especially for the Network's services.

It can also be used to send a message to a specified channel (or a list of channels). If the channel name is preceded by the '@' character, the message will be sent to all of the channel's ops. Similarly, with the '+' symbol the message will be directed to all voices, and to both if the two symbols are present together.

**Syntax:**

```text
/PRIVMSG nick[@nomeserver][,nick[@nomeserver] ...(18)] :messaggio
/PRIVMSG [@][%][+]#canale[,[@][%][+]#canale ...(18)] :messaggio
```

**Examples:**

```text
/PRIVMSG Martin Ti va di chiacchierare?
/PRIVMSG _ZIP_,Jenny Sono tornato!
/PRIVMSG #Baraonda Buonasera!
/PRIVMSG @%+#italia Ciao
```

#### QUIT

Disconnects from IRC, with an optional comment.

**Syntax:**

```text
/QUIT [:commento]
```

**Examples:**

```text
/QUIT
/QUIT Torno dopo
```

#### SILENCE

Adds or removes the specified nick!user@host mask from the silence list. Clients whose mask matches one on the silence list will not be able to send you PRIVMSG or NOTICE. If no mask is specified, the command provides a list of the masks present in your silence list. The list can contain at most 10 masks. The list is emptied on disconnection.

**Syntax:**

```text
/SILENCE [+|-mask]
```

**Examples:**

```text
/SILENCE +*!*bau@*tiscali.it
/SILENCE –Casper!*@*
/SILENCE
```

#### STATS

Provides statistics from the server. If **dest** is specified, the reply is provided by the indicated server: a nick or a server address can be specified.

**Syntax:**

```text
/STATS flag [dest]
```

There are no flags available to users

#### TIME

Provides the server's local time. If **dest** is specified, the reply is provided by the indicated server: a nick or a server address can be specified.

**Syntax:**

```text
/TIME [dest]
```

**Examples:**

```text
/TIME
/TIME cheapnet.azzurra.chat
```

#### TOPIC

Shows a channel's topic or changes it if one is specified.

**Syntax:**

```text
/TOPIC #canale [topic]
```

**Examples:**

```text
/TOPIC #Liberozone
/TOPIC #IRCHelp =A= Azzurra IRC Help Channel =A= http://help.azzurra.chat prima di domandare =A=
```

#### USERS

Provides the number of local and global users (current and maximum). If **dest** is specified, the reply will be provided by the indicated server: a nick or a server address can be specified.

**Syntax:**

```text
/USERS [dest]
```

**Examples:**

```text
/USERS
/USERS ssitalia.azzurra.chat
```

#### USERHOST

Provides summary information on the specified nick(s). First the nickname, followed by a '*' if they are an IRCop, the '=' character, '-' if away ('+' if not), username@hostname. Multiple replies are separated by spaces.

**Syntax:**

```text
/USERHOST nick[ nick ...(3)]
```

**Examples:**

```text
/USERHOST Casper,Mirtilla,Alberto
/USERHOST ^Norad^
        > ^Norad^*=-~Norad@birillo.tiscali.com
```

#### VERSION

Provides version information about the IRCd for the server you're connected to, or for a remote server if specified. If **dest** is specified, the reply will be provided by the indicated server: a nick or a server address can be specified.

**Syntax:**

```text
/VERSION [dest]
```

**Examples:**

```text
/VERSION
/VERSION b-network.azzurra.chat
```

#### WATCH

Adds or removes the specified nick(s) from the watch list. You will be notified when someone on your watch list connects or disconnects. If no nick is specified, the list of currently online nicks on the watch list will be provided. The same command is used to get information about your own watch list. The list can contain at most 128 nicks.

**Syntax:**

```text
/WATCH [+|-nick][ +|-nick ...]
/WATCH [flag]
```

Available flags are:

| Flag | Descrizione |
|------|-------------|
| `c\|C` | clears the watch list |
| `s\|S` | shows the general status |
| `l` | provides information on currently online nicks |
| `L` | provides information on all nicks |

**Examples:**

```text
/WATCH +Mirtilla
/WATCH C
/WATCH L
```

These commands are normally handled by the client. In mIRC, by the NOTIFY command.

#### WHO

Provides information about the specified nick, channel or users.

**Syntax:**

```text
/WHO nick
/WHO #canale
/WHO mask
/WHO +|-flags [parametri]
```

By specifying a nick or a channel it provides the following information: channel, nickname, username, hostname, connection server, hopcount i.e. the number of servers between the nick and whoever issued the command, status flags, and real name, in the format:

```text
[server] [#canale] nickname H|G[S][*][@|%|+] user host :hopcount real_name
```

Specifying a channel provides information on all clients in that channel. Mirc does not show the connection server; the channel is only specified if a `/who #canale` is run.

The letters H|G stand for Here (present) and Gone (away, not present).

S is present if the user is using an SSL connection.

The asterisk * marks IRCops.

@ % and + are the channel access level: Op, HalfOp or Voice.

Hopcount is the number of server "hops" needed to reach that given user.

For example:

```text
#irchelp ^Norad^ H*S @ ~Norad@birillo.tiscali.com :3 =^.^= Rauha =^.^=
```

When providing a mask: if the mask contains a '.', it is compared against the hostnames of all visible online clients (not set +i); otherwise it is compared against the nicks of all visible online clients. Information is provided for all clients for whom a match was found.

Flags must be specified like user or channel modes – e.g. "-a+c" means "not away" and "on the specified channel". The flags are as follows:

| Flag | Parametro | Descrizione |
|------|-----------|-------------|
| `a` | | the user is away |
| `C` | | shows the first visible channel the user is in |
| `M` | | searches for users in the same channel I'm in |
| `c` | `#canale` | the user is on the specified channel (no wildcards) |
| `h` | `mask` | the user's host matches the mask |
| `m` | `umodes` | the user has the specified usermodes (o/A/a only) |
| `n` | `mask` | the nick matches the specified mask |
| `s` | `server` | the user is on the specified server (no wildcards) |
| `u` | `mask` | the user's username matches the specified mask |

**Examples:**

```text
/WHO ^Norad^
/WHO #Soleluna
/WHO +ch #italia *pool8250.interbusiness.it
```

#### WHOIS

Provides information about the specified nick (or a list of nicks): nickname, username, hostname, real name, channels they're in, connection server, information about the connection server, nick registration status, away status, IRC operator status, user modes and idle time [the latter only if the user is on the same server, or if the request is made to the server they're connected to, or by also putting the nick as **dest**]. If **dest** is specified the request is sent to the indicated server: a nick or a server address can be specified.

**Syntax:**

```text
/WHOIS [dest] nick[,nick ...]
```

**Examples:**

```text
/WHOIS Mirtilla
/WHOIS Antonio,Robert
/WHOIS Casper Casper
/WHOIS libero.azzurra.chat Casper
```

#### WHOWAS

Provides the recorded information for the specified nick (or a list of nicks) from when it was online: nickname, username, hostname, real name, connection server, and disconnection time (UTC). If **max** is specified, information is only provided for the last **max** times the nick was used; by default all are provided. If **dest** is specified, the request is sent to the remote server (information is limited to the last 20 instances): a nick or a server address can be specified.

**Syntax:**

```text
/WHOWAS nick[,nick ...] [max [dest]]
```

**Examples:**

```text
/WHOWAS ^Norad^
/WHOWAS Mirtilla,Casper
/WHOWAS Alfredo5 nexlab.azzurra.chat
```

**NOTE:** The colon (:) in the syntax of some commands is used to let the IRCd know that what follows is of indefinite length; in reality many clients process commands in such a way that the colon is not necessary (and it has not been included in the examples) — in fact if it is included in the command it will then appear in the message or the specified reason.

Some commands are also recognized by clients as their own commands. To have them passed to the server without being processed by the client, you need to prefix the command with `/QUOTE`.

**Examples:**

```text
/QUOTE VERSION
/QUOTE HELP
```

### Help Ident

For a correct, trouble-free connection, you may need to enable the IDENT server in mIRC's options. To enable it, follow these simple steps:

- Open Options, by pressing ALT and O at the same time
- Go to Connect and then to Identd
- Check the Enable Ident server checkbox
- Fill in the User ID field with your username
- Fill in the System field with your operating system (it is however recommended to set it to UNIX)
- Fill in the Port field with the port for the Ident request (usually 113)

Note: an incorrect User ID setting can prevent connection to the server.

Single-character User IDs that are not a letter of the alphabet (a...z) are in fact forbidden, as are User IDs containing "strange" characters ($, @, !, and so on).

If you still cannot connect even after setting up Ident, you must:

- Open Options, by pressing ALT and O at the same time
- Go to Connect
- Check that the E-Mail Address field does not contain the "strange" characters mentioned above

If you still cannot connect, it is the fault of your script, which forces its own ident that probably contains disallowed characters. You will be forced to change script, or to type `/remote off` before connecting to one of our servers.

### Help DCC

By default, the server blocks DCC transfer of files with the extensions .JS, .PL, .EXE, .COM, .BAT, .DLL, .INI, .VBS, .PIF, .MRC, .SCR, .DOC, .XLS, .LNK, .SHS, .ZIP, .RAR, .ACE, .PHP, .ASP, .HTA, .HTM and .HTML, as they are likely vehicles for viruses and trojans. In this case, the sender of the file will get a message like this:

```text
-irc.azzurra.chat- Per l'invio di files *.exe e' richiesta l'autorizzazione del ricevente. Fai sapere a NICK che deve digitare /DCCALLOW +NICK per poter ricevere questo file.
```

while the intended recipient will get a notice like this:

```text
-irc.azzurra.chat- L'utente NICK (user@host) ha provato ad inviarti un file chiamato nomefile.exe. Per la ricezione di questo file e' necessaria la tua autorizzazione. Se hai la certezza che non si tratti di un file infetto, digita /DCCALLOW +NICK per riceverlo.
```

However, if the recipient is sure the file is safe, the `/DCCALLOW` command must be used to allow receiving files of that type from a given nick.

Syntax of the **DCCALLOW** command:

- `/DCCALLOW +nickmittente` (allows receiving files from nickmittente)
- `/DCCALLOW -nickmittente` (blocks receiving suspicious files from nickmittente)
- `/DCCALLOW LIST` (displays the list of nicks from which receiving suspicious files is allowed)

**Note**: The DCCALLOW list is cleared every time you disconnect from the server. Also, as soon as a user on your list disconnects from the server, they are automatically removed from your list.

**Example:**

**nick1** sends file.exe via DCC to **nick2**\
**nick1** will see the message shown above\
**nick2**, to receive the file, will have to type `/DCCALLOW +nick1` and have the file sent again\
to then remove **nick1** from the list, **nick2** will have to type `/DCCALLOW -nick1`

### Recognition masks on IRC

Quite often, IRC and services commands ask for a 'mask' as a parameter, which leaves those unfamiliar with it puzzled. This short text aims to clarify a bit what a mask is and how it can be used to identify a user or a connection.

Each user on IRC is associated with a mask, i.e. a set of characters and numbers that characterize their connection to the server.\
This mask is visible through a number of commands, for example whois. So let's examine the mask in more detail, by requesting information on a hypothetical nick 'pippo' with the command `/whois pippo`.\
Something like this will come out:

```text
pippo is carota@62.98.Azzurra-3A0D51CC
...
altre informazioni
...
```

The part of the whois that interests us is where the mask appears (usually one of the first lines). The mask is structured in three parts:

```text
nick!user@host
```

As you can see, an exclamation point separates the nick from the user, and an at sign separates the user id from the host. In particular, whois only shows the user@host part, without the nick, which is there nearby anyway. So, picking up the previous example, the complete mask would be:

```text
pippo!carota@62.98.Azzurra-3A0D51CC
```

So, just as we can refer to a user through their nick (which is what we're used to doing), for certain purposes it can be useful to refer to their mask, or better still, to part of it.

Let's take as an example a classic command that uses the mask, the ban. To ban someone we can use `/mode #canale +b NICK`, but this will simply put a ban on the nick, in the form `nick!*@*`\
We will see later what those asterisks that replace the other two empty fields mean.

Based on what was said before, we could ban using, instead of the nick, another part of the mask. After all, a ban on the nick is rather ineffective, since the person in question will just have to change nick to get back into the channel.\
So let's get the guy's mask (perhaps through a whois) and use it for a ban. Let's imagine the mask is still

```text
pippo!carota@62.98.Azzurra-3A0D51CC .
```

Let's write `/mode #canale +b *!*@62.98.Azzurra-3A0D51CC`\
This is a more interesting ban. At this point it's worth explaining what those asterisks are. The character **\*** is a 'wildcard character' and it means 'whatever is written in my place'. So, that ban can be read like this:

> perform the operation (in this case the ban) on:\
> any nick and any user id that has as host\
> 62.98.Azzurra-3A0D51CC

At this point it's easy to imagine that the guy will no longer be able to get back into the channel just by changing nick, since the ban is specified with **\*** in place of the nick in the mask, so the ban works on any nick. He will have to change his host, which, in the best case, will mean reconnecting to the internet, with all the inconvenience that entails (especially considering that a ban can be reapplied in an instant).

Similarly, we could set a ban like this:

```text
/mode #canale +b *!carota@*
```

If you've grasped the concept, you will already have correctly interpreted this ban in your mind:

> any nick and any host, that have as userid\
> carota

Imagine what would happen by setting a ban like this:

```text
/mode #canale +b *!*@*
```

You would need particular reasons to set something like this:\
indeed, its meaning is 'everything': any nick, any user id, any host. Applying such a mask to a ban would have the effect of keeping all users out of a channel.\
This is in fact the mask that ChanServ uses to ban all users of a channel in case of a masskick.

A wildcard character doesn't necessarily have to take up a whole field of the mask all to itself.. you can have a lot more fun than that, let's see a few examples...

`/mode #canale +b pi*!*@*` , this ban is triggered on everyone who has a nick starting with pi (with any user id and any mask). So pippo, pirata and pikachu will all be kept out by a ban like this.

`/mode #canale +b *pi*!*@*` , this ban is triggered on everyone who has a nick containing pi (with any user id and any mask). For example pippo, bepi, arpia will be kept out.

`/mode #canale +b *p*i*!*@*` , this ban is triggered on everyone who has a nick containing the letters 'p' and 'i' , in that order but not necessarily adjacent (with any user id and any mask). For example pippo, pamila, serpi will be kept out.

`/mode #canale +b pippo!*@*carota.it` , this ban is triggered on everyone who has the nick pippo AND has a host ending in carota.it

`/mode #canale +b man?!*@*` , here we use the other wildcard character available to us, namely ? . While * meant 'anything (even nothing) in my place' , the character ? means 'exactly one character or number in my place (and it must be there)'. So this ban will work as always on any user id and any host, for nicks mano , mani, mant , man5, man] . It will NOT work, however, on man or on manto. This is because the symbol ? asks for exactly one character in its place, and it requires it.

`/mode #canale +b *!????@*` , this ban is triggered on everyone who has an ident of exactly 4 characters, with any nick and any host.

We've seen all this for the ban, but it's clear that this whole discussion is useful for defining a user or a set of users involved in any command that allows the use of a mask.

### Azzurra IRC Network details

The IRCd used on Azzurra is Bahamut, with patches developed by the staff for IP encryption and for SSL (Secure Sockets Layer) and IPv6 support.

The services, previously based on Sirv, were rewritten from scratch by the Azzurra staff, who constantly take care of keeping them updated.

On Azzurra the possible statuses are voice (+v), halfop (+h) and op (+o), marked respectively by + , % and @.

On Azzurra, &local channels can be opened, accessible only to clients connected to the same server as the one who opened the channel, and #global channels. Only the latter can be registered.

The channel name can be at most 32 characters long, including the initial #.

It is possible to join a maximum of 15 channels at the same time.

In a channel it is possible to set a maximum of 100 bans.

The nick allows ascii characters from ALT+65 to ALT+125, i.e. upper and lower case letters and the characters `` [ \ ] ^ _ ` { | } `` ; numbers and – are also allowed, but not as the first character.

A nick can be at most 30 characters long, the realname at most 50.

The User ID or ident can be at most 10 characters long. The first character is ~ if you don't have an ident server.

The host can be at most 63 characters long; if it is longer, the IP appears instead (encrypted or not depending on whether the +x option is set on the nick or not).

On Azzurra, 3 simultaneous connections (clones) from the same IP are allowed. On the fifth, you get akilled (banned from Azzurra) for 10 minutes.

Topics and kick messages can be at most 307 characters long, quit messages at most 301 (since the message includes "quit: ").

As for the maximum length of messages and notices: the maximum allowed is **512** characters, but this also includes the characters of the command itself: "nick_mittente!user@host PRIVMSG nick_destinatario :", as well as two final control characters.

At connection time, many useful pieces of data are reported. For example:

| Data | Meaning |
|------|-------------|
| `sbrize.azzurra.chat` `bahamut(enterprise)-1.4(34)-azzurra(4.6rc9)-ssl(1.1)` | [server, ircd used and version] |
| `oOiwscrknfydaAbghexzSjFI` `bhijklmMnoOprRstvcdSuU` | [available usermodes and chanmodes] |
| `NOQUIT` | [ircd setting for behavior during netsplits] |
| `WATCH=128` | [maximum number of entries in the notify list] |
| `SAFELIST` | [with this parameter the /list command does not cause disconnection due to flood] |
| `MODES=6` | [maximum number of modes that can be set at the same time] |
| `MAXCHANNELS=15` | [maximum number of channels that can be joined at the same time] |
| `MAXBANS=100` | [maximum number of bans that can be set on a channel] |
| `NICKLEN=30` | [maximum length of nicks] |
| `TOPICLEN=307` | [maximum length of topics] |
| `KICKLEN=307` | [maximum length of kick messages] |
| `CHANTYPES=&#` | [available channel types: & local; # global] |
| `PREFIX=(ohv)@%+` | [possible channel access levels: @ op, % halfop, + voice] |
| `NETWORK=Azzurra` | [network name] |
| `SILENCE=10` | [maximum number of masks that can be set in silence] |
| `CASEMAPPING=ascii` | [indicates the system used by the ircd for uppercase/lowercase comparison] |
| `CHANMODES=b,k,l,cdijmMnOprRsStuU` | [available chanmodes] |

### Azzurra's servers

You can see the servers that make up the Azzurra network with the **LINKS** command. The list changes over time: to connect, the round robin address is enough, which directs you to the first available server.

| Parameter | Value |
|-----------|--------|
| **Server** | `irc.azzurra.chat` |
| **Ports** | `6666`, `6667`, `6668`, `6669` (unencrypted; `6667` is the standard one) |
| **SSL Ports** | `6697`, `9999` (recommended) |
| **IPv6** | supported, same address |

For those who don't want to install a client, or are on a network that only lets web traffic through, there's the browser webchat:\
<https://webchat.azzurra.chat>

### Useful links

| Topic | Link |
|-----------|------|
| Azzurra's website | <https://www.azzurra.chat/> |
| The webchat | <https://webchat.azzurra.chat/> |
| HexChat (Windows / Linux) | <https://hexchat.github.io/> |
| Textual (macOS) | <https://www.codeux.com/textual/> |
| WeeChat (terminal) | <https://weechat.org/> |
| Irssi (terminal) | <https://irssi.org/> |
| mIRC (Windows) | <https://www.mirc.com/> |
| RFC 1459 – the IRC protocol | <https://www.rfc-editor.org/rfc/rfc1459> |
| RFC 2812 – IRC Client Protocol | <https://www.rfc-editor.org/rfc/rfc2812> |
