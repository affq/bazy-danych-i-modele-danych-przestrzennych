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

