---
name: cvdr-lokale-regelgeving-opzoeken
description: >-
  use this when looking up or citing Dutch municipal regulations from
  lokaleregelgeving.overheid.nl (CVDR)
---

# CVDR lokale regelgeving opzoeken

Use this when looking up, quoting, or comparing Dutch municipal regulations published on [lokaleregelgeving.overheid.nl](https://lokaleregelgeving.overheid.nl/) (CVDR). Default organisation: gemeente Rotterdam unless the user names another overheid.

## Source rule

- Primary source: https://lokaleregelgeving.overheid.nl/
- Cite only text that is actually on that page. Never invent articles, dates, titles, or CVDR versions.
- Officielebekendmakingen.nl / Gemeenteblad is the bekendmaking, not the consolidated geldende tekst.

## Rotterdam collection

No organisation landing page (`/organisatie/Rotterdam` 404s). CBS code `0599` / `gm0599` is **not** a CVDR filter.

Working HTML search (geldend + future texts):
`https://lokaleregelgeving.overheid.nl/ZoekResultaat?gemeenten=Rotterdam`

Extended form: https://lokaleregelgeving.overheid.nl/ZoekUitgebreid

Filter value is the exact name `Rotterdam`. Do not use postcode (`locatie=3011` mixes provincie/waterschap/GR). Do not mix Metropoolregio, Veiligheidsregio, Stadsregio.
