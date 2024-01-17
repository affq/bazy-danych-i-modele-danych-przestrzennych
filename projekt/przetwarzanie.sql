-- create or replace function kopytko(nazwamiejsc text, promien real)
-- returns text as
-- 	$$
-- 		declare
-- 		odcinek cursor(miasto text)
-- 			for
-- 				select a.nazwa, 
-- 						st_x(st_startpoint((st_linemerge(l.geom)))) as start_x,
-- 						st_y(st_startpoint((st_linemerge(l.geom)))) as start_y,
-- 						st_x(st_endpoint((st_linemerge(l.geom)))) as end_x,
-- 						st_y(st_endpoint((st_linemerge(l.geom)))) as end_y
-- 				from adms_a as a inner join skjz_l as l
-- 				on st_within(l.geom, a.geom)
-- 				where a.nazwa = miasto;
-- 		rec record;
-- 		startx real;
-- 		starty real;
-- 		endx real;
-- 		endy real;
-- 		srodekx real;
-- 		srodeky real;
-- 		geom text;
-- 		begin
-- 		drop table if exists kolo;
-- 		create table kolo(
-- 			id serial primary key,
-- 			geom geometry(polygon, 2180)
-- 		);
-- 			open odcinek(nazwamiejsc);
-- 			loop
-- 				fetch odcinek into rec;
-- 				exit when not found;
-- 				startx := rec.start_x;
-- 				starty := rec.start_y;
-- 				endx := rec.end_x;
-- 				endy := rec.end_y;
-- 				srodekx := (startx + endx) / 2;
-- 				srodeky := (starty + endy) / 2;
-- 				geom := 'POINT(' || srodekx::text || ' ' || srodeky::text || ')';
-- 				insert into kolo(geom) values (st_buffer(st_geomfromtext(geom), promien));
-- 			end loop;
-- 			close odcinek;
-- 			return 'hurra';
-- 		end;
-- 	$$
 
-- language plpgsql volatile;


-- Napisz funkcję, która: 

-- 1. Z tabeli ot_buin_l (budowle inżynierskie) pobierze obiekty i pogrupuje wg zawartości atrybutu rodzajKomunikacji.

-- 2. Dla każdej z powstałych w pkt. 1 grup utworzy nową tabelę o nazwie zbiorniki_przy_obiektach_[nazwa z wartości – kryterium grupy z punktu 1](ID serial(PK), rodzaj(text) , liczba(integer), geom(geometry))

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

create or replace function funkcja (liczba real)
returns text as
$$
declare
    grupy cursor
    for
        select rodzajKomunikacji as rodzaj
        from ot_buin_l
        group by rodzajKomunikacji;
    rec record;
    rodzaj text;
    liczba real;
    begin
        open grupy;
        loop
            fetch grupy into rec;
            exit when not found;
            rodzaj := rec.rodzaj;
            drop table if exists zbiorniki_przy_obiektach_ || rodzaj;
            create table zbiorniki_przy_obiektach_ || rodzaj(
                id serial primary key,
                rodzaj text,
                liczba integer,
                geom geometry
            );
        end loop;
        close grupy;

    end;
$$