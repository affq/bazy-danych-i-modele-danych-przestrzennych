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