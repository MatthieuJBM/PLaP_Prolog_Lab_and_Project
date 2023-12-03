/* Zadanie 2. */

zatrudnienie(anna,nowak,zelmer,duza_firma,2000).
zatrudnienie(katarzyna,nowak,zelmer,duza_firma,1500).
zatrudnienie(klaudia,kowal,zelmer,duza_firma,1300).
zatrudnienie(mariusz,cebulak,zelmer,duza_firma,1450).
zatrudnienie(jacek,balcerzak,bobo,mala_firma,2700).
zatrudnienie(joerg,schmidt,falcon,mala_firma,3500).
zatrudnienie(borys,bujer,bobo,mala_firma,2400).
zatrudnienie(adas,mazak,frl,srednia_firma,2600).

zadowolona(X):-
	zatrudnienie(X,_,_,mala_firma,Zarobek),
	(Zarobek > 2500).

duza_firma_i_mniej_niz(X):-
	zatrudnienie(X,_,_,duza_firma,Zarobek),
	(Zarobek < 1500).