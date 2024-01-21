create table BT_Identyfikator(
    id serial primary key,
    lokalnyId text not null,
    przestrzenNazw text not null,
    wersjaId text
);

create table OT_KatDokladnosci(
    id text primary key,
    nazwa text not null
);
insert into OT_KatDokladnosci values ('Dok', 'dokladny'), ('Prz', 'przyblizony'), ('Npw', 'niepewny');

create table OT_ZrodloDanych(
    id text primary key,
    nazwa text not null
);
insert into OT_ZrodloDanych values ('GEOS', 'bazaDanychGeodezyjnychGrawimetrycznych'), ('EGiB', 'ewidencjaGruntowIBudynkow'), ('GESUT', 'geodezyjnaEwidencjaSieciUzbrojeniaTerenu'), ('PRG', 'bazaDanychPanstwowegoRejestruGranic'), ('PRNG', 'panstwowyRejestrNazwGeograficznych'), ('EMUiA', 'ewidencjaMiejscowosciUlicAdresow'), ('RCiWN', 'rejestrCenWartosciNieruchomosci'), ('BDO', 'bazaDanychOgolnogeograficznych'), ('Ort', 'ortofotomapa'), ('Mz', 'mapaZasadnicza'), ('Mtp10', 'mapaTopograficzna10k'), ('Mtp50', 'mapaTopograficzna50k'), ('VMAPL2_v1', 'vmapLevel2PierwszejEdycji'), ('VMAPL2_v2', 'vmapLevel2DrugiejEdycji'), ('BDT', 'bazaDanychTopograficznych'), ('CORINE', 'bazaDanychCLC'), ('CRFOP', 'centralnyRejestrFormOchronyPrzyrody'), ('BDD', 'bankDanychDrogowych'), ('BDOT500', 'bazaDanychWgInstrK1'), ('KSOCH', 'krajowySystemObszarowChronionych'), ('LMN', 'lesnaMapaNumeryczna'), ('MPHP', 'mapaPodzialuHydrograficznegoPolski'), ('PKP', 'bazyDanychPKP'), ('RZAB', 'rejestrZabytkow'), ('TERYT', 'krajowyRejestrUrzedowyPodzialuTerytorialnegoKraju'), ('Str', 'pomiarStereoskopowy'), ('Trn', 'pomiarTerenowy');

create table OT_RodzajReprGeom(
    id text primary key,
    nazwa text not null
);
insert into OT_RodzajReprGeom values ('SG', 'srodekGeometryczny'), ('MC', 'miejsceCharakterystyczne'), ('PU', 'punktUmowny'), ('OG', 'osGeometryczna'), ('OI', 'osInterpolowana'), ('LU', 'liniaUmowna'), ('SL', 'sztucznyLacznik'), ('KR', 'krawedz'), ('ZP', 'zarysPodstawy'), ('ZU', 'zasiegUmowny'), ('MA', 'maksymalnyZasieg'), ('MI', 'minimalnyZasieg'), ('SZ', 'sredniZasieg');

create table OT_KonstrukcjaBudowliInzynierskiej(
    id text primary key,
    nazwa text not null
);
insert into OT_KonstrukcjaBudowliInzynierskiej values ('Blk', 'belkowy'), ('Luk', 'lukowy'), ('Obt', 'obrotowy'), ('Pws', 'podwieszony'), ('Wsc', 'wiszacy'), ('Inn', 'pozostaleKonstrukcje');

create table OT_MaterialKonstrukcyjnyBudowliInzynierskiej(
    id text primary key,
    nazwa text not null
);
insert into OT_MaterialKonstrukcyjnyBudowliInzynierskiej values ('Bt', 'beton'), ('Cg', 'cegla'), ('Dr', 'drewno'), ('Km', 'kamien'), ('St', 'stal'), ('Zb', 'zelbet');

create table OT_RodzajBudowliInzynierskiej(
    id text primary key,
    nazwa text not null
);
insert into OT_RodzajBudowliInzynierskiej values ('e', 'estakada'), ('w', 'wiadukt'), ('k', 'kladkaDlaPieszych'), ('m', 'most'), ('d', 'przejsciePodziemneDlaPieszych'), ('p', 'przepust'), ('t', 'tunel');

create table OT_RodzajKomunikacji(
    id text primary key,
    nazwa text not null
);
insert into OT_RodzajKomunikacji values ('dr', 'drogowa'), ('kl', 'kolejowa'), ('tr', 'tramwajowa');

create table OT_RodzajZbiornikaTechnicznego(
    id text primary key,
    nazwa text not null
);

insert into OT_RodzajZbiornikaTechnicznego values ('Osd', 'osadnik'), ('Zcc', 'zbiornikNaCiecz'), ('Zmp', 'zbiornikNaMaterialyPedneLubGaz'), ('Zms', 'zbiornikNaMaterialySypkie');

create table OT_BUIN_L(
    id serial primary key,
    dlugosc real,
    geometria geometry(MultiLineString, 2180) not null,
    konstrukcja text references OT_KonstrukcjaBudowliInzynierskiej(id),
    materialKonstrukcyjnyPodpor text references OT_MaterialKonstrukcyjnyBudowliInzynierskiej(id),
    materialKonstrukcyjnyPomostu text references OT_MaterialKonstrukcyjnyBudowliInzynierskiej(id),
    nazwa text,
    nosnosc real,
    nrEwidencyjnyZarzaduDrog text,
    rodzaj text references OT_RodzajBudowliInzynierskiej(id) not null,
    rodzajKomunikacji text references OT_RodzajKomunikacji(id) not null,
    szerokosc real,
    wysokosc real,
    idIIP serial references BT_Identyfikator(id) not null,
    czyObiektBDOO boolean not null,
    x_kod text not null,
    x_katDoklGeom text references OT_KatDokladnosci(id) not null,
    x_doklGeom real,
    x_zrodloDanychG text references OT_ZrodloDanych(id) not null,
    x_zrodloDanychA text references OT_ZrodloDanych(id) not null,
    x_rodzajReprGeom text references OT_RodzajReprGeom(id) not null,
    x_uwagi text,
    x_uzytkownik text not null,
    x_aktualnoscG date not null,
    x_aktualnoscA date not null,
    x_cyklZycia date not null,
    x_dataUtworzenia date not null,
    x_informDodatkowa text
);

create table OT_BUZT_A(
    id serial primary key,
    geometria geometry(Polygon, 2180) not null,
    rodzaj text references OT_RodzajZbiornikaTechnicznego(id) not null,
    idIIP serial references BT_Identyfikator(id) not null,
    czyObiektBDOO boolean not null,
    x_kod text not null,
    x_katDoklGeom text references OT_KatDokladnosci(id) not null,
    x_doklGeom real,
    x_zrodloDanychG text references OT_ZrodloDanych(id) not null,
    x_zrodloDanychA text references OT_ZrodloDanych(id) not null,
    x_rodzajReprGeom text references OT_RodzajReprGeom(id) not null,
    x_uwagi text,
    x_uzytkownik text not null,
    x_aktualnoscG date not null,
    x_aktualnoscA date not null,
    x_cyklZycia date not null,
    x_dataUtworzenia date not null,
    x_informDodatkowa text
);

create table OT_BUZT_P(
    id serial primary key,
    geometria geometry(Point, 2180) not null,
    rodzaj text references OT_RodzajZbiornikaTechnicznego(id) not null,
    idIIP serial references BT_Identyfikator(id) not null,
    czyObiektBDOO boolean not null,
    x_kod text not null,
    x_katDoklGeom text references OT_KatDokladnosci(id) not null,
    x_doklGeom real,
    x_zrodloDanychG text references OT_ZrodloDanych(id) not null,
    x_zrodloDanychA text references OT_ZrodloDanych(id) not null,
    x_rodzajReprGeom text references OT_RodzajReprGeom(id) not null,
    x_uwagi text,
    x_uzytkownik text not null,
    x_aktualnoscG date not null,
    x_aktualnoscA date not null,
    x_cyklZycia date not null,
    x_dataUtworzenia date not null,
    x_informDodatkowa text
);

create index ot_buin_l_konstrukcja on ot_buin_l(konstrukcja);
create index ot_buin_l_materialKonstrukcyjnyPodpor on ot_buin_l(materialKonstrukcyjnyPodpor);
create index ot_buin_l_materialKonstrukcyjnyPomostu on ot_buin_l(materialKonstrukcyjnyPomostu);
create index ot_buin_l_rodzaj on ot_buin_l(rodzaj);
create index ot_buin_l_rodzajKomunikacji on ot_buin_l(rodzajKomunikacji);
create index ot_buin_l_idIIP on ot_buin_l(idIIP);
create index ot_buin_l_x_katDoklGeom on ot_buin_l(x_katDoklGeom);
create index ot_buin_l_x_zrodloDanychG on ot_buin_l(x_zrodloDanychG);
create index ot_buin_l_x_zrodloDanychA on ot_buin_l(x_zrodloDanychA);
create index ot_buin_l_x_rodzajReprGeom on ot_buin_l(x_rodzajReprGeom);

create index ot_buzt_a_rodzaj on ot_buzt_a(rodzaj);
create index ot_buzt_a_idIIP on ot_buzt_a(idIIP);
create index ot_buzt_a_x_katDoklGeom on ot_buzt_a(x_katDoklGeom);
create index ot_buzt_a_x_zrodloDanychG on ot_buzt_a(x_zrodloDanychG);
create index ot_buzt_a_x_zrodloDanychA on ot_buzt_a(x_zrodloDanychA);
create index ot_buzt_a_x_rodzajReprGeom on ot_buzt_a(x_rodzajReprGeom);

create index ot_buzt_p_rodzaj on ot_buzt_p(rodzaj);
create index ot_buzt_p_idIIP on ot_buzt_p(idIIP);
create index ot_buzt_p_x_katDoklGeom on ot_buzt_p(x_katDoklGeom);
create index ot_buzt_p_x_zrodloDanychG on ot_buzt_p(x_zrodloDanychG);
create index ot_buzt_p_x_zrodloDanychA on ot_buzt_p(x_zrodloDanychA);
create index ot_buzt_p_x_rodzajReprGeom on ot_buzt_p(x_rodzajReprGeom);

create index ot_buin_l_geometria on ot_buin_l using gist(geometria);
create index ot_buzt_a_geometria on ot_buzt_a using gist(geometria);
create index ot_buzt_p_geometria on ot_buzt_p using gist(geometria);

create or replace function ot_buzt_a_insert()
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


create materialized view ot_buzt_a_mv as
select
buzt.id, 
buzt.geometria,
rzt.nazwa as rodzajObiektu,
rrg.nazwa as rodzajReprezentacjiGeometrycznej,
zd.nazwa as zrodloDanychG, 
zd2.nazwa as zrodloDanychA,
kd.nazwa as kategoriaDokladnosci,
bti.lokalnyId as lokalnyId
from ot_buzt_a as buzt
left join OT_RodzajZbiornikaTechnicznego as rzt on buzt.rodzaj = rzt.id
left join bt_identyfikator as bti on buzt.idiip = bti.id
left join ot_katdokladnosci as kd on buzt.x_katdoklgeom = kd.id
left join ot_zrodloDanych as zd on buzt.x_zrodloDanychG = zd.id
left join ot_zrodloDanych as zd2 on buzt.x_zrodloDanychA = zd2.id
left join ot_rodzajreprgeom as rrg on buzt.x_rodzajreprgeom = rrg.id
with data;

create unique index ot_buzt_a_mv_idx on ot_buzt_a_mv using btree(id);
create index ot_buzt_a_mv_geom_idx on ot_buzt_a_mv using gist(geometria);
---------------------------------------

create materialized view ot_buzt_p_mv as
select
buzt.id,
buzt.geometria,
rzt.nazwa as rodzajObiektu,
rrg.nazwa as rodzajReprezentacjiGeometrycznej,
zd.nazwa as zrodloDanychG,
zd2.nazwa as zrodloDanychA,
kd.nazwa as kategoriaDokladnosci,
bti.lokalnyId as lokalnyId
from ot_buzt_p as buzt
left join OT_RodzajZbiornikaTechnicznego as rzt on buzt.rodzaj = rzt.id
left join bt_identyfikator as bti on buzt.idiip = bti.id
left join ot_katdokladnosci as kd on buzt.x_katdoklgeom = kd.id
left join ot_zrodloDanych as zd on buzt.x_zrodloDanychG = zd.id
left join ot_zrodloDanych as zd2 on buzt.x_zrodloDanychA = zd2.id
left join ot_rodzajreprgeom as rrg on buzt.x_rodzajreprgeom = rrg.id
with data;

create unique index ot_buzt_p_mv_idx on ot_buzt_p_mv using btree(id);
create index ot_buzt_p_mv_geom_idx on ot_buzt_p_mv using gist(geometria);

---------------------------------------

create materialized view ot_buin_l_mv as
select
buin.id,
buin.geometria,
kbi.nazwa as konstrukcja,
mkbi.nazwa as materialKonstrukcyjnyPodpor,
mkbi2.nazwa as materialKonstrukcyjnyPomostu,
rbi.nazwa as rodzaj,
rk.nazwa as rodzajKomunikacji,
bti.lokalnyId as lokalnyId,
kd.nazwa as kategoriaDokladnosci,
zd.nazwa as zrodloDanychG,
zd2.nazwa as zrodloDanychA,
rrg.nazwa as rodzajReprezentacjiGeometrycznej
from ot_buin_l as buin
left join OT_KonstrukcjaBudowliInzynierskiej as kbi on buin.konstrukcja = kbi.id
left join OT_MaterialKonstrukcyjnyBudowliInzynierskiej as mkbi on buin.materialKonstrukcyjnyPodpor = mkbi.id
left join OT_MaterialKonstrukcyjnyBudowliInzynierskiej as mkbi2 on buin.materialKonstrukcyjnyPomostu = mkbi2.id
left join OT_RodzajBudowliInzynierskiej as rbi on buin.rodzaj = rbi.id
left join OT_RodzajKomunikacji as rk on buin.rodzajKomunikacji = rk.id
left join BT_Identyfikator as bti on buin.idIIP = bti.id
left join OT_KatDokladnosci as kd on buin.x_katDoklGeom = kd.id
left join OT_ZrodloDanych as zd on buin.x_zrodloDanychG = zd.id
left join OT_ZrodloDanych as zd2 on buin.x_zrodloDanychA = zd2.id
left join OT_RodzajReprGeom as rrg on buin.x_rodzajReprGeom = rrg.id
with data;

create unique index ot_buin_l_mv_idx on ot_buin_l_mv using btree(id);
create index ot_buin_l_mv_geom_idx on ot_buin_l_mv using gist(geometria);

---------------------------------------

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