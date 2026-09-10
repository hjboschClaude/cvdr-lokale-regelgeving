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
- Never present a vervallen/ingetrokken version as geldend. Future-only texts (“Geldend vanaf …”) are not yet in force.

## Rotterdam collection

There is no organisation landing page (`/organisatie/Rotterdam` 404s). CBS code `0599` / `gm0599` is **not** a CVDR filter.

Working HTML search (geldend + future texts):

`https://lokaleregelgeving.overheid.nl/ZoekResultaat?gemeenten=Rotterdam`

Extended form: https://lokaleregelgeving.overheid.nl/ZoekUitgebreid

Filter value is the exact name `Rotterdam`. Do not use postcode (`locatie=3011` mixes provincie/waterschap/GR). Do not mix Metropoolregio, Veiligheidsregio, or Stadsregio into a gemeente-Rotterdam answer.

## HTML search params (GET `/ZoekResultaat`, AND)

- `gemeenten=Rotterdam`
- `titel` — official name or citeertitel; supports `*` `?` and `"quoted phrase"`
- `tekst`, `wti`
- `datumrange=op` + `datumop=dd-m-yyyy` for point-in-time; omit for “today” (includes future texts labelled “Dit is een toekomstige tekst”)
- `indeling=beleidsregel` or `verordening overig` (no `type=` param)
- `omgevingswet=ja`
- `page`, `count` (10/20/50/100/200), `sort=date-asc|title-asc`

## SRU (machine-readable)

```
https://zoekservice.overheid.nl/sru/Search?x-connection=cvdr&operation=searchRetrieve&version=1.2&startRecord=1&maximumRecords=10&query=gemeente=%22Rotterdam%22
```

Useful CQL: `gemeente`, `dcterms.creator`, `dcterms.title`, `dcterms.identifier`, `workid`.

Do **not** AND `overheidrg.datumGeldendOp` with `gemeente` if you want website parity.

XML body pattern:

`https://repository.officiele-overheidspublicaties.nl/cvdr/CVDR{id}/{n}/xml/CVDR{id}_{n}.xml`

## Lookup steps

1. Scope to `gemeenten=Rotterdam` or SRU `gemeente="Rotterdam"`.
2. Search `titel` with distinctive words. A quoted citeertitel can still return all versions — pick the currently geldende `/n` (empty uitwerkingtreding / “t/m heden”).
3. Confirm creator Rotterdam, geldend-label, and WTI. For a past date: `datumrange=op` or the version whose inwerking ≤ date < uitwerking.
4. If several titles match (e.g. “financiën” → verordening én college-regeling): list candidates briefly and lead with the one that matches the ask (raad-verordening vs college-regeling).
5. Quote **regelingstekst**, not toelichting, unless the user asked for toelichting (label it).
6. If missing on CVDR, say so — do not fill gaps from memory or other sites.

## Citation (always)

- Officiële naam / citeertitel
- CVDR-kenmerk **with version**, e.g. `CVDR391353/12`
- URL `https://lokaleregelgeving.overheid.nl/CVDR391353/12` (article anchor when useful, e.g. `#hoofdstuk_1._artikel_1:1`)
- Artikel + geldendheidsperiode from the page (and terugwerkende kracht if shown)

## Do not

- Treat an ingetrokken/vervallen or old `/n` as geldend
- Treat future-only texts as already in force
- Mix landelijke wet into a local-regeling answer without labelling it as context
- Use officielebekendmakingen as the primary consolidated source
- Rewrite dicta or give mandaat/bevoegdheidsoordelen in this skill (that is other specialist work)

## Example Rotterdam works (re-check live; dates freeze at last check)

Re-verify on CVDR before citing as current:

- Regeling organisatie 2016 — CVDR391353 (check latest `/n`)
- Verordening financiën Rotterdam 2021 — CVDR651733
- Regeling financiën Rotterdam 2021 — CVDR652352
- Treasurystatuut Rotterdam 2021 — CVDR652360
- APV Rotterdam 2012 — CVDR373493
- Omgevingsplan gemeente Rotterdam — CVDR696362
