posiada(piotr,auto).
posiada(marcin,auto).
posiada(piotr,auto(nissan,almera)).
posiada(marcin,auto(fiat,punto)).
maAuto(X):-posiada(X,auto(_,_)).

dodaj(X,Y,Z):-
  Z is X + Y.

samochod(fiat_uno, 30, 5.5, lpg).
samochod(ford_escort, 70, 6, benzyna).
samochod(vw_golf, 65, 7, diesel).
ilekm(X,Km):-
  samochod(X,Y,Z,_),
  Km is Y/Z*100.

/* ZADANIE 1. */
/*
?- X is 2 + 2.
X = 4.

?- Y is 2.5 + (4/2).
Y = 4.5.

?- Z is 2 + 0.001.
Z = 2.001.

?- A is 3.
A = 3.

?- B is A + 4.
ERROR: Arguments are not sufficiently instantiated
ERROR: In:
ERROR:   [10] _10472 is _10478+4
ERROR:    [9] toplevel_call(user:user: ...) at /Users/mbaryla/Downloads/SWI-Prolog.app/Contents/swipl/boot/toplevel.pl:1173
?- A is 3, B is A + 4.
A = 3,
B = 7.

  WNIOSKI:
Zmienne sa przechowywane tylko podczas tej samej operacji. Jezeli rozbije
sie zmienne do innej operacji to program nie przechowuje ich w pamieci.

?- X is 2 + 2.
X = 4.

?- X is 2 * 3.
X = 6.
*/

%?- X is 4 / 2.
%X = 2.

%?- X is 4 / 3.
%X = 1.3333333333333333.

%?- X is 4 // 3.
%X = 1.
/*
?- X is 2 + 5.
X = 7.

?- X = 2 + 5.
X = 2+5.

?- 2 + 5 =:= 1 + 4.
false.

?- 2 + 5 =:= 3 + 4.
true.

?- 2 + 5 =:= 4 + 4.
false.

?- 2 < 3.
true.

?- 2 > 3.
false.

?- 3 > 3.
false.

?- 3 >= 3.
true.

?- 3 =< 3.
true.
*/

/* ZADANIE 2. ORAZ ZADANIE 3. */
rzeczownik(jablko).
rzeczownik(adam).
rzeczownik(dom).
rzeczownik(pies).
rzeczownik(uniwersytet).
rzeczownik(student).
rzeczownik(drzewo).

czasownik(lubi).
czasownik(musi).
czasownik(robi).
czasownik(czeka_na).
czasownik(szczeka_na).
czasownik(spada_z).
czasownik(naucza).

przymiotnik(fajny).
przymiotnik(modny).
przymiotnik(cieply).
przymiotnik(zimny).
przymiotnik(czarny).

poprawne_3_wyrazowe(Rzeczownik1, Czasownik, Rzeczownik2):-
  rzeczownik(Rzeczownik1),
  czasownik(Czasownik),
  rzeczownik(Rzeczownik2).

poprawne_5_wyrazowe(Rzeczownik1, Czasownik, Przymiotnik, Rzeczownik2, Rzeczownik3):-
  rzeczownik(Rzeczownik1),
  czasownik(Czasownik),
  przymiotnik(Przymiotnik),
  rzeczownik(Rzeczownik2),
  rzeczownik(Rzeczownik3).

/* Zadanie 4. */
/*dlugosc(kontener1, 20).
szerokosc(kontener1,30).
wysokosc(kontener1, 15).
dlugosc(kontener2, 25).
szerokosc(kontener2,9).
wysokosc(kontener2, 10).

objetosc(Kontener,Dlugosc,Szerokosc,Wysokosc,V):-
  dlugosc(Kontener,Dlugosc),
  szerokosc(Kontener,Szerokosc),
  wysokosc(Kontener, Wysokosc),
  V is Dlugosc * Szerokosc * Wysokosc.
*/

/* Zadanie 5. */
% NWD dwoch liczb
nwd(X, X, X).
nwd(X, Y, D) :-
    X < Y,
    R is Y - X,
    nwd(X, R, D).
nwd(X, Y, D) :-
    X > Y,
    R is X - Y,
    nwd(Y, R, D).

