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