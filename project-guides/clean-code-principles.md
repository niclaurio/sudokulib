# Principi di Clean Code

Per ogni scrittura o modifica di codice (funzionalità, correzioni, refactoring), applica queste regole per leggibilità e manutenibilità, adattandole a linguaggio, architettura, convenzioni e vincoli del progetto.

## Metodo

- Definisci obiettivo e risultato atteso da richiesta e repository, senza inventare requisiti; scegli modifiche mirate, coerenti con stile, architettura e dipendenze esistenti.
- Quando richiesto dall'attività, completa il flusso fino a un risultato verificabile: esamina i file, modifica e riepiloga.
- Se un'ambiguità cambia sostanzialmente la soluzione, chiedi un chiarimento conciso e prosegui con le verifiche indipendenti.
- Dichiara limiti, dipendenze mancanti e verifiche non eseguite. Non inserire segreti, credenziali o dati sensibili in output, file o messaggi di commit.

## Progettazione

| Principio | Applicazione |
| --- | --- |
| **DRY — Don't Repeat Yourself** | Una fonte autorevole per conoscenze realmente duplicate e destinate a divergere; evita astrazioni premature, generiche o fragili quando una piccola ripetizione è più chiara. |
| **KISS — Keep It Simple** | Soluzione più semplice che soddisfa i requisiti, senza livelli, configurazioni, dipendenze o casi speciali superflui. |
| **SoC — Separation of Concerns** | Separa responsabilità reali con scopi chiari per moduli e classi, senza frammentazione eccessiva. |
| **SOLID** | Quando pertinente: limita le ragioni di modifica, estendi senza modifiche fragili, preserva sostituibilità, limita le interfacce e dipendi da astrazioni appropriate. |

## Nomi e struttura

- Usa nomi descrittivi di intenzione e dominio, coerenti per lo stesso concetto e con linguaggio e progetto; evita abbreviazioni ambigue, sinonimi incoerenti e prefissi ridondanti. Preferisci verbi per funzioni e nomi adeguati al ruolo per variabili.
- Esplicita costanti significative al posto di numeri/stringhe oscuri. Scrivi codice diretto per chi conosce il progetto, senza sacrificare chiarezza a compattezza o idiomi insoliti.
- Mantieni funzioni focalizzate e comprensibili senza ricostruire molti livelli logici. Riduci argomenti numerosi o ambigui solo se chiarisce l'interfaccia; introduci configurazioni o astrazioni con beneficio concreto.
- Evita cambiamenti di comportamento poco trasparenti tramite flag booleani; separa i comportamenti solo se migliora la comprensione.
- Esplicita effetti collaterali e limita modifiche nascoste allo stato globale/condiviso. Delimita le responsabilità di classi e moduli; usa astrazione, composizione o ereditarietà per chiarire il design e ridurre l'accoppiamento.

## Tipi Python

- Annota ogni parametro e ritorno di funzioni/metodi scritti o modificati, inclusi i costruttori; usa `-> None` in assenza di valore restituito.
- Annota le variabili assegnate al risultato di funzioni/metodi con un tipo coerente con il ritorno.
- Per le altre variabili, locali e attributi di classe/istanza inclusi, annota solo tipi complessi o non evidenti (es. strutture annidate, unioni); lascia all'inferenza i valori semplici deducibili dall'assegnazione.
- Usa tipi precisi e fedeli al comportamento; non eludere la tipizzazione con `Any` o tipi generici.

## Commenti e formato

- Preferisci codice chiaro a commenti che lo parafrasano; commenta motivazioni, vincoli e decisioni non ovvi, mantenendoli aggiornati.
- Rimuovi codice commentato, debug temporaneo e commenti inutili.
- Segui formatter, linter, stile e convenzioni configurati; evita riformattazioni estranee alla richiesta. In Python applica PEP 8 e gli idiomi del progetto pertinenti.

## Docstring e API

Scrivi docstring concise **Google Style** per ogni nuova funzione, metodo e classe; aggiornale quando cambia il comportamento. Usa stringhe triple, PEP 257 e testo compatibile con il Markdown di Swagger UI.

| Elemento | Contenuto richiesto |
| --- | --- |
| Funzione/metodo | Riga riassuntiva breve e imperativa sullo scopo |
| `Args` | Ogni parametro: nome, tipo, eventuale default e descrizione di una riga; ometti se non ci sono parametri da documentare |
| `Returns` / `Yields` | Tipo e, se utile, descrizione di una riga; indica `None` senza valore restituito, usa `Yields` per generatori |
| `Raises` | Ogni eccezione del contratto: tipo e condizione in una riga; ometti se assenti |
| Classe | Riga riassuntiva dello scopo; `Attributes` con nome, tipo e descrizione di una riga per attributo, omessa se non ce ne sono da documentare |
| Funzione/metodo pubblico complesso | Aggiungi `Examples` concreto e coerente con l'API e **Passaggi logici** con le fasi funzionali principali, senza parafrasare singole istruzioni |
| Classe pubblica complessa | Aggiungi `Methods` con i metodi pubblici implementati e il loro scopo sintetico |

Separa riepilogo e sezioni con una riga vuota. Mantieni documentazione, tipi, default, risultati ed eccezioni coerenti con firme, implementazione e contratti; documenta effetti collaterali, vincoli e invarianti necessari al corretto uso dell'API.

Per endpoint FastAPI, mantieni descrizioni chiare e aggiornate per Swagger/OpenAPI: le docstring descrivono il comportamento; annotazioni e dichiarazioni FastAPI appropriate rappresentano parametri, risposte ed errori.

## Verifica del codice

Dopo ogni modifica al codice, esegui l'intera suite unitaria. Analizza i fallimenti e comunica la causa, distinguendo fatti e ipotesi. Se non puoi eseguire i test o determinarne la causa, dichiaralo e indica le verifiche ancora necessarie.

## Uso in code review

Valuta modifiche e convenzioni nel loro contesto. Segnala violazioni solo con impatto concreto su leggibilità, correttezza, accoppiamento, complessità o manutenibilità: fornisci un esempio specifico, il beneficio e una correzione proporzionata. Evita refactoring ampi o soggettivi non necessari alla qualità o allo scopo della modifica.
