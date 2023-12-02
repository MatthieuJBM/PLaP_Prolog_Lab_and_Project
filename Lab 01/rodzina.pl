/* Zadanie 1. */

rodzic(zofia, marcin).
rodzic(andrzej, marcin).
rodzic(andrzej, kasia).
rodzic(marcin, ania).
rodzic(marcin, krzyś).
rodzic(krzyś, mikołaj).

kobieta(zofia).
kobieta(kasia).
kobieta(ania).
mezczyzna(andrzej).
mezczyzna(marcin).
mezczyzna(krzyś).
mezczyzna(mikołaj).

potomek(Y,X):-rodzic(X,Y).
matka(X,Y):-rodzic(X,Y), kobieta(X).
dziadkowie(X,Z):-rodzic(X,Y), rodzic(Y,Z).
siostra(X,Y):-rodzic(Z,X), rodzic(Z,Y), kobieta(X), X\=Y.

/* Zadanie 2. */

/* Kilka osób. 
osoba(andrzej).
osoba(bogdan).
osoba(karolina).
osoba(kamila).
osoba(klaudia). */

/* Ich ulubione sposoby spędzania wolnego czasu.*/
sposob_spedzania_wolnego_czasu(andrzej, pilka_nozna).
sposob_spedzania_wolnego_czasu(bogdan, siatkowka).
sposob_spedzania_wolnego_czasu(karolina, tenis).
sposob_spedzania_wolnego_czasu(kamila, siatkowka).
sposob_spedzania_wolnego_czasu(klaudia, wyjazd_w_gory).

/* Wiek osób.*/
wiek(andrzej, 25).
wiek(bogdan, 31).
wiek(karolina, 23).
wiek(kamila, 27).
wiek(klaudia, 30).

/* Reguła porównująca wiek. */
starszy(X, Y):-wiek(X, WiekX), wiek(Y, WiekY), WiekX > WiekY.
mlodszy(X, Y):-wiek(X, WiekX), wiek(Y, WiekY), WiekX < WiekY.

/* Zadanie 3. */

/* osoba(imie, imie_ojca, imie_matki, plec, wiek) */
osoba(mateusz,jurek,anna,mezczyzna,27).
osoba(jacek,jurek,anna,mezczyzna,30).
osoba(jurek,bogdan,halina,mezczyzna,55).
osoba(anna,gerald,zofia,kobieta,50).
osoba(agnieszka,gerald,zofia,kobieta,46).

/* Zdefiniuj reguły, które pozwolą sprawdzić, */
/* czy dla danych dwóch osób zachodzi pokrewieństwo */
/* np. rodzeństwo, bracia, siostry, brat, siostra. */

rodzenstwo(X,Y):-osoba(X, Imie_ojcaX, Imie_matkiX, _, _), osoba(Y, Imie_ojcaY, Imie_matkiY, _, _), X\=Y, Imie_ojcaX=Imie_ojcaY, Imie_matkiX=Imie_matkiY.
bracia(X,Y):-osoba(X, Imie_ojcaX, Imie_matkiX, mezczyzna, _), osoba(Y, Imie_ojcaY, Imie_matkiY, mezczyzna, _), X\=Y, Imie_ojcaX=Imie_ojcaY, Imie_matkiX=Imie_matkiY.
siostry(X,Y):-osoba(X, Imie_ojcaX, Imie_matkiX, kobieta, _), osoba(Y, Imie_ojcaY, Imie_matkiY, kobieta, _), X\=Y, Imie_ojcaX=Imie_ojcaY, Imie_matkiX=Imie_matkiY.