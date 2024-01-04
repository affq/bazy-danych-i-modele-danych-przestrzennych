-- Napisz funkcję, która: 

-- 1. Z tabeli ot_buin_l (budowle inżynierskie) pobierze obiekty i pogrupuje wg zawartości atrybutu 
-- rodzajKomunikacji.

-- 2. Dla każdej z powstałych w pkt. 1 grup utworzy nową tabelę o nazwie zbiorniki_przy_obiektach_[nazwa 
-- z wartości – kryterium grupy z punktu 1](ID serial(PK), rodzaj(text) , liczba(integer), geom(geometry))

-- 3. Dla wszystkich obiektów z ot_buin_l :
-- a. wykona bufor o promieniu będącym iloczynem wartości atrybutu nosnosc i liczby podanej 
-- jako parametr funkcji.
-- Uwaga ! Żeby się zabezpieczyć przed występowaniem w nosnosc wartości NULL przed tym 
-- procesem należy znaleźć najmniejszą wartość nośności spośród występujących w tym 
-- atrybucie. Następnie, w rekordach, które mają nosnosc is NULL używana byłaby znaleziona 
-- najmniejsza wartość.

-- b. Buforem z pkt. 3.a. wybierze obiekty z ot_buzt_a.

-- c. Do odpowiedniej z tabel powstałych w pkt. 2 wprowadzi nowy rekord danych zawierający 
-- wartość z atrybutu rodzaj obiektu, liczbę obiektów z ot_buzt_a, które zostały wybrane w pkt. 
-- 3.b., geometrię powstałą z wycięcia obiektów wybranych w pkt. 3.b. buforem.
