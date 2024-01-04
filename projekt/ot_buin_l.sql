-- belkowy = Blk
-- lukowy = Luk
-- obrotowy = Obt
-- podwieszony = Pws
-- wiszacy = Wsc
-- pozostaleKonstrukcje = Inn

create type OT_KonstrukcjaBudowliInzynierskiej as enum ('Blk', 'Luk', 'Obt', 'Pws', 'Wsc', 'Inn');
-- create type OT_KonstrukcjaBudowliInzynierskiej as enum ('belkowy', 'lukowy', 'obrotowy', 'podwieszony', 'wiszacy', 'pozostaleKonstrukcje');

-- beton = Bt
-- cegla = Cg
-- drewno = Dr
-- kamien = Km
-- stal = St
-- zelbet = Zb

create type OT_MaterialKonstrukcyjnyBudowliInzynierskiej as enum ('Bt', 'Cg', 'Dr', 'Km', 'St', 'Zb');
-- create type OT_MaterialKonstrukcyjnyBudowliInzynierskiej as enum ('beton', 'cegla', 'drewno', 'kamien', 'stal', 'zelbet');

-- estakada = e
-- wiadukt = w
-- kladkaDlaPieszych = k
-- most = m
-- przejsciePodziemneDlaPieszych = d
-- przepust = p
-- tunel = t

create type OT_RodzajBudowliInzynierskiej as enum ('e', 'w', 'k', 'm', 'd', 'p', 't');
-- create type OT_RodzajBudowliInzynierskiej as enum ('estakada', 'wiadukt', 'kladkaDlaPieszych', 'most', 'przejsciePodziemneDlaPieszych', 'przepust', 'tunel');

-- drogowa = dr
-- kolejowa = kl
-- tramwajowa = tr

create type OT_RodzajKomunikacji as enum ('dr', 'kl', 'tr');
-- create type OT_RodzajKomunikacji as enum ('drogowa', 'kolejowa', 'tramwajowa');

create table OT_BUIN_L(
    id serial primary key,
    dlugosc float,
    geometria geometry(Curve, 2180) not null,
    konstrukcja OT_KonstrukcjaBudowliInzynierskiej,
    materialKonstrukcyjnyPodpor OT_MaterialKonstrukcyjnyBudowliInzynierskiej,
    materialKonstrukcyjnyPomostu OT_MaterialKonstrukcyjnyBudowliInzynierskiej,
    nazwa text,
    nosnosc float,
    nrEwidencyjnyZarzaduDrog text,
    rodzaj OT_RodzajBudowliInzynierskiej not null,
    rodzajKomunikacji OT_RodzajKomunikacji not null,
    szerokosc float,
    wysokosc float,
);