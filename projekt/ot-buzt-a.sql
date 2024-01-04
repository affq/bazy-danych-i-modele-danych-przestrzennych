create table OT_BUZT_A(
    id serial primary key,
    geometria geometry(Polygon, 2180) not null
);

create table OT_BUZT_P(
    id serial primary key,
    geometria geometry(Point, 2180) not null
);

-- osadnik = Osd
-- zbiornikNaCiecz = Zcc
-- zbiornikNaMaterialyPedneLubGaz = Zmp
-- zbiornikNaMaterialySypkie = Zms

create type OT_RodzajZbiornikaTechnicznego as enum ('Osd', 'Zcc', 'Zmp', 'Zms');
-- create type OT_RodzajZbiornikaTechnicznego as enum ('osadnik', 'zbiornikNaCiecz', 'zbiornikNaMaterialyPedneLubGaz', 'zbiornikNaMaterialySypkie');

create table OT_BUZT(
    id serial primary key,
    rodzaj OT_RodzajZbiornikaTechnicznego not null
);