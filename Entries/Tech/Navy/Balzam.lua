-----------------------------------------
--A faire : modèle de dégat / ajouter armement / travail de texture
--------------------------------------

-- Navire collecteur de renseignement Russe 

mount_vfs_model_path	(current_mod_path.."/Shapes/Navy")
mount_vfs_texture_path  (current_mod_path.."/Textures/Navy/balzam.zip")


GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape = "AGI_Balzam"
GT.visual.shape_dstr = ""

-- GT.animation_arguments.water_propeller = 65;

GT.life = 2100;
GT.mass = 4.1e+006
GT.max_velocity = 14.9189
GT.race_velocity = 14.9189
GT.economy_velocity = 10.2889
GT.economy_distance = 8.334e+006
GT.race_distance = 2.778e+006
GT.shipLength = 105.0
GT.Width = 15.5
GT.Height = 35
GT.Length = 105.0
GT.DeckLevel = 4.609
GT.X_nose = 48.50
GT.X_tail = -49.75
GT.Tail_Width = 4
GT.Gamma_max = 0.35
GT.Om = 0.59
GT.speedup = 0.269786
GT.R_min = 345.6
GT.distFindObstacles = 568.4

GT.airWeaponDist = 2000
GT.airFindDist = 12000

----------------------------------------------------------------------------------------------------------------------------
--------------  Damage Model 
---------------------------------------------------------------------------------------------------------------------------
-----------  Attenzione: gli argument devono essere unici.
GT.DM = {
----- Scafo.
	{ area_name = "Bounding_Box",		area_arg = 76,	area_life = 70, area_fire = { pos = {0, 0, 0}, size = 50}},
}


--Armement
GT.WS = {};
GT.WS.maxTargetDetectionRange = 12000; 
GT.WS.radar_type = 104
GT.WS.searchRadarMaxElevation = math.rad(40);

GT.radar1_period = 3.0;
GT.radar2_period = 2.0;
local ws;

-- manual optical station
ws = GT_t.inc_ws();
GT.WS[ws] = {};
GT.WS[ws].pos = {-7.0, 8.6, 0.0};
GT.WS[ws].board = 2;
GT.WS[ws].angles = {{math.rad(180), math.rad(-180), math.rad(-90), math.rad(90)}};
GT.WS[ws].omegaY = math.rad(120);
GT.WS[ws].omegaZ = math.rad(80);
GT.WS[ws].pidY = {p=130, i=0.1, d=20, inn = 50};
GT.WS[ws].pidZ = {p=100, i=0.1, d=12, inn = 50};
GT.WS[ws].LN = {
	[1] = {
		type = 103,
		reactionTime = 1,
		distanceMin = 10,
		distanceMax = 3000,
		min_trg_alt = -1,
		max_trg_alt = 1000,
		beamWidth = math.rad(90)
		}
}
local trackers_for_AK630 = {{{"self", ws-2}}, {{"self", ws-1}}, {{"self", ws}}};

--Tracker pour AK630

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.SS_t.VYMPEL_TRACKER[1]);
GT.WS[ws].pos = {-2.0, 16.0, 0.0};
GT.WS[ws].drawArgument1 = 4
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.SS_t.VYMPEL_TRACKER[2]);
GT.WS[ws].base = ws-1;
local vympel_trackers1 = {{{"self", ws-1}}, {{"self", ws}}};

--Tourelle AK630

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.AK630);
--GT.WS[ws].area = "Center_Tower_01";
GT.WS[ws].center = 'Center_Tower_01'
GT.WS[ws].drawArgument1 = 17
GT.WS[ws].drawArgument2 = 18
GT.WS[ws].angles = { {math.rad(90), math.rad(-90), math.rad(-12), math.rad(88)}};
GT.WS[ws].LN[1].depends_on_unit = trackers_for_AK630;
--GT.WS[ws].LN[1].depends_on_unit = vympel_trackers1;
--GT.WS[ws].LN[1].reactionTime = 1;
GT.WS[ws].LN[1].BR[1].connector_name = 'Point_Gun_01';
GT.WS[ws].LN[1].fireAnimationArgument = 119;

--Fumée
GT.exhaust = {
	[1] = { size = 0.45 , pos = { -7.11, 15.37, 0} },
	
}


--Nom et catégorie
GT.Name = "AGI Balzam"
GT.DisplayName = _("AGI Balzam")
GT.Rate = 700

GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR",},
                RADAR = {"molniya search radar"},
            };

GT.DetectionRange  = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton   ="no";
GT.mapclasskey = "P0091000067";
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,
					"Unarmed ships",
					"Light armed ships",
					"Corvettes",
				};
GT.Categories = {
					{name = "Ship"},
				};


add_surface_unit(GT)
GT.Countries = {"Russia"}