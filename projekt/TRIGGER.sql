create function ot_buzt_a_insert()
    returns trigger as
    $$
    begin
        insert into ot_buzt_p(geometria, rodzaj, idIIP, czyObiektBDOO, x_kod, x_katDoklGeom, x_doklGeom, x_zrodloDanychG, x_zrodloDanychA, x_rodzajReprGeom, x_uwagi, x_uzytkownik, x_aktualnoscG, x_aktualnoscA, x_cyklZycia, x_dataUtworzenia, x_informDodatkowa)
        values(st_centroid(new.geometria), new.rodzaj, new.idIIP, new.czyObiektBDOO, new.x_kod, new.x_katDoklGeom, new.x_doklGeom, new.x_zrodloDanychG, new.x_zrodloDanychA, new.x_rodzajReprGeom, new.x_uwagi, new.x_uzytkownik, new.x_aktualnoscG, new.x_aktualnoscA, new.x_cyklZycia, new.x_dataUtworzenia, new.x_informDodatkowa);
        return new;
    end;
    $$ language plpgsql;

create trigger tr_ot_buzt_a_insert
    before insert on ot_buzt_a
    for each row execute procedure ot_buzt_a_insert();

-- insert into BT_Identyfikator values ('1', '1', '1');
-- insert into ot_buzt_a(geometria, rodzaj, idIIP, czyObiektBDOO, x_kod, x_katDoklGeom, x_doklGeom, x_zrodloDanychG, x_zrodloDanychA, x_rodzajReprGeom, x_uwagi, x_uzytkownik, x_aktualnoscG, x_aktualnoscA, x_cyklZycia, x_dataUtworzenia, x_informDodatkowa) values('POLYGON((0 0, 0 1, 1 1, 1 0, 0 0))', 'Osd', 1, true, 'kod', 'Dok', 1, 'GEOS', 'EGiB', 'SG', 'uwagi', 'uzytkownik', '2020-01-01', '2020-01-01', '2020-01-01', '2020-01-01', 'informDodatkowa');