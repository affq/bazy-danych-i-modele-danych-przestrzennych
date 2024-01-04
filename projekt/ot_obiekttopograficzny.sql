create table BT_Identyfikator(
    id serial primary key,
    lokalnyId text not null,
    przestrzenNazw text not null,
    wersjaId text
    -- constraints?
);

-- dokladny = Dok
-- przyblizony = Prz
-- niepewny = Npw

create type OT_KatDokladnosci as enum ('Dok', 'Prz', 'Npw');
-- create type OT_KatDokladnosci as enum ('dokladny', 'przyblizony', 'niepewny');

-- bazaDanychGeodezyjnychGrawimetrycznych = GEOS
-- ewidencjaGruntowIBudynkow = EGiB
-- geodezyjnaEwidencjaSieciUzbrojeniaTerenu = GESUT
-- bazaDanychPanstwowegoRejestruGranic = PRG
-- panstwowyRejestrNazwGeograficznych = PRNG
-- ewidencjaMiejscowosciUlicAdresow = EMUiA
-- rejestrCenWartosciNieruchomosci = RCiWN
-- bazaDanychOgolnogeograficznych = BDO
-- ortofotomapa = Ort
-- mapaZasadnicza = Mz
-- mapaTopograficzna10k = Mtp10
-- mapaTopograficzna50k = Mtp50
-- vmapLevel2PierwszejEdycji = VMAPL2_v1
-- vmapLevel2DrugiejEdycji = VMAPL2_v2
-- bazaDanychTopograficznych = BDT
-- bazaDanychCLC = CORINE
-- centralnyRejestrFormOchronyPrzyrody = CRFOP
-- bankDanychDrogowych = BDD
-- bazaDanychWgInstrK1 BDOT500
-- krajowySystemObszarowChronionych = KSOCH
-- lesnaMapaNumeryczna = LMN
-- mapaPodzialuHydrograficznegoPolski = MPHP
-- bazyDanychPKP = PKP
-- rejestrZabytkow = RZAB
-- krajowyRejestrUrzedowyPodzialuTerytorialnegoKraju = TERYT
-- pomiarStereoskopowy = Str
-- pomiarTerenowy = Trn

create type OT_ZrodloDanych as enum ('GEOS', 'EGiB', 'GESUT', 'PRG', 'PRNG', 'EMUiA', 'RCiWN', 'BDO', 'Ort', 'Mz', 'Mtp10', 'Mtp50', 'VMAPL2_v1', 'VMAPL2_v2', 'BDT', 'CORINE', 'CRFOP', 'BDD', 'BDOT500', 'KSOCH', 'LMN', 'MPHP', 'PKP', 'RZAB', 'TERYT', 'Str', 'Trn');
-- create type OT_ZrodloDanych as enum ('bazaDanychGeodezyjnychGrawimetrycznych', 'ewidencjaGruntowIBudynkow', 'geodezyjnaEwidencjaSieciUzbrojeniaTerenu', 'bazaDanychPanstwowegoRejestruGranic', 'panstwowyRejestrNazwGeograficznych', 'ewidencjaMiejscowosciUlicAdresow', 'rejestrCenWartosciNieruchomosci', 'bazaDanychOgolnogeograficznych', 'ortofotomapa', 'mapaZasadnicza', 'mapaTopograficzna10k', 'mapaTopograficzna50k', 'vmapLevel2PierwszejEdycji', 'vmapLevel2DrugiejEdycji', 'bazaDanychTopograficznych', 'bazaDanychCLC', 'centralnyRejestrFormOchronyPrzyrody', 'bankDanychDrogowych', 'bazaDanychWgInstrK1', 'krajowySystemObszarowChronionych', 'lesnaMapaNumeryczna', 'mapaPodzialuHydrograficznegoPolski', 'bazyDanychPKP', 'rejestrZabytkow', 'krajowyRejestrUrzedowyPodzialuTerytorialnegoKraju', 'pomiarStereoskopowy', 'pomiarTerenowy');

-- srodekGeometryczny = SG
-- miejsceCharakterystyczne = MC
-- punktUmowny = PU
-- osGeometryczna = OG
-- osInterpolowana = OI
-- liniaUmowna = LU
-- sztucznyLacznik = SL
-- krawedz = KR
-- zarysPodstawy = ZP
-- zasiegUmowny = ZU
-- maksymalnyZasieg = MA
-- minimalnyZasieg = MI
-- sredniZasieg = SZ

create type OT_RodzajReprGeom as enum ('SG', 'MC', 'PU', 'OG', 'OI', 'LU', 'SL', 'KR', 'ZP', 'ZU', 'MA', 'MI', 'SZ');
-- create type OT_RodzajReprGeom as enum ('srodekGeometryczny', 'miejsceCharakterystyczne', 'punktUmowny', 'osGeometryczna', 'osInterpolowana', 'liniaUmowna', 'sztucznyLacznik', 'krawedz', 'zarysPodstawy', 'zasiegUmowny', 'maksymalnyZasieg', 'minimalnyZasieg', 'sredniZasieg');

create table OT_ObiektTopograficzny(
    id serial primary key,
    idIIP BT_Identyfikator not null,
    czyObiektBDOO boolean not null,
    x_kod text not null,
    x_katDoklGeom OT_KatDokladnosci not null,
    x_doklGeom float,
    x_zrodloDanychG OT_ZrodloDanych not null,
    x_zrodloDanychA OT_ZrodloDanych not null,
    x_rodzajReprGeom OT_RodzajReprGeom not null,
    x_uwagi text,
    -- x_uzytkownik Cl_ResponsibleParty not null,
    x_aktualnoscG date not null,
    x_aktualnoscA date not null,
    x_dataUtworzenia date not null,
    x_informDodatkowa text
);

create table OT_BudynkiBudowleIUrzadzenia(
);