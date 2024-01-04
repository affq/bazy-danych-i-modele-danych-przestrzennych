-- Proszę wykonać mechanizmy, które w powstałym schemacie:

-- 1. Po wykryciu próby tworzenia obiektu w tabeli ot_buzt_a zostanie do tabeli ot_buzt_p wprowadzony
-- nowy obiekt odpowiedni o geometrii punktowej będącej centroidem poligonu wprowadzanego do 
-- ot_buzt_a i atrybutach opisowych takich, jak wprowadzone do ot_buzt_a.

create function ot_buzt_a_insert()
    returns trigger as
    $$
    begin
        insert into ot_buzt_p (geometria)
        values (st_centroid(new.geometria));
        return new;
    end
    $$

create trigger tr_ot_buzt_a_insert
    before insert on ot_buzt_a
    for each row execute procedure ot_buzt_a_insert();