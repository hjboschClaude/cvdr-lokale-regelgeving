# CVDR Skill — Testing Guide

Dit document legt uit hoe je de CVDR-skill test-suite gebruikt.

---

## 📋 Bestanden

| Bestand | Doel |
|---------|------|
| **test_cvdr_functionality.md** | Volledige test-cases (40 tests in 12 categorieën) met protocol en succescriteria |
| **TEST_RESULTS_TEMPLATE.md** | Invulform voor test-resultaten |
| **run_tests.sh** | Automatische test-runner (snel voorkomen) |

---

## 🚀 Quick Start

### Optie 1: Automatisch testen (3 minuten)

```bash
./run_tests.sh
```

Dit test de meest kritische functionaliteit tegen live CVDR en geeft een rapport.

**Output:** `test_results/test_results_YYYY-MM-DD_HH-MM-SS.txt`

---

### Optie 2: Handmatig testen (30+ minuten)

Voor grondige verificatie met live CVDR verifiëring.

**Stap 1: Voorbereiding**
```bash
# Zorg dat je twee browser-tabs open hebt:
# - CVDR live: https://lokaleregelgeving.overheid.nl/
# - Dit document: test_cvdr_functionality.md
```

**Stap 2: Per test-case**
1. Open `test_cvdr_functionality.md`
2. Lees "Input" en "Verwacht" bij test X.X
3. Zend Input naar Claude met skill
4. Vergelijk skill-antwoord met live CVDR (copypaste de Input in CVDR's zoekveld)
5. Noteer status (✓ PASS / ✗ FAIL / ⚠ PARTIAL) in `TEST_RESULTS_TEMPLATE.md`

**Stap 3: Rapportage**
```bash
# Copy template, vul in
cp TEST_RESULTS_TEMPLATE.md test_results/test_results_$(date +%Y-%m-%d).md

# Vul alle velden in, zet aantallen in Samenvatting
```

---

## ✅ Succescriteria quick reference

### Zoeken (Tests 1-2)
- [ ] CVDR-nummer klopt
- [ ] Versie meegegeven (`/n`)
- [ ] URL werkt: https://lokaleregelgeving.overheid.nl/CVDR{id}/{n}
- [ ] Citaat letterlijk van CVDR

### Filters (Tests 3-6)
- [ ] Juiste resultaten gefilterd
- [ ] Geen ongewenste matches
- [ ] Skill geeft aan wat gefilterd werd

### Datum/versies (Test 4)
- [ ] Point-in-time: juiste versie voor die datum
- [ ] Toekomstige teksten: gemarkeerd "nog niet geldend"
- [ ] Vervallen: gemarkeerd + verwijs naar huidge versie

### Citatie (Test 7)
```
✓ Officiële naam
✓ CVDR-nummer MET versie (bijv. CVDR391353/12)
✓ URL: https://lokaleregelgeving.overheid.nl/CVDR391353/12
✓ Artikel + geldende periode
✓ URL artikel-anker waar relevant (#artikel_1:1)
```

### Edge cases (Test 10)
- [ ] Niet-bestaande regel: "niet op CVDR"
- [ ] Afkorting (MVRM): skill herkent
- [ ] Speciale karakters (&, /): geen crash

---

## 📊 Test-rapportage

### Minimaal rapport:
```markdown
# CVDR Test — [datum]

| Metriek | Aantal |
|---------|--------|
| PASS | X |
| FAIL | Y |
| Slaagpercentage | Z% |

## Gefaalde tests
- Test 1.3: Phrase search niet werkend
- Test 4.1: Datum-filter geeft verkeerde versie

## Conclusie
Skill werkt voor [X]% van functies. Kritieke bugs: [...]
```

### Volledig rapport:
- Gebruik `TEST_RESULTS_TEMPLATE.md`
- Vul per test: status + bevindingen + CVDR-verwijzing
- Samenvatting met slaagpercentage
- Conclusies en aanbevelingen

---

## 🔍 Hoe bepaal je of een test PASS/FAIL/PARTIAL is?

### PASS ✓
- Skill-antwoord matcht verwachting
- Live CVDR bevestigt hetzelfde
- Geen hallucinaties (alles controleerbaar op CVDR)
- Citatie correct en compleet

### FAIL ✗
- Skill vindt regel niet / verkeerd
- CVDR-nummer fout
- Vervallen versie als geldend gepresenteerd
- URL werkt niet (404)
- Tekst niet letterlijk van CVDR

### PARTIAL ⚠️
- Gedeeltelijk correct (bijv. regel gevonden, maar versie ontbreekt)
- Minor issue (bijv. geen geldende periode gegeven)
- Kan verbeterd, maar niet kritiek

---

## 🛠️ Workflow: Van FAIL naar FIX

```
1. Test FAIL
   ↓
2. Noteer: wat verwacht, wat gekregen
   ↓
3. Verify op live CVDR zelf
   ↓
4. Open GitHub issue:
   - Titel: "Test X.X: [probleem]"
   - Beschrijving: Input, verwacht, werkelijk, CVDR-link
   ↓
5. Fix in skill (ai-skills repo)
   ↓
6. Rerun test → PASS
   ↓
7. Commit rapport met status: ✓ FIXED
```

---

## 📍 Rotterdam voorbeelden (altijd verifiëren)

Deze CVDR's gebruiken we veel. Check altijd of ze nog kloppen:

```bash
# Alle in één check:
for cvdr in CVDR391353 CVDR652352 CVDR664296 CVDR696362 CVDR709499; do
  echo "Testing $cvdr..."
  curl -s "https://lokaleregelgeving.overheid.nl/$cvdr" | grep -q "geldend" && echo "✓" || echo "✗"
done
```

| Regel | CVDR | Geldend |
|-------|------|---------|
| Regeling organisatie 2016 | CVDR391353 | 2026-05-28 t/m heden |
| Regeling financiën Rotterdam 2021 | CVDR652352 | 2021-01-01 t/m heden |
| MVRM 2021 | CVDR664296 | 2026-07-01 t/m heden |
| BOOO Stadsontwikkeling 2024 | CVDR709499 | 2026-06-04 t/m heden |
| Omgevingsplan | CVDR696362 | [check live] |

---

## 🎯 Goals per test-level

### Green (Alle tests PASS)
Skill is production-ready. Geen known issues.

### Yellow (>80% PASS)
Skill is bruikbaar. Bekende minor issues.

### Red (<80% PASS)
Skill heeft kritieke bugs. Niet voor productie.

---

## 📝 Checklist: Ben je klaar om te testen?

- [ ] CVDR-website bereikbaar (`curl https://lokaleregelgeving.overheid.nl`)
- [ ] Skill actief in Claude Code
- [ ] Git versie bekend (`git rev-parse HEAD`)
- [ ] Twee browser-tabs klaar (CVDR + rapport)
- [ ] run_tests.sh executable (`chmod +x run_tests.sh`)
- [ ] Rapport-template klaar

---

## ❓ Veel gestelde vragen

**V: Hoe lang duurt testen?**
A: Automatisch: 3 min. Handmatig (grondig): 30-45 min.

**V: Moet ik alle 40 tests uitvoeren?**
A: Voor release: ja. Voor quick-check: alleen test 1.1, 2.1, 4.1, 7.1, 11.

**V: CVDR-nummers wijzigen soms. Wat dan?**
A: Update je rapport en mark als "CVDR niet veranderd, versie wel" → PASS met opmerking.

**V: Mijn test faalt maar ik zie het op CVDR?**
A: Dat is een skill-bug. File GitHub issue met link naar CVDR.

**V: Kan ik testen met mijn eigen gemeente?**
A: Ja. Wijzig `gemeenten=Rotterdam` in `gemeenten=[JouwGemeente]`.

---

## 📞 Support

- **Bugs/issues:** https://github.com/hjboschClaude/ai-skills/issues (active repo)
- **Vragen:** Zet op als GitHub Discussion
- **Deze snapshot:** Read-only. Contributie → ai-skills repo.

---

**Laatst bijgewerkt:** 2026-10-03  
**Skill bron:** https://github.com/hjboschClaude/ai-skills/tree/main/skills/cvdr-lokale-regelgeving-opzoeken
