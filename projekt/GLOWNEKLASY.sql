create table OT_BUIN_L(
    id serial primary key,
    dlugosc float,
    geometria geometry(MultiLineString, 2180) not null,
    konstrukcja text references OT_KonstrukcjaBudowliInzynierskiej(id),
    materialKonstrukcyjnyPodpor text references OT_MaterialKonstrukcyjnyBudowliInzynierskiej(id),
    materialKonstrukcyjnyPomostu text references OT_MaterialKonstrukcyjnyBudowliInzynierskiej(id),
    nazwa text,
    nosnosc float,
    nrEwidencyjnyZarzaduDrog text,
    rodzaj text references OT_RodzajBudowliInzynierskiej(id) not null,
    rodzajKomunikacji text references OT_RodzajKomunikacji(id) not null,
    szerokosc float,
    wysokosc float,
    idIIP serial references BT_Identyfikator(id) not null,
    czyObiektBDOO boolean not null,
    x_kod text not null,
    x_katDoklGeom text references OT_KatDokladnosci(id) not null,
    x_doklGeom float,
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
    x_doklGeom float,
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
    x_doklGeom float,
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
