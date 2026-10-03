# Test CVDR lokale regelgeving opzoeken — functionaaliteit

**Doel:** Alle functionaliteit van lokaleregelgeving.overheid.nl testen via de skill.

---

## 1. ZOEKEN OP TITEL (basis)

### Test 1.1: Exacte titel
**Input:** "Regeling organisatie 2016"
**Verwacht:** CVDR391353, geldend versie, inhoud artikel 1-18

**Wat testen:**
- Skill vindt de regel
- Correct CVDR-nummer en versie
- Geldende versie (niet vervallen)
- URL klopt

---

### Test 1.2: Gedeeltelijke titel met wildcard
**Input:** "Regeling organisatie*"
**Verwacht:** Alle versies van de Organisatieregeling, gesorteerd

**Wat testen:**
- Wildcard-zoeken werkt
- Meerdere resultaten correct gefilterd
- Versies onderscheiden

---

### Test 1.3: Titel met aanhalingstekens (phrase search)
**Input:** "Regeling financiën Rotterdam 2021"
**Verwacht:** CVDR652352, exacte match

**Wat testen:**
- Quote-zoeken werkt
- Geen valse matches ("financiën" zonder "Rotterdam")

---

## 2. ZOEKEN OP TEKST / INHOUD

### Test 2.1: Zoeken op artikel-inhoud
**Input:** "ambtelijk opdrachtgever"
**Verwacht:** Minstens MVRM, BOOO, bevoegdhedenbesluiten

**Wat testen:**
- Tekstzoeken vindt regels waar deze term voorkomt
- Skill citeert relevante artikelen
- Geen vervallenversies in resultaten

---

### Test 2.2: Specifieke artikel-nummering
**Input:** "artikel 15 mandaat"
**Verwacht:** Regeling organisatie 2016, artikel 15

**Wat testen:**
- Skill kan op artikelnummering zoeken
- Juiste artikel uit de juiste regel

---

## 3. FILTEREN OP REGELINGSTYPE

### Test 3.1: Verordening filteren
**Input:** "organisatie verordening" + filter type
**Verwacht:** Alleen verordeningen, geen college-regelingen

**Wat testen:**
- Type-filtering werkt
- Juiste onderscheid verordening vs regeling vs beleidsregel

---

### Test 3.2: Beleidsregel filteren
**Input:** Filter op "beleidsregel"
**Verwacht:** Alleen beleidsregels

---

## 4. DATUM/VERSIE HANDLING

### Test 4.1: Geldend op specifieke datum (point-in-time)
**Input:** "Regeling organisatie" op "01-05-2024"
**Verwacht:** Juiste versie die op die datum geldend was

**Wat testen:**
- Skill kan point-in-time opvragen
- Juiste versie van de regel voor die datum
- Correct "inwerking" / "uitwerking" moment

---

### Test 4.2: Toekomstige versie (nog niet geldend)
**Input:** Zoeken naar regel met "Geldend vanaf ..." notitie
**Verwacht:** Skill geeft aan dat tekst nog niet geldend is

**Wat testen:**
- Skill markeert toekomstige teksten duidelijk
- Geeft huidige geldende versie als alternatief

---

### Test 4.3: Vervallen regel
**Input:** Oude versie van regel die ingetrokken is
**Verwacht:** Skill geeft aan dat regel vervallen is

**Wat testen:**
- Skill markeert vervallen regels
- Verwijst naar huidige geldende versie

---

## 5. ROTTERDAM-SPECIFIEK FILTEREN

### Test 5.1: Rotterdam-filter
**Input:** Regelingen voor "Rotterdam"
**Verwacht:** Alleen Rotterdam-regelingen, geen andere gemeenten

**Wat testen:**
- Filter "gemeenten=Rotterdam" werkt
- Geen Metropoolregio/Veiligheidsregio/overige gemeenten

---

### Test 5.2: Cross-check andere gemeente
**Input:** Zoeken naar Rotterdam-regel, maar ook Utrecht
**Verwacht:** Duidelijke scheiding per gemeente

---

## 6. OMGEVINGSWET SPECIFIEK

### Test 6.1: Omgevingswet-filter
**Input:** Filter op "omgevingswet=ja"
**Verwacht:** Regelingen onder de Omgevingswet (Omgevingsplan, etc.)

---

## 7. CITATIE & REFERENTIE

### Test 7.1: Correcte CVDR-citatie
**Input:** Citeer artikel uit regel
**Verwacht:** Volledig in het juiste format:
- Officiële naam / citeertitel
- CVDR-kenmerk **met versie** (bijv. CVDR391353/12)
- URL met versie
- Artikelverwijzing + geldende periode

---

### Test 7.2: Artikel-anker in URL
**Input:** "artikel 5 Regeling organisatie"
**Verwacht:** URL bevat artikel-anker (bijv. `#artikel_5:1`)

---

### Test 7.3: Toelichting apart citeren
**Input:** Toelichting citaat nodig
**Verwacht:** Skill haalt toelichting apart en markeert duidelijk

---

## 8. MEERDERE MATCHES HANDLING

### Test 8.1: Financiën (meerdere regels)
**Input:** "financiën" zonder verdere specificatie
**Verwacht:** 
- Verordening financiën Rotterdam 2021 (CVDR651733)
- Regeling financiën Rotterdam 2021 (CVDR652352)
- Skill geeft beide, met onderscheid verordening/regeling

---

### Test 8.2: Titel vs citeertitel
**Input:** Regel zoeken op oude titel die nu anders heet
**Verwacht:** Skill vindt huidige geldende versie met huidige citeertitel

---

## 9. PAGINA / SORTERING

### Test 9.1: Sortering op datum
**Input:** Zoeken met sort op datum (nieuwste eerst)
**Verwacht:** Resultaten in juiste chronologische volgorde

---

### Test 9.2: Pagina's doorlopen
**Input:** Zoeken die >10 resultaten geeft
**Verwacht:** Skill kan naar volgende pagina gaan

---

## 10. EDGE CASES & VALIDATIE

### Test 10.1: Niet-bestaande regel
**Input:** "Regeling Martijnscorrectie 2099"
**Verwacht:** Skill geeft aan dat regel niet op CVDR staat

---

### Test 10.2: Onduidelijke afkorting
**Input:** "MVRM" (Mandaat, Volmacht, Machtiging Rotterdam)
**Verwacht:** Skill herkent afkorting en zoekt op volledige naam

---

### Test 10.3: Speciale karakters in zoeken
**Input:** Regel met "&" of "/" in titel
**Verwacht:** Zoeken werkt correct

---

## 11. ROTTERDAM VOORBEELDEN (terugverifiëren op live CVDR)

Voor elk van deze: **terugverifiëren op lokaleregelgeving.overheid.nl**

- [ ] Regeling organisatie 2016 — CVDR391353 (laatste `/n`)
- [ ] Verordening financiën Rotterdam 2021 — CVDR651733
- [ ] Regeling financiën Rotterdam 2021 — CVDR652352
- [ ] Treasurystatuut Rotterdam 2021 — CVDR652360
- [ ] Besluit mandaat, volmacht en machtiging Rotterdam 2021 — CVDR664296
- [ ] APV Rotterdam 2012 — CVDR373493
- [ ] Omgevingsplan gemeente Rotterdam — CVDR696362
- [ ] BOOO Algemeen Directeur 2021 — CVDR664261
- [ ] BOOO Stadsontwikkeling 2024 — CVDR709499

---

## 12. VERIFICATIE CHECKLIST

Voor elke test:

- [ ] Skill voerde zoekopdracht uit
- [ ] Correct aantal resultaten
- [ ] CVDR-nummer correct en versieerd
- [ ] Geldendheid correct (niet vervallen)
- [ ] URL valide (test met curl/browser)
- [ ] Inhoud/citaat juist
- [ ] Geen hallucinatie (alles op CVDR zelf verifiëren)
- [ ] Geen toekomstige teksten als geldend gepresenteerd
- [ ] Geen landelijke wetten vermengd zonder label

---

## BRONNEN

- Skill bron: `cvdr-lokale-regelgeving-opzoeken/SKILL.md`
- CVDR live: https://lokaleregelgeving.overheid.nl/
- CVDR extended search: https://lokaleregelgeving.overheid.nl/ZoekUitgebreid
- SRU endpoint: https://zoekservice.overheid.nl/sru/Search?x-connection=cvdr
- Rotterdam zoekopdracht: https://lokaleregelgeving.overheid.nl/ZoekResultaat?gemeenten=Rotterdam
