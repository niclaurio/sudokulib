# Prompt: setup iniziale del progetto

Agisci da ingegnere esperto di progetti Python. Predisponi un ambiente riproducibile, pronto allo sviluppo, rispettando `AGENTS.md`, contenuti esistenti e decisioni dell'utente. Applica i requisiti seguenti e verifica la checklist finale.

## 1. Contesto e decisioni

Esamina struttura, metadati, strumenti e stato Git; preserva il lavoro esistente. Raccogli solo i dati mancanti:

- nome del package e versione Python obiettivo, se non ricavabili dai requisiti;
- dipendenze applicative;
- necessità di test di integrazione e flussi/servizi da coprire;
- necessità di database per i test, motore e versione;
- titolare del copyright MIT, se non ricavabile dai metadati.

Raggruppa le domande; attendi le risposte per le scelte dipendenti e procedi con le attività indipendenti.

## 2. Git

Se manca un repository, esegui `git init` nella root. Crea un branch di setup secondo `project-guides/branch-name-best-practices.md` (es. `chore/initial-project-setup` in assenza di convenzioni adatte), verificando collisioni e preservando branch/modifiche esistenti. Commit e pubblicazione richiedono una richiesta esplicita.

## 3. Poetry e package

- Usa Poetry per ambiente, dipendenze ed esecuzione degli strumenti.
- Crea il package importabile `src/<nome_package>/`; configura package e versione Python concordati in `pyproject.toml`.
- Gruppo `dev`: `ruff`, `mypy`, `pytest`, `pytest-mock`, `pytest-cov`, `pre-commit`.
- Installa le dipendenze applicative concordate nelle versioni compatibili più recenti, verificando package index corrente e risoluzione Poetry. Descrivi i conflitti; evita aggiornamenti/rimozioni superflui e librerie senza necessità confermata.
- Abilita tutte le regole Ruff in `pyproject.toml`: `[tool.ruff.lint]`, `select = ["ALL"]`.

## 4. Pytest

Usa pytest per tutti i test. Crea `tests/unit/`, `tests/functional/` e, solo se concordata, `tests/integration/`, ciascuna con `conftest.py` vuoto. Configura la discovery per esecuzioni separate e complete.

## 5. Database di test

Solo con necessità confermata dall'utente, crea `docker/compose.test.yaml` con motore/versione concordati, connessione dedicata ai test e health check; vietati segreti e credenziali di produzione. Altrimenti ometti cartella, YAML e target dedicati.

Ogni comando che esegue test dipendenti dal database, inclusi aggregati e pre-commit, deve avviarlo con `db-up`, attenderne la disponibilità e arrestarlo con `db-down` anche in caso di errore.

## 6. Makefile

Crea nella root target documentati che invochino gli strumenti tramite Poetry:

| Target | Azione |
| --- | --- |
| `test-unit` | Esegue `tests/unit/` |
| `test-functional` | Esegue `tests/functional/` |
| `test-integration` | Esegue `tests/integration/`, se prevista |
| `test` | Esegue tutte le categorie configurate |
| `coverage` | Suite completa con `pytest-cov` e visualizzazione copertura |
| `mypy` | Controllo tipi del codice del progetto |
| `ruff` | `ruff check` su codice e test |
| `format` | `ruff format` |
| `format-check` | Controllo formato senza modifiche |
| `lint-all` | Ruff, MyPy e controllo formato |
| `pre-commit` | Controlli della sezione 7 |
| `db-up`, `db-down` | Gestione database della sezione 5, se previsto |
| `help` | Descrizione target |
| `clean` | Rimozione cache/artefatti generati, preservando sorgenti |

Aggiungi altri target (es. installazione, build, avvio) solo se supportati e utili.

## 7. Pre-commit

`make pre-commit` deve:

- ricavare i file staged dall'indice Git e applicare `lint-all` solo ai file pertinenti destinati al commit;
- eseguire i test pertinenti e richiedere coverage **> 95% per ciascun sorgente staged**, escludendo dal calcolo i file fuori dal commit; senza sorgenti staged, dichiarare il controllo non applicabile;
- gestire rinominazioni/cancellazioni senza controllare percorsi assenti dalla working tree;
- preservare modifiche non staged e segnalare eventuali correzioni da aggiungere allo stage.

Crea `.pre-commit-config.yaml` con hook locale equivalente:

```yaml
repos:
  - repo: local
    hooks:
      - id: project-pre-commit
        name: Project checks and coverage
        entry: make pre-commit
        language: system
        pass_filenames: false
        always_run: true
```

Mantieni selezione dall'indice e logica dei controlli nel Makefile, senza duplicarle nel YAML o passare nomi di file dall'hook. Installa con `poetry run pre-commit install`.

## 8. File di base

- **`LICENSE`:** [testo canonico MIT](https://choosealicense.com/licenses/mit/), clausole inalterate, anno e titolare verificati; eventuali spiegazioni nel README.
- **`README.md`:** lingua del progetto, altrimenti italiano; scopo, requisiti, installazione/configurazione, esempio disponibile, comandi Make, struttura, licenza e contribuzione se pertinente. Documenta solo comportamenti supportati.
- **`.gitignore`:** almeno `__pycache__/`, `.pytest_cache/`, `.mypy_cache/`, `.ruff_cache/`, `.coverage`, `htmlcov/`, `.venv/`, `dist/`, `build/`, `*.egg-info/`; aggiungi cache/temporanei pertinenti senza escludere sorgenti o configurazioni necessari.

## 9. Verifica finale

Esegui controlli di setup e target applicabili, registrando esiti reali. Se i test non bastano a misurare la coverage, dichiaralo senza considerare il controllo superato.

- [ ] Decisioni risolte; lavoro esistente preservato.
- [ ] Repository e branch predisposti.
- [ ] Package/dipendenze installati e coerenti con Poetry.
- [ ] Struttura pytest e componenti opzionali conformi agli accordi.
- [ ] Target Make e hook configurati e verificati secondo le sezioni dedicate.
- [ ] File di base completi e documentazione coerente.

Riepiloga quanto creato, verifiche, errori e decisioni ancora in attesa dell'utente.
