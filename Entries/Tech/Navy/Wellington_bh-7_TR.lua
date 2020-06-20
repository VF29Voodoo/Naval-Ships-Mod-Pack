----------------------------------------------------------------------------------------------------------------------------------
--LUA CODE BY SUNTSAG V1.0 14/04/20--
--Model arguments that need to be changed are as follows: RADAR needs Arg11 - PROPELLER needs Arg8--
--CA compatible - Max AI Speed on water = 6mph - If driven in CA speed on water is increased - Sim limitation cannot be improved--
----------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------
--A faire : ajouter armement / travail de texture 
--------------------------------------


-- Wellington bh-7 (150) 
mount_vfs_model_path	(current_mod_path.."/Shapes/Navy")
mount_vfs_texture_path  (current_mod_path.."/Textures/Navy/bh-7.zip")

GT_t.CH_t.BH7 = {
	life = 3,
	mass = 2838,
	length = 7.93,
	width = 14.4,
	max_road_velocity = 14,
	max_slope = 0.61,
	canSwim = true,
	waterline_level = 0.96,
	engine_power = 1800,
	max_vert_obstacle = 0.914,
	max_acceleration = 1.08497,
	min_turn_radius = 2.8,
	X_gear_1 = 1.603,
	Y_gear_1 = 0,
	Z_gear_1 = 1.386,
	X_gear_2 = -2.8,
	Y_gear_2 = 0,
	Z_gear_2 = 1.386,
	X_gear_1 = 1.526,
	Y_gear_1 = 0,
	Z_gear_1 = 1.087,
	X_gear_2 = -1.722,
	Y_gear_2 = 0,
	Z_gear_2 = 1.087,
	gear_type = GT_t.GEAR_TYPES.WHEELS,
	r_max = 0.46,
	armour_thickness = 0.022,
}

GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_wheel_IFV)
set_recursive_metatable(GT.chassis, GT_t.CH_t.BH7);

GT.visual = {}
GT.visual.shape = "wellington_bh-7_TR"
GT.visual.shape_dstr = "wellington_bh-7_TR"



GT.airWeaponDist = 7000 
GT.airFindDist = 4000 

--chassis
GT.swing_on_run = false;
GT.animation_arguments.locator_rotation = 11;
GT.snd.radarRotation = "RadarRotation";
GT.radar_rotation_period = 60/33; --33+-2 об/мин
GT.toggle_alarm_state_interval = 5.0;

GT.sensor = {};
GT.sensor.beamWidth = math.rad(90);
GT.sensor.max_range_finding_target = 30000;
GT.sensor.min_range_finding_target = 1500;
GT.sensor.max_alt_finding_target = 5000;
GT.sensor.min_alt_finding_target = 10;
GT.sensor.height = 5.438;

-- Turbine
GT.driverViewConnectorName = {"DRIVER_POINT", offset = {4.8, 5.85, -0.85}}
GT.driverCockpit = "DriverCockpit/DriverCockpitWithLLTV"
GT.animation_arguments.stoplights = 0;

---GT.turbine = true;
GT.turbine = false;

-- Sound
GT.sound = {};


-- Engine params
GT.sound.engine = {};
GT.sound.engine.idle = "GndTech/L2EngineIdle";
GT.sound.engine.max = "GndTech/L2EngineMax";

GT.sound.engine.acc_start = "GndTech/L2EngineAccStart";
GT.sound.engine.acc_end = "GndTech/L2EngineAccEnd";

GT.sound.engine.idle_formula_gain = "0.2 x * 1 +";
GT.sound.engine.idle_formula_pitch = "1.2436 x * 0.7564 +";

GT.sound.engine.max_formula_gain = "0.75 x * 0.25 +";
GT.sound.engine.max_formula_pitch = "0.4363 x * 0.5637 +";


-- Move params
GT.sound.move = {};
GT.sound.move.sound = "GndTech/TankMove";
GT.sound.move.pitch = {{0.0, 0.6}, {10.0, 1.2}};
GT.sound.move.gain = {{0.0, 0.01}, {0.5, 0.5}, {12.0, 1.0}};
GT.sound.move.start_move = "GndTech/TStartMove";
GT.sound.move.end_move = "GndTech/TEndMove";
-- Move params


GT.sound.noise = {};
GT.sound.noise.sound = "Damage/VehHit";


-- Physics
GT.physics = {};

-- Brake system
GT.physics.brake = {};
GT.physics.brake.delta = 0.15;
-- Brake system

GT.WS = {}
GT.WS.maxTargetDetectionRange = 8000;
GT.WS.radar_type = 109 --optical in wstypes
GT.WS.searchRadarMaxElevation = math.rad(70);

GT.Name = "BH-7 Transport"
GT.DisplayName = _("Wellington BH-7 Transport")
GT.Rate = 1460

-- GT.Sensors = { OPTIC = {"long-range naval optics"},
            -- };
			
GT.Sensors = { OPTIC = {"TKN-3B day", "TKN-3B night", -- командирский
                        "Karat visir"
                        },
			   RADAR = GT.Name
             }			

GT.DetectionRange  = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton   ="no";
GT.mapclasskey = "P0091000002";
GT.attribute = {wsType_Ground,wsType_Tank,wsType_Gun,wsType_Hummer,
                "APC",
                "Datalink",
        };
GT.category = "Armor";


--------------------------------------------------------
add_surface_unit(GT)