rodzic(kasia,robert).
rodzic(tomek,robert).
rodzic(tomek,ania).
rodzic(robert,gosia).
rodzic(robert,basia).
rodzic(basia,janek).

kobieta(kasia).
kobieta(ania).
kobieta(basia).
kobieta(gosia).

mezczyzna(tomek).
mezczyzna(robert).
mezczyzna(janek).

dziecko(X,Y) :-
	rodzic(Y,X).

matka(X,Y) :-
	rodzic(X,Y),
	kobieta(X).

ojciec(X,Y) :-
	rodzic(X,Y),
	mezczyzna(X).

dziadkowie(X,Y) :-
	rodzic(X,Z),
	rodzic(Z,Y).

dziadek(X,Y) :-
	dziadkowie(X,Y),
	mezczyzna(X).

babcia(X,Y) :-
	dziadkowie(X,Y),
	kobieta(X).

siostra(X,Y) :-
	rodzic(Z,X),
	rodzic(Z,Y),
	kobieta(X),
	X \= Y.

brat(X,Y) :-
	rodzic(Z,X),
	rodzic(Z,Y),
	mezczyzna(X),
	X \= Y.

przodek(X,Y) :-
	rodzic(X,Y).

przodek(X,Z) :-
	rodzic(X,Y),
	przodek(Y,Z).

potomek(X,Y) :-
	rodzic(Y,X).

potomek(Z,X) :-
	rodzic(Y,Z),
	potomek(Y,X).

%%
ma_dziecko(X) :-
	rodzic(X,_).

%% ex 1.3
szczesliwy(X) :-
	ma_dziecko(X).

ma_dwoje_dzieci(X) :-
	rodzic(X,Y),
	siostra(_,Y).

ma_dwoje_dzieci(X) :-
	rodzic(X,Y),
	brat(_,Y).

%% ex 1.4
wnuk(X,Z) :-
	rodzic(Y,X),
	rodzic(Z,Y).

%% ex 1.5
ciocia(X,Y) :-
	rodzic(Z,Y),
	siostra(X,Z).

/* Cwiczenie 1. */
/*
?- X=[a,b,c].
X = [a, b, c].

?- [X|Y]=[a,b,c].
X = a,
Y = [b, c].

?- [[a,b],c]=[X,Y].
X = [a, b],
Y = c.

?- [a(b),c(X)]=[Z,c(a)].
X = a,
Z = a(b).

?- [X|Y]=[a].
X = a,
Y = [].
*/

porownaj(Lista) :-
    nth1(3, Lista, Element3),
    nth1(4, Lista, Element4),
    Element3 = Element4.

zamien(Lista,Indeks1,Indeks2,Wynik):-
	nth1(Indeks1,Lista,Element1),
	nth1(Indeks2,Lista,Element2),
	zamien_elementy(Lista,Indeks1,Element2,Lista_tymczasowa),
	zamien_elementy(Lista_tymczasowa,Indeks2,Element1,Wynik).

zamien_elementy(Lista,Indeks,NowyElement,NowaLista):-
	nth1(Indeks,Lista,StaryElement),
	select(StaryElement,Lista,NowyElement,NowaLista).

/* Cwiczenie 2. */

nalezy(X, [X|_]).
nalezy(X, [_|Yogon]) :-
    nalezy(X, Yogon).
/*Program sprawdza czy X jest rowny glowie listy,
czyli pierwszemu elementowi listy. Jesli tak,
to zwraca true, jesli nie, to sprawdza jaki jest
ogon listy, i ponownie wywoluje poprzednia
funkcje rekurencyjnie, majac tym razem liste
krotsza o jeden poprzedni element.*/

/*
?- nalezy(c,[a,b,c,d]).
true ;
false.

?- nalezy(X,[a,b,c,d]).
X = a ;
X = b ;
X = c ;
X = d ;
false.

?- nalezy(x,[a,b,c,d]).
false.

?- nalezy(x,a).
false.

?- nalezy(X,a).
false.

?- nalezy(X,[a]).
X = a ;
false.
*/

/* Cwiczenie 3. */
dlugosc([],0).
dlugosc([_|Ogon],Dlug) :-
	dlugosc(Ogon,X),
	Dlug is X+1.

/*
?- dlugosc([a,b,c],X).
X = 3.
Rekursywnie jest wykonywany program.
Gdy X bedzie 0, wtedy wracajac sumuje po 1
i tym sposobem zlicza dlugosc.
*/

/* Cwiczenie 4. */
a2b([],[]).
a2b([a|Ta],[b|Tb]) :-
	a2b(Ta,Tb).

/*
?- a2b([a,a,a],[b,b,b]).
?- a2b([a,a,a,a],[b,b,b]).
?- a2b([a,s,d],[b,s,d]).
?- a2b([a,a,a,a],X).
?- a2b(X,[b,b]).
?- a2b(X,Y).
*/

/* Cwiczenie 5. */
sklej([],X,X).
sklej([X|L1],L2,[X|L3]):-
	sklej(L1,L2,L3).
nalezy1(X,L):-
	sklej(_,[X|_],L).
/*
?- sklej([a,b],[c,d],X).
?- sklej([a,b],X,[c,d]).
?- sklej([a,b],X,[a,b,c,d]).
?- sklej(A,B,[a,b,c,d,e]).
?- sklej([1,2,3],[a,b,c],X).
?- sklej([1,2,3],[a(e),b(f),c(d,g)],X).
?- sklej(Przed,[5|Po],[1,2,3,4,5,6,7,8,9]).
?- sklej(_,[A,5,B|_],[1,2,3,4,5,6,7,8,9]).
?- sklej(A,[x,x,x|_],[a,b,x,x,c,x,x,x,d,e]).

ostatni(Element, [Lista]).
ostatni(Element, [_|Lista]) :-
    ostatni(Element, Lista).
*/

/* Cwiczenie 6. */
dodaj(X,L,[X|L]).

/*
?- dodaj(a,[c,d],X).
?- dodaj([a,b],[c,d],X).
*/

/* Cwiczenie 7. */
usun(X,[X|Reszta],Reszta).
usun(X,[Y|Ogon],[Y|Reszta]) :-
	usun(X,Ogon,Reszta).

wstaw(X,L,Duza) :-
	usun(X,Duza,L).

nalezy2(X,L) :-
	usun(X,L,_).
/*
?- usun(a,[a,b,a,c,a,a],X).
?- usun(a,[a,b,c,d],X).
?- usun(c,[a,b,c,d],X).
?- usun(c,X,[a,b,c,d]).
?- usun(1,X,[a,b,c,d]).
*/

/* Cwiczenie 8. */
zawiera(S,L) :-
	sklej(_,L2,L),
	sklej(S,_,L2).
/*
?- zawiera(a,[a,b,c]).
?- zawiera([a],[a,b,c]).
?- zawiera(X,[a,b,c]).
?- zawiera([X],[a,b,c]).
?- zawiera([X,Y],[a,b,c]).
?- zawiera([X,Y,Z],[a,b,c]).
*/

/* Cwiczenie 9. */
permutacja([],[]).
permutacja([X|L],P) :-
	permutacja(L,L1),
	wstaw(X,L1,P).

permutacja2([],[]).
permutacja2(L,[X|P]) :-
	usun(X,L,L1),
	permutacja2(L1,P).
/*
?- permutacja([a,b,c],X).
?- permutacja2([a,b,c],X).
*/

/* Cwiczenie 10. */
odwroc([],[]).
odwroc([H|T],L) :-
	odwroc(T,R),
	sklej(R,[H],L).
/*
?- odwroc([a,b,c,d],X).
?- odwroc([a,b,c,d],[d,c,b,a]).

List: [a,b,c,d] Accumulator: []
List: [b,c,d] Accumulator: [a]
List: [c,d] Accumulator: [b,a]
List: [d] Accumulator: [c,b,a]
List: [] Accumulator: [d,c,b,a]

odwroc2(L,R) :-
odwr2(L,[],R).
odwr2([H|T],A,R) :-
odwr2(T,[H|A],R).
odwr2([],A,A).
*/

/* Cwiczenie 11. */
wypisz([H|T]) :-
	put(H), wypisz(T).
wypisz([]).

plural(Noun, PL) :-
	name(Noun, L),
	name(s,T),
	append(L,T, NL),
	name(PL, NL).

/*
?- write('ala').
?- write('ala ma kota').
?- write("ala").
?- write("ala ma kota").
?- X = 'a', put(X).
?- X = 'ala', put(X).
?- X = "a", put(X).
?- put(65),put(66),put(67).

?- wypisz("ala ma kota").
?- permutacja("abc",X),wypisz(X),nl,fail.
?- wstaw(" ", "abcdefgh",Z),wypisz(Z),nl,fail.
?- plural(day,PL).
*/

/* Cwiczenie 12. */
sklej_roznicowo(L - End, End, L).
/*
?:- sklej_roznicowo([a,b,c|End]-End,[d,e,f],Wynik).
End = [d, e, f],
Wynik = [a, b, c, d, e, f].
*/

/* ZADANIE 1. */
usun_trzy_ostatnie(L, L1) :-
    sklej(L1, [_, _, _], L).

/* ZADANIE 2. */
usun_trzy_pierwsze(L, L1) :-
    sklej([_, _, _], _, L, L1).


/* ZADANIE 3. */
usun_trzy_pierwsze_i_ostatnie(L, L2) :-
    sklej([_, _, _], _, L, L1),
    sklej(_, [_, _, _], L1, L2).

/* ZADANIE 4. */
nieparzysta(L) :-
    length(L, Len),
    Len mod 2 =\= 0.
parzysta(L) :-
    length(L, Len),
    Len mod 2 =:= 0.
utworz_liste(N, Lista) :-
    (   N mod 2 =:= 0,
        parzysta(Lista)
    ;   N mod 2 =\= 0,
        nieparzysta(Lista)
    ).
	
/* ZADANIE 5. */
palindrom(L) :-
    odwroc(L, Odwrocona),
    L = Odwrocona.

/* ZADANIE 6. */
przesun([H|T], L2) :-
    sklej(T, [H], L2).

/* ZADANIE 7. */
znaczy(0, zero).
znaczy(1, jeden).
znaczy(2, dwa).
znaczy(3, trzy).
znaczy(4, cztery).
znaczy(5, piec).
znaczy(6, szesc).
znaczy(7, siedem).
znaczy(8, osiem).
znaczy(9, dziewiec).

przeloz([], []).
przeloz([H|T], [Word|Rest]) :-
    znaczy(H, Word),
    przeloz(T, Rest).

/* ZADANIE 8. */
podzbior(L, Z) :-
    subset(Z, L).

/* ZADANIE 9. */
podziel(L, L1, L2) :-
    length(L, Len),
    Half is Len // 2,
    length(L1, Half),
    append(L1, L2, L).

/* ZADANIE 10. */
splaszcz([], []).
splaszcz([H|T], Flat) :-
    is_list(H),
    splaszcz(H, FlatH),
    splaszcz(T, FlatT),
    append(FlatH, FlatT, Flat).
splaszcz([H|T], [H|FlatT]) :-
    \+ is_list(H),
    splaszcz(T, FlatT).

/* ZADANIE 11. */
moneta(1).
moneta(2).
moneta(5).
moneta(10).
moneta(20).
moneta(50).
moneta(100).
moneta(200).

rozmien(0, []).
rozmien(Kwota, [Nominal | Reszta]) :-
    Kwota > 0,
    moneta(Nominal),
    Kwota >= Nominal,
    NowaKwota is Kwota - Nominal,
    rozmien(NowaKwota, Reszta).
rozmien(Kwota, Reszta) :-
    Kwota > 0,
    moneta(InnyNominal),
    NowaKwota is Kwota - InnyNominal,
    rozmien(NowaKwota, Reszta).

