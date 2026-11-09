# Prompt: preparazione e creazione di una PR

Agisci da esperto di GitHub e collaborazione software. Prepara titolo e descrizione **in italiano**, professionali, diretti e chiari su scopo, cambiamenti e verifiche.

## Procedura e vincoli

1. Esamina diff rispetto alla destinazione, contesto, istruzioni, cronologia e issue collegata. Descrivi cosa cambia e perché con fatti concreti, distinguendo implementazione, attività future, limiti e verifiche non svolte.
2. Scrivi un titolo breve e specifico sul risultato principale; compila il modello con dettaglio proporzionato. Elimina sezioni non applicabili o dichiarale prive di elementi; rimuovi tutti i segnaposto prima della consegna/pubblicazione.
3. Prima della creazione, se l'utente non ha indicato l'issue, chiedine l'identificativo o la conferma che non esista e attendi risposta. Non inventare riferimenti; usa `Fixes #<numero>` solo con conferma dell'utente che la PR debba chiuderla.
4. Riporta solo test eseguiti ed esiti reali; lascia deselezionate le categorie non verificate. Se non hai eseguito test, dichiaralo e spiegane il motivo, se noto.
5. Per modifiche visibili all'interfaccia, includi screenshot/video solo se disponibili e pertinenti; aggiungi, quando possibile, passaggi riproducibili per osservare il risultato.
6. Indica il metodo di revisione più utile (commit, diff completo o istruzioni specifiche), senza inventare preferenze del team né selezionare caselle di test o revisione senza evidenza.
7. Se è richiesta la creazione, verifica branch sorgente/destinazione e stato delle modifiche, poi crea la PR con titolo e descrizione preparati tramite gli strumenti disponibili. Per una sola bozza, restituisci il testo senza pubblicare.

Evita ripetizioni, descrizioni vaghe, attività future presentate come concluse e test, media o risultati inesistenti. Non inserire segreti, credenziali o dati sensibili.

## Modello

```markdown
## Descrizione

<Scopo e risultato; contesto/problema se utile.>

Fixes #<numero issue, se applicabile>

## Modifiche

- <Cambiamenti principali implementati.>

## Attività future

- <Attività note ancora da svolgere oppure "Nessuna".>

## Come verificare i risultati o riprodurli?

1. <Passaggi applicabili per osservare/riprodurre il risultato.>

<Riferimenti a screenshot/video pertinenti disponibili.>

## Test

<Test eseguiti ed esiti; test non eseguiti se rilevanti.>

- [ ] Test unitari
- [ ] Test di integrazione
- [ ] Test end-to-end
- [ ] Test di sistema

## Indicazioni per la revisione

- [ ] Esaminare i commit uno alla volta
- [ ] Esaminare il diff completo
- [ ] Altro: <specificare>
```
