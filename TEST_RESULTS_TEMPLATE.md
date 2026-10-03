# CVDR Skill Test Report

**Datum:** [YYYY-MM-DD]  
**Tester:** [naam]  
**Skill versie:** [git hash: `git rev-parse HEAD`]  
**Testomgeving:** [macOS/Linux/Windows]

---

## Samenvatting

| Metriek | Aantal |
|---------|--------|
| **Totaal tests** | 40 |
| **PASS** | |
| **FAIL** | |
| **PARTIAL** | |
| **OVERGESLAGEN** | |
| **Slaagpercentage** | %|

---

## 1. ZOEKEN OP TITEL (basis)

### Test 1.1: Exacte titel
- **Input:** "Regeling organisatie 2016"
- **Verwacht:** CVDR391353, geldend versie, inhoud artikel 1-18
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - CVDR-nummer: ___________
  - Versie: ___________
  - URL werkend: [ ] Ja [ ] Nee
  - Geldendheid correct: [ ] Ja [ ] Nee
- **CVDR-verwijzing:** https://lokaleregelgeving.overheid.nl/

**Opmerkingen:**

---

### Test 1.2: Gedeeltelijke titel met wildcard
- **Input:** "Regeling organisatie*"
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Aantal resultaten: ___
  - Wildcard werkt: [ ] Ja [ ] Nee
  - Versies onderscheiden: [ ] Ja [ ] Nee

**Opmerkingen:**

---

### Test 1.3: Titel met aanhalingstekens (phrase search)
- **Input:** "Regeling financiën Rotterdam 2021"
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - CVDR-nummer: ___________
  - Quote-search werkt: [ ] Ja [ ] Nee
  - Geen valse matches: [ ] Ja [ ] Nee

**Opmerkingen:**

---

## 2. ZOEKEN OP TEKST / INHOUD

### Test 2.1: Zoeken op artikel-inhoud
- **Input:** "ambtelijk opdrachtgever"
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - CVDR's gevonden: ___________________________
  - Relevante artikelen: [ ] Ja [ ] Nee
  - Geen vervallen versies: [ ] Ja [ ] Nee

**Opmerkingen:**

---

### Test 2.2: Specifieke artikel-nummering
- **Input:** "artikel 15 mandaat"
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Correct artikel gevonden: [ ] Ja [ ] Nee
  - Juiste regel: ___________

**Opmerkingen:**

---

## 3. FILTEREN OP REGELINGSTYPE

### Test 3.1: Verordening filteren
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Alleen verordeningen: [ ] Ja [ ] Nee
  - Geen college-regelingen: [ ] Ja [ ] Nee
  - Type-filtering werkt: [ ] Ja [ ] Nee

**Opmerkingen:**

---

### Test 3.2: Beleidsregel filteren
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Alleen beleidsregels: [ ] Ja [ ] Nee

**Opmerkingen:**

---

## 4. DATUM/VERSIE HANDLING

### Test 4.1: Geldend op specifieke datum (point-in-time)
- **Input:** "Regeling organisatie" op "01-05-2024"
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Juiste versie voor datum: [ ] Ja [ ] Nee
  - Inwerking/uitwerking klopt: [ ] Ja [ ] Nee
  - Datum-filtering werkt: [ ] Ja [ ] Nee

**CVDR-verifiëring:** https://lokaleregelgeving.overheid.nl/CVDR391353/12

**Opmerkingen:**

---

### Test 4.2: Toekomstige versie
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Gemarkeerd "nog niet geldend": [ ] Ja [ ] Nee
  - Huidige versie aangeboden: [ ] Ja [ ] Nee

**Opmerkingen:**

---

### Test 4.3: Vervallen regel
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Gemarkeerd "vervallen/ingetrokken": [ ] Ja [ ] Nee
  - Verwijs naar huidge versie: [ ] Ja [ ] Nee

**Opmerkingen:**

---

## 5. ROTTERDAM-SPECIFIEK FILTEREN

### Test 5.1: Rotterdam-filter
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Alleen Rotterdam: [ ] Ja [ ] Nee
  - Geen andere gemeenten: [ ] Ja [ ] Nee
  - Filter werkt: [ ] Ja [ ] Nee

**Opmerkingen:**

---

### Test 5.2: Cross-check andere gemeente
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Scheiding duidelijk: [ ] Ja [ ] Nee

**Opmerkingen:**

---

## 6. OMGEVINGSWET SPECIFIEK

### Test 6.1: Omgevingswet-filter
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Filter werkt: [ ] Ja [ ] Nee
  - Relevante regelingen: ___________________________

**Opmerkingen:**

---

## 7. CITATIE & REFERENTIE

### Test 7.1: Correcte CVDR-citatie
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Officiële naam aanwezig: [ ] Ja [ ] Nee
  - CVDR met versie (bijv. CVDR391353/12): [ ] Ja [ ] Nee
  - URL correct: [ ] Ja [ ] Nee
  - Geldende periode: [ ] Ja [ ] Nee

**Voorbeeld citaat:**

```
[citaat hier]
```

**Opmerkingen:**

---

### Test 7.2: Artikel-anker in URL
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - URL met artikel-anker: [ ] Ja [ ] Nee
  - Anker correct (bijv. #artikel_5:1): [ ] Ja [ ] Nee

**URL voorbeeld:** ___________

**Opmerkingen:**

---

### Test 7.3: Toelichting apart citeren
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Toelichting apart gehaald: [ ] Ja [ ] Nee
  - Duidelijk gemarkeerd: [ ] Ja [ ] Nee

**Opmerkingen:**

---

## 8. MEERDERE MATCHES HANDLING

### Test 8.1: Financiën (meerdere regels)
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Verordening financiën gevonden: [ ] Ja [ ] Nee (CVDR: _______)
  - Regeling financiën gevonden: [ ] Ja [ ] Nee (CVDR: _______)
  - Onderscheid duidelijk: [ ] Ja [ ] Nee

**Opmerkingen:**

---

### Test 8.2: Titel vs citeertitel
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Huidge versie met huidge citeertitel: [ ] Ja [ ] Nee

**Opmerkingen:**

---

## 9. PAGINA / SORTERING

### Test 9.1: Sortering op datum
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Correct gesorteerd: [ ] Ja [ ] Nee

**Opmerkingen:**

---

### Test 9.2: Pagina's doorlopen
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Paginering werkt: [ ] Ja [ ] Nee

**Opmerkingen:**

---

## 10. EDGE CASES & VALIDATIE

### Test 10.1: Niet-bestaande regel
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - Geeft aan regel niet op CVDR: [ ] Ja [ ] Nee
  - Geen hallucinatie: [ ] Ja [ ] Nee

**Opmerkingen:**

---

### Test 10.2: Onduidelijke afkorting
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - MVRM herkend: [ ] Ja [ ] Nee
  - Juiste regel gevonden: [ ] Ja [ ] Nee

**Opmerkingen:**

---

### Test 10.3: Speciale karakters in zoeken
- **Status:** [ ] PASS [ ] FAIL [ ] PARTIAL
- **Bevindingen:**
  - & en / werken: [ ] Ja [ ] Nee
  - Geen crashes: [ ] Ja [ ] Nee

**Opmerkingen:**

---

## 11. ROTTERDAM VOORBEELDEN (live terugverifiëren)

| Regel | CVDR | Status | URL check | Opmerkingen |
|-------|------|--------|-----------|-------------|
| Regeling organisatie 2016 | CVDR391353 | [ ] | [ ] | |
| Verordening financiën Rotterdam 2021 | CVDR651733 | [ ] | [ ] | |
| Regeling financiën Rotterdam 2021 | CVDR652352 | [ ] | [ ] | |
| Treasurystatuut Rotterdam 2021 | CVDR652360 | [ ] | [ ] | |
| MVRM 2021 | CVDR664296 | [ ] | [ ] | |
| APV Rotterdam 2012 | CVDR373493 | [ ] | [ ] | |
| Omgevingsplan | CVDR696362 | [ ] | [ ] | |
| BOOO AD 2021 | CVDR664261 | [ ] | [ ] | |
| BOOO SO 2024 | CVDR709499 | [ ] | [ ] | |

---

## CONCLUSIES

### Wat werkt goed:
- 
- 
- 

### Wat moet beter:
- 
- 
- 

### Aanbevelingen:
- 
- 
- 

### Volgende stappen:
- [ ] Issues aanmaken voor gefaalde tests
- [ ] Patch voorbereiden voor bekende bugs
- [ ] Skill documentatie updaten

---

## Handtekening

**Tester:** ________________  
**Datum:** ________________  
**Goedgekeurd:** ________________
