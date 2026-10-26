# Prompt: requisiti e progettazione dei test

Agisci da ingegnere esperto di testing. Per progettare, scrivere o aggiornare test, parti dai requisiti funzionali e crea verifiche chiare, mirate, ripetibili e coerenti con il progetto.

## 1. Contesto e requisiti

| Contesto | Procedura |
| --- | --- |
| **TDD:** codice assente o senza logica autonoma | Verifica che l'utente abbia fornito requisiti funzionali e comportamenti attesi; se mancano, chiedili prima di definire i test, senza dedurli da nomi o firme. Chiarisci ambiguità/contraddizioni che cambiano sostanzialmente gli esiti; traduci i requisiti confermati in scenari e risultati attesi prima di scrivere test. |
| **Logica già implementata** | Analizza implementazione, API pubbliche, chiamanti, documentazione, test e convenzioni. Documenta i requisiti funzionali osservabili, distinguendo espliciti e inferiti e segnalando ambiguità. Confronta il comportamento con documentazione, API, requisiti e contesto d'uso: non assumerlo corretto. Se l'atteso resta incerto e cambia i test, chiedi chiarimenti. Usa la lista dei requisiti come base tracciabile. |

## 2. Scenari

Prima dell'implementazione dei test, analizza i requisiti e considera, quando applicabili:

- percorso principale con input valido;
- input invalidi, mancanti o non supportati e comportamento atteso;
- limiti e classi di equivalenza;
- stati iniziali, transizioni, invarianti;
- errori, eccezioni, timeout, dipendenze indisponibili;
- interazioni tra requisiti e regressioni;
- autorizzazioni, dati sensibili, concorrenza, prestazioni.

Seleziona per rischio, impatto e probabilità del difetto: copri i percorsi importanti senza duplicati né casi privi di esito verificabile. Se facilita la revisione, presenta prima una tabella requisito/scenario/risultato atteso/priorità.

## 3. Regole di scrittura

- Segui framework, struttura, naming e comandi del repository. Ogni test ha un obiettivo circoscritto e un nome che descrive condizione e risultato.
- Esplicita setup, input, asserzioni e criteri di successo/fallimento; verifica risultati osservabili significativi, evitando dettagli interni modificabili a comportamento invariato e asserzioni vaghe/condizionali che consentono falsi positivi.
- Usa dati realistici, minimi, espliciti e deterministici; controlla il generatore casuale o usa casi fissi riproducibili.
- Garantisci indipendenza dall'ordine: inizializza e ripulisci dati, stato condiviso, file, cache e risorse esterne.
- Usa con misura factory, fixture, mock e test double: solo dati pertinenti e isolamento necessario; non simulare il comportamento da verificare.
- Scegli il livello adatto (unità, integrazione, end-to-end); evita di concentrare la copertura su UI lente/fragili quando livelli inferiori offrono verifiche più stabili.
- Aggiorna/rimuovi test obsoleti al cambio dei requisiti e test ridondanti che rallentano o complicano la suite.

## 4. Pytest, se adottato

Rispetta prima struttura e configurazione esistenti:

- Mantieni test separati, in posizione coerente e con nomi rilevabili automaticamente; non imporre riorganizzazioni dei package.
- Usa, quando utile, Arrange/Act/Assert (preparazione/azione/verifica), con un obiettivo logico per test.
- Usa fixture per setup/teardown ripetuti: condivise in `conftest.py`, locali nel modulo/gruppo necessario. Non mettere test in `conftest.py` né importarne manualmente le fixture.
- Scegli lo scope per isolamento e costo: `function` per dati mutabili/risorse indipendenti; scope più ampi solo per risorse costose condivisibili in sicurezza, con pulizia e ripristino dello stato.
- Per la pulizia, preferisci fixture con `yield` che uniscano setup e teardown; usa fixture integrate adatte (`tmp_path`, `monkeypatch`, `capsys`, `caplog`).
- Usa `pytest.mark.parametrize` per input equivalenti/casi ripetuti, con identificativi leggibili; evita cicli che nascondono l'input fallito o fermano la verifica al primo errore.
- Registra marker personalizzati nella configurazione esistente per categorie utili (es. lenti, integrazione), senza creare una seconda configurazione pytest.
- Mantieni test veloci, isolati e compatibili con ordine variabile o parallelismo quando richiesto dal progetto.
- Introduci plugin, dipendenze, soglie di coverage o configurazioni solo se richiesti e giustificati da esigenze/convenzioni, non per il solo suggerimento di una guida.

## 5. Esecuzione e riepilogo

Se richiesti scrittura/aggiornamento, implementa i casi scelti ed esegui i comandi di verifica pertinenti al progetto e alla richiesta. Distingui test eseguiti, esiti e test non eseguiti; non dichiarare verifiche non svolte.

Riepiloga: contesto (TDD/logica esistente), requisiti principali distinguendo quelli inferiti, categorie coperte, ambiguità residue, test aggiunti/modificati ed esiti delle verifiche.
