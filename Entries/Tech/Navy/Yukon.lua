-----------------------------------------
--A faire : travail de texture
--------------------------------------


-- Axiliaire US 

mount_vfs_model_path	(current_mod_path.."/Shapes/Navy")
mount_vfs_texture_path  (current_mod_path.."/Textures/Navy/yukon.zip")


GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape = "USS_Yukon"
GT.visual.shape_dstr = ""

-- GT.animation_arguments.water_propeller = 65;

GT.life = 180;
GT.mass = 420000
GT.max_velocity = 36.4333
GT.race_velocity = 15.4333
GT.economy_velocity = 12.2889
GT.economy_distance = 11112e+007
GT.race_distance = 2778e+006
GT.shipLength = 204.0
GT.Width = 31.0
GT.Height = 45
GT.Length = 204.0
GT.DeckLevel = 4.609
GT.X_nose = 101.08
GT.X_tail = -100.00
GT.Tail_Width = 4
GT.Gamma_max = 0.35
GT.Om = 0.59
GT.speedup = 0.41779
GT.R_min = 345.6
GT.distFindObstacles = 568.4

GT.TACAN		   = true;		
GT.TACAN_position = {-7.006,  43.155,  -14.1}	

GT.numParking = 1
GT.Helicopter_Num_ = 2

GT.airWeaponDist = 0
GT.airFindDist = 20

GT.Landing_Point = {-85, 9, 0};

GT.exhaust = {
	[1] = { size = 0.65 , pos = { -53.26, 38.28, 0} },
	
}

GT.DM = {
		{ area_name = "OSTROV",			area_arg = 80,	area_life = 10, area_fire = { pos = {2.0, 2.0, 0.0}, size = 1.5}},  ---- modele degat superstructure
		{ area_name = "BORT",			area_arg = 70,	area_life = 5, area_fire = { pos = {6.0, 2.0, 1.0}, size = 0.8}},   ---- modele degat coque
		{ area_name = "PALUBA", 		area_arg = 73,	area_life = 5, area_fire = { pos = {6.0, 4.0, -5.0}, size = 0.8}},  ---- modele degat plateforme HLO
}

GT.Name = "USS Yukon"
GT.DisplayName = _("USS Yukon")
GT.Rate = 700

GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR",},
               
            };

GT.DetectionRange  = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton   ="no";
GT.mapclasskey = "P0091000067";
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,
					"low_reflection_vessel",
                    "Unarmed ships",
					"Corvettes",
				};
GT.Categories = {
					{name = "HelicopterCarrier"},
					{name = "Ship"},
									};


add_surface_unit(GT)
GT.Countries = {"USA"}