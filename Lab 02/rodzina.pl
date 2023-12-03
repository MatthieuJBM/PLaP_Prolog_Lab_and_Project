rodzic(zofia, marcin).
rodzic(andrzej, marcin).
rodzic(andrzej, kasia).
rodzic(marcin, ania).
rodzic(marcin, krzys).
rodzic(krzys, mikolaj).
kobieta(zofia).
kobieta(kasia).
kobieta(ania).
meczyzna(andrzej).
meczyzna(marcin).
meczyzna(krzys).
meczyzna(mikolaj).
potomek(Y,X):-
	rodzic(X,Y).
matka(X,Y):-
	rodzic(X,Y),
	kobieta(X).
dziadkowie(X,Z):-
	rodzic(X,Y),
	rodzic(Y,Z).
siostra(X,Y):-
	rodzic(Z,X),
	rodzic(Z,Y),
	kobieta(X).

/* Poprzednik 3-go stopnia */
/*poprzednik(X,Z):-rodzic(X,Y1), rodzic(Y1,Y2), rodzic(Y2,Z).*/

poprzednik(X,Y):-rodzic(X,Y).

poprzednik(X,Z):-
	rodzic(X,Y),
	poprzednik(Y,Z).

/* Zadanie 1. */
	/* Podzadanie 1 */
szczesliwy(X):-rodzic(X,_).
dwoje_dzieci(X):-
	rodzic(X,Dziecko1),
	siostra(Dziecko1,Dziecko2),
	potomek(Dziecko2,X),
	Dziecko1 \= Dziecko2.
	/* Podzadanie 2 */
wnuk(X,Z):-
	rodzic(Z,Y),
	rodzic(Y,X).
	/* Podzadanie 3 */
ciotka(Ciotka,BrataLubSiostrySynLubCorka):-
	rodzic(Rodzic, BrataLubSiostrySynLubCorka),
	siostra(Ciotka, Rodzic).
	/* Podzadanie 4 */
nastepca(X,Y):-rodzic(Y,X).

nastepca(X,Z):-
	rodzic(Y,X),
	nastepca(Y,Z).