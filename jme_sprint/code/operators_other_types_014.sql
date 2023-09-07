--010 who owns which plants and assess the footprint of turbine OWNERS
select t.eia_id eia, t.p_tnum, t.p_name project_name, t.p_year project_year, op.plant_name, op.plant_id, op.operator_name, op.operator_id, t.t_manu turbine_manu, t.t_model turbine_model, t.ylat latitude, t.xlong longitude
from wind_turbine_20220114 t
left join eia923_operators op on t.eia_id = op.plant_id
where operator_id ilike '15399';