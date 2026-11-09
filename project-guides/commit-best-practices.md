# Prompt: preparazione e messaggi dei commit Git

Agisci da esperto di Git e collaborazione software. Prepara o crea commit con messaggi concisi, accurati e utili alla lettura futura della cronologia.

## Procedura

1. Esamina istruzioni, commit recenti e convenzioni: mantieni il formato del repository se chiaro e coerente.
2. Leggi il diff effettivo, distinguendo modifiche staged e non staged; ricava lo scopo principale senza basarti soltanto sulla descrizione dell'attività.
3. Scegli tipo, subject e, solo se identifica meglio un'area riconoscibile, scope. Aggiungi body per motivazione, comportamento precedente, decisioni o impatto; footer per ticket forniti e incompatibilità.
4. Se è richiesta la creazione, includi soltanto le modifiche pertinenti a quel commit.

## Formato e tipi

Salvo convenzioni documentate diverse, usa Conventional Commits:

```text
<type>(<scope opzionale>)!?: <descrizione>

<body opzionale>

<footer opzionale>
```

`!` è facoltativo e segnala incompatibilità (es. `feat(api)!: remove legacy endpoint`); descrivine l'impatto nel footer `BREAKING CHANGE: <descrizione>`.

| Tipo | Cambiamento |
| --- | --- |
| `feat` | Funzionalità visibile o API, nuova o modificata |
| `fix` | Correzione di un difetto |
| `refactor` | Ristrutturazione a comportamento osservabile invariato |
| `perf` | Prestazioni |
| `test` | Aggiunta o correzione di test |
| `docs` | Documentazione |
| `style` | Formattazione senza modifiche logiche |
| `build` | Dipendenze o strumenti di build |
| `ci` | Configurazione o pipeline di integrazione continua |
| `ops` | Infrastruttura o operazioni |
| `chore` | Manutenzione non coperta dagli altri tipi |
| `revert` | Annullamento di un commit |

## Criteri

- Un solo scopo principale per commit, espresso con parole concrete. Subject imperativo, al presente, minuscolo dopo `:`, senza punto finale; circa 50 caratteri, oltre 72 solo con una ragione valida.
- Separa subject e body con una riga vuota; nel body spiega soprattutto perché e quale comportamento cambia, senza ripetere il subject.
- Mantieni commit focalizzati, possibilmente autonomi e verificabili. Per modifiche ampie, crea un numero adeguato di piccoli passaggi coerenti, ordinati per dipendenza: ciascuno deve rendere chiaro il progresso rispetto al precedente e agevolare la revisione.
- Evita commit omnibus, frammentazione artificiale e messaggi vaghi (`update`, `changes`, `fix stuff`).
- Non inventare cause, ticket, risultati, test eseguiti o impatti non dimostrati.
- Non modificare commit condivisi né usare `--amend`, rebase o altre riscritture della cronologia pubblicata senza richiesta esplicita.

## Esempi

```text
feat(auth): add password reset flow

Send a time-limited reset link so users can regain access without
contacting support.
```

```text
fix(sudoku): reject duplicate values in a row
```

```text
feat(api)!: remove legacy puzzle endpoint

BREAKING CHANGE: clients must use the versioned puzzles endpoint.
```
