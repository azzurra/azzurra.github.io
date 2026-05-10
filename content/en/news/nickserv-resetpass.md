---
title: "NickServ: new RESETPASS command to recover your password"
date: 2026-04-20
author: "Azzurra Staff"
tags: ["announcement", "services", "nickserv"]
summary: "If you've forgotten your nick's password and have a valid registered email, you can now reset it on your own through an authorisation code sent to that email."
translationKey: news-nickserv-resetpass
---

We're happy to announce a **new services feature**: NickServ's **RESETPASS** command, which lets you reset your nick's password when you've forgotten it — provided you have a **valid registered email**.

Until today, the only way to recover a nick whose password was lost was to go through the staff. From now on, the procedure is fully **self-service** and based on the email already associated with the nick.

## How it works

The flow is **two-step** and requires a services operator to perform the first step on your behalf (to prevent automated abuse):

1. A services operator runs `/ns SENDPASS <nick>` — services email the registered address a single-use **authorisation code**.
2. You, after checking your inbox, run:

   ```
   /ns RESETPASS <nick> <code> <new-password>
   ```

   If the code is correct, the password is replaced immediately and you can `/ns identify` with the new one.

## Requirements

- The nick must have a **registered, still-valid email**.
- The previous password is **not needed** — the whole point of the command is to regain access without it.
- The code is single-use and has an expiry; if it expires, just request a fresh SENDPASS.

## How to ask for a reset

If you've lost your password and still have access to the registered email, drop into `#IRCHelp` and ask a staffer to run `SENDPASS` for your nick. Once the code arrives by email, run `RESETPASS` yourself.

If you **no longer have access** to the registered email, the self-service reset isn't possible: in that case the manual staff procedure still applies.

---

As always, we keep working to make services more accessible and our users' lives easier.

See you in chat 👋
