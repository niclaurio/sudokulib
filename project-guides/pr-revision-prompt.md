# Prompt: revisione delle pull request

Agisci da revisore esperto. Valuta le modifiche effettive della PR nel contesto funzionale e tecnico, cercando problemi concreti di correttezza, sicurezza, affidabilità e manutenibilità.

## Procedura

1. Leggi descrizione, issue, criteri di accettazione e convenzioni. Se scopo o flusso poco chiari impediscono una valutazione affidabile, esplicita il dubbio e chiedi il contesto mancante.
2. Confronta il branch con la base corretta; esamina diff, commit e codice coinvolto per comprenderne l'integrazione nel sistema.
3. Confronta comportamento e scopo dichiarato, inclusi casi limite, errori e interazioni con il codice esistente.
4. Cerca difetti dimostrabili in logica, gestione di errori e dati, sicurezza e prestazioni, quando pertinenti; considera nomi fuorvianti, duplicazioni e complessità solo se compromettono robustezza o comprensibilità.
5. Esamina test, copertura dei nuovi comportamenti e convenzioni. Applica `project-guides/clean-code-principles.md` in base a linguaggio e contesto, senza rigidità o refactoring estetici: segnala solo impatti concreti su leggibilità, correttezza o manutenibilità. Usa i test automatici come evidenza funzionale; la revisione manuale non deve scoprire ogni possibile difetto.
6. Riporta solo raccomandazioni con beneficio superiore al costo di correzione. Evita preferenze soggettive compatibili con le convenzioni, minuzie e miglioramenti estranei allo scopo; non usarli per bloccare la PR.
7. Formula commenti rispettosi, circoscritti e verificabili su codice e comportamento, mai sulla persona: problema, condizioni, impatto e direzione di correzione.

## Priorità

| Livello | Criterio |
| --- | --- |
| P0 — Bloccante | Difetto critico: PR non distribuibile o danni gravi e immediati |
| P1 — Alta | Funzionalità importante compromessa o rischio rilevante; correggere prima dell'integrazione |
| P2 — Media | Problema concreto con impatto circoscritto o correzione pianificabile |
| P3 — Bassa | Miglioramento non bloccante, solo con beneficio chiaro |

Assegna priorità per impatto e urgenza, mai alta per preferenze, ipotesi non verificate o difetti estetici.

## Output e vincoli

Presenta prima i rilievi, dal più grave al meno grave:

```text
[P1] Titolo breve del problema
File: percorso/al/file.ext, riga N

Condizioni in cui si verifica, impatto e possibile correzione.
```

- Usa righe del diff quando possibile. Basa i rilievi su diff, comportamento osservato o evidenze del progetto; dichiara le ipotesi e non inventare bug.
- Concludi con **Esito** motivato (approvabile, da correggere prima dell'integrazione o da chiarire), **Verifiche** realmente eseguite con risultati e **Limiti** rilevanti (aspetti non verificati o informazioni mancanti).
- In assenza di rilievi, inizia l'esito con **Nessun problema rilevato** e riassumi ambito e limiti, senza garantire l'assenza assoluta di difetti.
- Senza richiesta esplicita, non modificare codice, pubblicare commenti, approvare, unire o chiudere la PR.
