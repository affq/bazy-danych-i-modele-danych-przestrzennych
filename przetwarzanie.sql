create or replace function funkcja(parametr real)
returns text as
$$
declare
    promien real;
    min_nosnosc real;
    nosnosc real;
    rec record;
    g text;

    buin cursor for
        select rodzajKomunikacji, min(nosnosc) as n, geometria as geom
        from ot_buin_l
        group by rodzajKomunikacji;
begin
    min_nosnosc := (SELECT MIN(nosnosc) FROM ot_buin_l);
	
	drop table zbiorniki_przy_obiektach_dr;
	drop table zbiorniki_przy_obiektach_kl;
	drop table zbiorniki_przy_obiektach_tr;

    open buin;
    loop
        fetch buin into rec;
        exit when not found;

        nosnosc := coalesce(rec.n, min_nosnosc);
        promien := nosnosc * parametr;
        
        execute 'create table if not exists zbiorniki_przy_obiektach_' || rec.rodzajKomunikacji || '(id serial primary key, rodzaj text, liczba integer, geom geometry(polygon, 2180))';

        g := 'POLYGON((10 10, 10 20, 20 20, 20 10, 10 10))'

        execute 'insert into zbiorniki_przy_obiektach_' || rec.rodzajKomunikacji || '(rodzaj, liczba, geom) select rodzaj, count(*), g from ot_buzt_a';

    end loop;
    close buin;
    return 'hurra';
end;
$$ language plpgsql volatile;


drop table zbiorniki_przy_obiektach_dr;
drop table zbiorniki_przy_obiektach_kl;


select funkcja(4);