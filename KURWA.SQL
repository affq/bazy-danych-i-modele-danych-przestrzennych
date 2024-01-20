
create or replace function funkcja(parametr real)
returns text as
$$
declare
    promien real;
    min_nosnosc real;
    nosnosc real;
    rec record;
    geom text;

    buin cursor for
        select rodzajKomunikacji, count(*) as liczba, nosnosc as n, st_buffer(geometria, nosnosc * parametr) as geom
        from ot_buin_l
        group by rodzajKomunikacji;
begin
    min_nosnosc := (SELECT MIN(nosnosc) FROM ot_buin_l);
    open buin;
    loop
        fetch buin into rec;
        exit when not found;

        nosnosc := coalesce(rec.n, min_nosnosc);
        promien := nosnosc * parametr;

        execute 'create table if not exists zbiorniki_przy_obiektach_' || rec.rodzajKomunikacji || '(id serial primary key, rodzaj text, liczba integer, geom geometry(polygon, 2180))';

        geom := st_astext(rec.geom);

        execute 'insert into zbiorniki_przy_obiektach_' || rec.rodzajKomunikacji || '(rodzaj, liczba, geom) select rodzaj, count(*), st_difference(geom, st_buffer(geom, ' || promien || ')) from ot_buzt_a where st_intersects(geom, st_buffer(geom, ' || promien || ')) group by rodzaj';
		
    end loop;
    close buin;
    return 'hurra';
end;
$$ language plpgsql volatile;



