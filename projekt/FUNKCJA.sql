create or replace function funkcja(parametr real)
returns text as
$$
declare
    promien real;
    min_nosnosc real;
    nosnoscz real;
    rec record;
    rec1 record;
    licznik integer;
    bufor geometry;
    toadd geometry;

    buin cursor for
        select * from ot_buin_l;
    
    buzt cursor for
        select * from ot_buzt_a;
begin
    min_nosnosc := (select min(nosnosc) from ot_buin_l where nosnosc is not null);

    drop table if exists zbiorniki_przy_obiektach_dr;
    drop table if exists zbiorniki_przy_obiektach_kl;
    drop table if exists zbiorniki_przy_obiektach_tr;

    open buin;
    loop
        fetch buin into rec;
        exit when not found;

        licznik := 0;
        toadd := ST_GeomFromText('POLYGON EMPTY', 2180);

        nosnoscz := coalesce(rec.nosnosc, min_nosnosc);
        promien := nosnoscz * parametr;

        execute 'create table if not exists zbiorniki_przy_obiektach_' || rec.rodzajKomunikacji || '(id serial primary key, rodzaj text, liczba integer, geom geometry(multipolygon, 2180))';

        bufor := ST_SetSRID(ST_Buffer(rec.geometria, promien), 2180);

        open buzt;
        loop
            fetch buzt into rec1;
            exit when not found;
            if ST_Intersects(rec1.geometria, bufor) then
                licznik := licznik + 1;
                toadd := ST_Union(toadd, ST_Intersection(rec1.geometria, bufor));
            end if;
        end loop;
        close buzt;

        execute 'insert into zbiorniki_przy_obiektach_' || rec.rodzajKomunikacji || '(rodzaj, liczba, geom) values (''' || rec.rodzaj || ''', ' || licznik || ', ''' || ST_AsText(toadd) || ''')';
    end loop;
    close buin;
    return 'udalo sie';
end;
$$ language plpgsql volatile;