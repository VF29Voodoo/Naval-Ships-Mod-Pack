-------------------------------------
--(0)=rotation tourelle 76mm avant
--(1)=elevation en site canon de la tourelle de 76mm
--(11) radar de nav
--(4) radar 9LV200 (conduite canon)
--(13) rotation tourelle 40mm arrière
--(14)=elevation en site des canons de la tourelle de 40mm
-----------------------------------------
--A faire : modèle de dégat / ajouter armement / travail de texture
--------------------------------------


-- TNC-45 EAU Al Fateh

mount_vfs_model_path	(current_mod_path.."/Shapes/Navy")
mount_vfs_texture_path  (current_mod_path.."/Textures/Navy/tnc45.zip")


GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape = "tnc45"
GT.visual.shape_dstr = ""

-- GT.animation_arguments.water_propeller = 65;

GT.life = 900;
GT.mass = 260000
GT.max_velocity = 13.0
GT.race_velocity = 13.0
GT.economy_velocity = 7.20222
GT.economy_distance = 3.0558e+006
GT.race_distance = 740800
GT.shipLength = 44.8
GT.Width = 10.5
GT.Height = 7.5
GT.Length = 46
GT.DeckLevel = 3.5
GT.X_nose = 20.0
GT.X_tail = -23.00
GT.Tail_Width = 9
GT.Gamma_max = 0.35
GT.Om = 0.02
GT.speedup = 1.01899
GT.R_min = 112.2
GT.distFindObstacles = 218.3

GT.airWeaponDist = 2000
GT.airFindDist = 21000

--GT.Landing_Point = {-24.467, 3.191, 0.0};

-- weapon systems

GT.WS = {};
GT.WS.maxTargetDetectionRange = 120000;
GT.WS.radar_type = 102
GT.WS.searchRadarMaxElevation = math.rad(40);

GT.radar1_period = 3.0;
GT.radar2_period = 1.0;
local ws;

-----radar
local ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.SS_t.VYMPEL_TRACKER[1]);
GT.WS[ws].pos = {10.33, 7.21, 0.0};
GT.WS[ws].drawArgument1 = 4; --argument radar de tir
GT.WS[ws].LN[1].min_trg_alt = 4;
--GT.WS[ws].area = "RUBKA";
local radar_tracker = {{{"self", ws}}};

-------Canon avant
ws = GT_t.inc_ws();
GT.WS[ws] = {}
--GT.WS[ws].area = "TOWER_F";  ----a nommer
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_AK176)
GT.WS[ws].center = 'Center_Tower_01'
GT.WS[ws].drawArgument1 = 13 --argument rotation tourelle 1
GT.WS[ws].drawArgument2 = 14 --argument élévation tourelle 1
GT.WS[ws].LN[1].BR[1].connector_name = 'Point_Gun_01'   ----connecteur du bout de canon
--GT.WS[ws].LN[1].BR[1].recoilArgument = 117; --argument du recul du canon
--GT.WS[ws].LN[1].BR[1].recoilTime = 0.4; --temps de recul

----------------------------------------------------------------------------------------------------------------------------------------------------------
GT_t.LN_t.MM38 = {} -- MM38 Missile Launcher
GT_t.LN_t.MM38.type = 1
GT_t.LN_t.MM38.distanceMin = 7000
GT_t.LN_t.MM38.distanceMax = 40000
GT_t.LN_t.MM38.reactionTime = 8
GT_t.LN_t.MM38.launch_delay = 4;
GT_t.LN_t.MM38.max_number_of_missiles_channels = 2;
GT_t.LN_t.MM38.external_tracking_awacs = true
GT_t.LN_t.MM38.sensor = {}
set_recursive_metatable(GT_t.LN_t.MM38.sensor, GT_t.WSN_t[0])
GT_t.LN_t.MM38.PL = {}
GT_t.LN_t.MM38.PL[1] = {}
GT_t.LN_t.MM38.PL[1].type_ammunition = MM38_Exo.wsTypeOfWeapon
GT_t.LN_t.MM38.PL[1].reload_time = 1000000; -- never during the mission
GT_t.LN_t.MM38.PL[1].shot_delay = 4;
GT_t.LN_t.MM38.BR = { {pos = {0, 0, 0} } }

GT_t.WS_t.ship_MM38 = {}
GT_t.WS_t.ship_MM38.angles = {
					{math.rad(180), math.rad(-180), math.rad(-90), math.rad(90)},
					};
GT_t.WS_t.ship_MM38.moveable = false
GT_t.WS_t.ship_MM38.LN = {}
_LN_MM38 = add_launcher(GT_t.WS_t.ship_MM38, GT_t.LN_t.MM38);
_LN_MM38.show_external_missile = true;

-- RAMPES MM38 Droite
GT_t.WS_t.ship_MM38.angles = {
    {math.rad(40), math.rad(-140), math.rad(-10), math.rad(90)},
};
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_MM38 )
GT.WS[ws].center = 'MM38_CNT_01'
GT.WS[ws].LN[1].PL[1].ammo_capacity = 2;
GT.WS[ws].LN[1].BR = {
						{connector_name = 'MM38_CNT_01', recoilArgument = 177, recoilT0 = -0.5, recoilT1 = -2, recoilT2 = 2, recoilTime = 3.0,},
						{connector_name = 'MM38_CNT_02', recoilArgument = 178, recoilT0 = -0.5, recoilT1 = -2, recoilT2 = 2, recoilTime = 3.0,},
					}

-- RAMPES MM38 Gauche
GT_t.WS_t.ship_MM38.angles = {
    {math.rad(140), math.rad(-40), math.rad(-10), math.rad(90)},
};
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_MM38 )
GT.WS[ws].center = 'MM38_CNT_03'
GT.WS[ws].LN[1].PL[1].ammo_capacity = 2;
GT.WS[ws].LN[1].BR = {
						{connector_name = 'MM38_CNT_03', recoilArgument = 179, recoilT0 = -0.5, recoilT1 = -2, recoilT2 = 2, recoilTime = 3.0,},
						{connector_name = 'MM38_CNT_04', recoilArgument = 180, recoilT0 = -0.5, recoilT1 = -2, recoilT2 = 2, recoilTime = 3.0,},
					}
----------------------------------------------------------------------------------------------------------------------------------------------------------
GT.Name = "TNC-45"
GT.DisplayName = _("TNC-45")
GT.Rate = 700

GT.Sensors =	{  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR",},

				};

GT.DetectionRange  = 80000;
GT.ThreatRange = 2000;
GT.Singleton   ="no";
GT.mapclasskey = "P0091000067";
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,
					"Unarmed ships",
					"Light armed ships",
					"Corvettes",
				};
GT.Categories = {
					{name = "Ship"},
				}

add_surface_unit(GT)
GT.Countries = {"Saudi Arabia", "Kuwait", "Bahrain", "Iraq ", "United Arab Emirates", "China"}