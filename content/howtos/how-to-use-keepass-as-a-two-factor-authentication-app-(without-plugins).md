---
title: "How to Use Keepass as a Two-Factor Authentication App (without Plugins)"
date: 2023-02-13T03:19:58-05:00
draft: true
---


KeePass has built-in functionality to act in place of Google Authenticator or other two-factor authentication apps on your phone. The feature is fairly obscure and requires specific String fields to be set on a Password Entry.

{{< hint type=note >}}
This feature is best suited for power users. Non-technical users should strongly consider using a user-friendly KeePass plugin instead.
{{< /hint >}}

## Configuring KeePass

1. Start by creating a new Password Entry. Fill in the *Title*, *User name*, and other basic fields as desired.
2. For *Password*, enter in the value `{TIMEOTP}`.
3. In the *Advanced* tab, add a new *String field*.
4. For the name of the string field, specify `TimeOtp-Secret-Base32`. For the value, enter in the OTP seed value (usually obtained by clicking a "I don't have a camera" button for the service you are trying to add 2FA to).
5. Save and close the entry. New one-time passwords may be obtained by right-clicking the entry and selecting *Copy Password*.

{{< hint type=note >}}
Additional fields that may be used to configure 2FA password length and expiry period can be found on the [KeePass website](https://geekdocs.de/usage/getting-started/). Usually the defaults are acceptable.
{{< /hint >}}
