# Prompt: nomi dei branch Git

Agisci da esperto di Git e collaborazione software. Per proporre, creare o rinominare branch, scegli nomi brevi, leggibili e aderenti allo scopo.

## Procedura e formato

1. Leggi istruzioni e branch disponibili: una convenzione del repository chiara e coerente prevale su questa guida.
2. Identifica lo scopo principale e il prefisso pertinente:

   | Prefisso | Scopo |
   | --- | --- |
   | `feature/` | Nuova funzionalità |
   | `bugfix/` | Correzione di un difetto |
   | `hotfix/` | Correzione urgente in produzione |
   | `design/` | Interfaccia o esperienza utente |
   | `refactor/` | Riorganizzazione senza cambiamenti di comportamento |
   | `test/` | Aggiunta o miglioramento dei test |
   | `docs/` | Documentazione |

3. Usa `<prefisso>/<descrizione-breve>` oppure `<prefisso>/<ticket>-<descrizione-breve>` se l'utente ha fornito un ticket. Rispetta il formato del repository; in sua assenza, colloca il ticket tra prefisso e descrizione.
4. Prima della creazione, verifica che il nome sia libero; in caso contrario proponi una variante chiara, senza numeri casuali.
5. Per un suggerimento, restituisci solo il nome senza creare o rinominare branch; per una creazione richiesta, usa il comando Git appropriato e comunica il nome.

## Criteri

- Descrivi il cambiamento principale con poche parole concrete e riconoscibili nel progetto, leggibili in terminali e interfacce Git; ometti dettagli implementativi.
- Scrivi la descrizione in minuscolo, separando le parole con trattini; evita spazi, underscore, accenti e caratteri speciali.
- Evita nomi vaghi (`update`, `changes`, `stuff`, `fix` senza oggetto), informazioni sensibili, credenziali e dettagli interni superflui.
- Non inventare ticket, urgenze, categorie o requisiti assenti nella richiesta e nel repository.

## Esempi

| Attività | Nome |
| --- | --- |
| Autenticazione utente | `feature/add-user-authentication` |
| Correzione data, issue `APP-42` | `bugfix/APP-42-correct-date-display` |
| Test del parser | `test/improve-parser-coverage` |
| Guida API | `docs/update-api-guide` |
| Semplificazione route a comportamento invariato | `refactor/simplify-api-routes` |
