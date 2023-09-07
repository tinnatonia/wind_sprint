--010 who owns which plants and assess the footprint of turbine OWNERS
select count(distinct t1.operator_name)
from(select t.eia_id eia, t.p_tnum, t.p_name project_name, t.p_year project_year, op.plant_name, op.plant_id, op.operator_name, op.operator_id, t.t_manu turbine_manu, t.t_model turbine_model, op.net_generation_megawatthours, t.ylat latitude, t.xlong longitude
from wind_turbine_20220114 t
left join eia923_operators op on t.eia_id = op.plant_id) t1;

--010 wind energy generation per owner
--operator_id, 
select turb.eia_id eia, op.operator_name, sum(op.net_generation_megawatthours) net_gen_mwh
from eia923_operators op
	inner join wind_turbine_20220114 turb
	on turb.eia_id = op.plant_id
group by 1, 2
order by 3 desc;


select distinct(t.eia_id), op.operator_name, (op.net_generation_megawatthours/1000) net_gen_kwh
from wind_turbine_20220114 t
join eia923_operators op
	on t.eia_id = op.plant_id
order by operator_name desc;
