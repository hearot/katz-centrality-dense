# 💻 Implementazione di due algoritmi per il calcolo della centralità di Katz in grafi molto densi

Questo repository contiene i codici e la relazione di un progetto portato a termine per il corso
di "Laboratorio computazionale" presso l'Università di Pisa. In questo progetto sono stati implementati e
sperimentati gli algoritmi e la teoria
proposti da [^1] per calcolare in modo efficiente e accurato il vettore di Katz in grafi 
molto densi, sfruttando il concetto di grafo complementare (con eventualmente lacci).

GNU Octave **non** implementa ancora il metodo *minres*, recuperabile invece tramite [*patch #9282:* add minres for sparse linear systems](https://savannah.gnu.org/patch/index.php?func=detailitem&item_id=9282).

[^1]: Vanni Noferini, Ryan Wood, *Efficient computation of Katz centrality for very dense networks via negative parameter Katz*, Journal of Complex Networks, Volume 12, Issue 5, October 2024, cnae036, https://doi.org/10.1093/comnet/cnae036.