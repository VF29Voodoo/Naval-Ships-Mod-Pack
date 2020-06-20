-------------------------------------
--(13)=rotation tourelle 100mm avant
--(14)=elevation en site canon de la tourelle de 100mm
--(2) radar de nav DRBV 51
--(4) DRBC 32(conduite canon)
--(17) rotation simbad
--(18) élévation simbad
--(19)=elevation en site des 12.7
--(20) rotation des 12.7
--(65) hélice
-- (177, 178, 179, 180) Porte des systèmes mer-mer 
-----------------------------------------
--A faire : modèle de dégat / ajouter armement / travail de texture
--------------------------------------


-- Aviso A-69

mount_vfs_model_path	(current_mod_path.."/Shapes/Navy")
mount_vfs_texture_path  (current_mod_path.."/Textures/Navy/A69.zip")
GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape = "A69"
GT.visual.shape_dstr = ""

GT.animation_arguments.water_propeller = 65;

GT.life = 1300
GT.mass = 3.65e+006
GT.max_velocity = 8.2
GT.race_velocity = 9
GT.economy_velocity = 7
GT.economy_distance = 8.5192e+006
GT.race_distance = 2.9632e+006
GT.shipLength = 80.0
GT.Width = 15.6
GT.Height = 24.0
GT.Length = 80.0
GT.DeckLevel = 9
GT.X_nose = 45
GT.X_tail = -34.8
GT.Tail_Width = 15
GT.Gamma_max = 0.35
GT.Om = 0.05
GT.speedup = 0.365728
GT.R_min = 247
GT.distFindObstacles = 300

GT.airWeaponDist = 7000 
GT.airFindDist = 120000 

--GT.Landing_Point = {-24.467, 3.191, 0.0};
-- exhaust System

GT.exhaust = 
{
	[1] = { size = 0.45 , pos = {2 , 12 , 0 } }, -- X Axis (forward and Back) - Height - Side to side
}

-- weapon systems

GT.WS = {};
GT.WS.maxTargetDetectionRange = 120000; 
GT.WS.radar_type = 102
GT.WS.searchRadarMaxElevation = math.rad(40);

GT.radar1_period = 3.0;
GT.radar2_period = 2.0;
local ws;

-----radar

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.SS_t.MK92_CAS_WS[1]);
GT.WS[ws].pos = {10.33, 7.21, 0.0};
GT.WS[ws].drawArgument1 = 4; --argument radar de tir 

-------Canon avant

ws = GT_t.inc_ws();
GT.WS[ws] = {}
--GT.WS[ws].area = 'NADSTROYKA';
GT.WS[ws].angles = {
					{math.rad(1), math.rad(-1), math.rad(-1), math.rad(1)},
					};
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].center = 'CENTER_TOWER_01'
GT.WS[ws].drawArgument1 = 13 --argument rotation tourelle 1
GT.WS[ws].drawArgument2 = 14 --argument élévation tourelle 1
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.automatic_gun_25mm);
__LN.BR[1].connector_name = 'POINT_GUN_01' ----connecteur du bout de canon
__LN.fireAnimationArgument = 120;

----MM40
----------------------------------------------------------------------------------------------------------------------------------------------------------
GT_t.LN_t.MM40 = {} -- MM40 Missile Launcher
GT_t.LN_t.MM40.type = 1
GT_t.LN_t.MM40.distanceMin = 7000
GT_t.LN_t.MM40.distanceMax = 40000
GT_t.LN_t.MM40.reactionTime = 8
GT_t.LN_t.MM40.launch_delay = 4;
GT_t.LN_t.MM40.max_number_of_missiles_channels = 2;
GT_t.LN_t.MM40.external_tracking_awacs = true
GT_t.LN_t.MM40.sensor = {}
set_recursive_metatable(GT_t.LN_t.MM40.sensor, GT_t.WSN_t[0])
GT_t.LN_t.MM40.PL = {}
GT_t.LN_t.MM40.PL[1] = {}
GT_t.LN_t.MM40.PL[1].type_ammunition = MM40_Exo.wsTypeOfWeapon
GT_t.LN_t.MM40.PL[1].reload_time = 1000000; -- never during the mission
GT_t.LN_t.MM40.PL[1].shot_delay = 4;
GT_t.LN_t.MM40.BR = { {pos = {0, 0, 0} } }

GT_t.WS_t.ship_MM40 = {}
GT_t.WS_t.ship_MM40.angles = {
					{math.rad(180), math.rad(-180), math.rad(-90), math.rad(90)},
					};
GT_t.WS_t.ship_MM40.moveable = false
GT_t.WS_t.ship_MM40.LN = {}
_LN_MM40 = add_launcher(GT_t.WS_t.ship_MM40, GT_t.LN_t.MM40);
_LN_MM40.show_external_missile = false;

-- RAMPES MM40 Droite
GT_t.WS_t.ship_MM40.angles = {
    {math.rad(40), math.rad(-140), math.rad(-10), math.rad(90)},
};
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_MM40 )
GT.WS[ws].center = 'MM40_CNT_01'
GT.WS[ws].LN[1].PL[1].ammo_capacity = 2;
GT.WS[ws].LN[1].BR = {
						{connector_name = 'MM40_CNT_01', recoilArgument = 177, recoilT0 = -0.5, recoilT1 = -2, recoilT2 = 2, recoilTime = 3.0,},
						{connector_name = 'MM40_CNT_02', recoilArgument = 178, recoilT0 = -0.5, recoilT1 = -2, recoilT2 = 2, recoilTime = 3.0,},
					}

-- RAMPES MM40 Gauche
GT_t.WS_t.ship_MM40.angles = {
    {math.rad(140), math.rad(-40), math.rad(-10), math.rad(90)},
};
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_MM40 )
GT.WS[ws].center = 'MM40_CNT_03'
GT.WS[ws].LN[1].PL[1].ammo_capacity = 2;
GT.WS[ws].LN[1].BR = {
						{connector_name = 'MM40_CNT_03', recoilArgument = 179, recoilT0 = -0.5, recoilT1 = -2, recoilT2 = 2, recoilTime = 3.0,},
						{connector_name = 'MM40_CNT_04', recoilArgument = 180, recoilT0 = -0.5, recoilT1 = -2, recoilT2 = 2, recoilTime = 3.0,},
					}
----------------------------------------------------------------------------------------------------------------------------------------------------------

-- mid machineguns
ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'KABINA';
GT.WS[ws].angles = {
					{math.rad(45), math.rad(-45), math.rad(-45), math.rad(45)},
					};
GT.WS[ws].reference_angle_Y = math.rad(90);
GT.WS[ws].center = 'CENTER_TOWER_07'
GT.WS[ws].drawArgument1 = 19
GT.WS[ws].drawArgument2 = 20
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_12_7_M2);
__LN.type = 10;
__LN.BR[1].connector_name = 'POINT_GUN_07'
__LN.fireAnimationArgument = 124;

ws = GT_t.inc_ws();
GT.WS[ws] = {}
GT.WS[ws].area = 'KABINA';
GT.WS[ws].angles = {
					{math.rad(-20), math.rad(-155), math.rad(-5), math.rad(70)},
					};
GT.WS[ws].reference_angle_Y = math.rad(-90);
GT.WS[ws].center = 'CENTER_TOWER_08'
GT.WS[ws].drawArgument1 = 21
GT.WS[ws].drawArgument2 = 22
__LN = add_launcher(GT.WS[ws], GT_t.LN_t.machinegun_12_7_M2);
__LN.type = 10;
__LN.BR[1].connector_name = 'POINT_GUN_08'
__LN.fireAnimationArgument = 125;

---------------------------------------------

----Mistral
GT_t.LN_t._new = {} -- igla invisilauncher
GT_t.LN_t._new.type = 4;
GT_t.LN_t._new.xc = -3.26;
GT_t.LN_t._new.distanceMin = 500;
GT_t.LN_t._new.distanceMax = 8000;
GT_t.LN_t._new.reactionTime = 1;
GT_t.LN_t._new.launch_delay = 10;
GT_t.LN_t._new.maxShootingSpeed = 1;
GT_t.LN_t._new.show_external_missile = true;
GT_t.LN_t._new.sensor = {};
set_recursive_metatable(GT_t.LN_t._new.sensor, GT_t.WSN_t[0]);
GT_t.LN_t._new.reflection_limit = 0.02;
GT_t.LN_t._new.ECM_K = -1
GT_t.LN_t._new.PL = {};
GT_t.LN_t._new.PL[1] = {};
GT_t.LN_t._new.PL[1].ammo_capacity = 32;
GT_t.LN_t._new.PL[1].type_ammunition={4,4,34,91};
GT_t.LN_t._new.PL[1].name_ammunition=_("9M39");
GT_t.LN_t._new.PL[1].reload_time = 2; -- 16sec
GT_t.LN_t._new.PL[1].shot_delay = 0.1;
GT_t.LN_t._new.BR = {
                    {pos = {-22,1,8}, drawArgument = 3},
                    
                };
				
GT_t.WS_t.ship_igla = {} -- igla n
GT_t.WS_t.ship_igla.angles = {
					{math.rad(180), math.rad(-180), math.rad(-0.5), math.rad(89.9)},
					};
GT_t.WS_t.ship_igla.angles_mech = GT_t.WS_t.ship_igla.angles;
GT_t.WS_t.ship_igla.omegaY = 1;
GT_t.WS_t.ship_igla.omegaZ = 1;
GT_t.WS_t.ship_igla.reference_angle_Z = 0;
GT_t.WS_t.ship_igla.reference_angle_Y = 0;
GT_t.WS_t.ship_igla.reloadAngleY = math.rad(180);
GT_t.WS_t.ship_igla.reloadAngleZ = math.rad(89.9);
GT.WS[ws].center = 'Simbad'
GT.WS[ws].drawArgument1 = 17
GT.WS[ws].drawArgument2 = 18
__LN = add_launcher(GT_t.WS_t.ship_igla, GT_t.LN_t._new);
__LN.ECM_K = -1
__LN.show_external_missile = true;
__LN.launch_delay = 6;
__LN.reactionTime = 2;
__LN.maxShootingSpeed = 1;
__LN.beamWidth = math.rad(1);
__LN.PL[1].ammo_capacity = 32;
__LN.PL[1].shot_delay = 6;

-------------------------------------------------

GT.Name = "Aviso A69"
GT.DisplayName = _("Aviso A69")
GT.Rate = 1460

GT.Sensors = { OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR",},
				RADAR = {
                    "Patriot str",
                    "perry search radar",
               }
            };

GT.DetectionRange  = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton   ="no";
GT.mapclasskey = "P0000000634";
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,
                    "Frigates",
					"RADAR_BAND1_FOR_ARM",
                    "DetectionByAWACS",
   				};
GT.Categories = {
					{name = "Armed Ship"}
				};
add_surface_unit(GT)

GT.Countries = {"France"; "Turkey"; "Argentina"}