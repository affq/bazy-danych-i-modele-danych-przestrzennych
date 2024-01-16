create table OT_BUZT(
    id serial primary key,
    rodzaj text references OT_RodzajZbiornikaTechnicznego(id) not null
);

create table OT_ObiektTopograficzny(
    id serial primary key,
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