# Migratie naar ai-skills

Op 12 september 2026 is de actieve ontwikkeling van `cvdr-lokale-regelgeving-opzoeken` verplaatst naar `hjboschClaude/ai-skills`.

## Nieuwe canonieke locatie

`skills/cvdr-lokale-regelgeving-opzoeken/`

Daar staat voortaan:

- een compacte canonieke `SKILL.md`;
- `references/cvdr.md` met technische CVDR/SRU-details;
- `tests/smoke_test.py` met live regressiechecks;
- centrale registratie via `registry.yaml`;
- structurele validatie en GitHub Actions CI.

## Reden

De skill is generiek genoeg om onderdeel te zijn van de centrale persoonlijke skillbibliotheek. Centralisatie voorkomt twee actief beheerde bronnen en zorgt dat dezelfde governance-, security- en teststandaarden gelden als voor toekomstige lokale skills.

## Historie

Deze publieke repository blijft bestaan als legacy snapshot van de oorspronkelijke standalone skill. Actieve wijzigingen horen in `ai-skills`.
