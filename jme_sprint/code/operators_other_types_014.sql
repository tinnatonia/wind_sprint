--014 who operates the wind turbines in the USA, and whether they operate other types of power plants, to assess potential takeover targets

	
select plant_id, plant_name, operator_name, operator_id, plant_state, aer_fuel_type_code, (net_generation_megawatthours/1000) net_gen_mwh
from eia923_operators
where operator_id in(select distinct operator_id
	from(
	select t.eia_id, op.operator_id
	from wind_turbine_20220114 t
	left join eia923_operators op
		on t.eia_id = op.plant_id) t1)