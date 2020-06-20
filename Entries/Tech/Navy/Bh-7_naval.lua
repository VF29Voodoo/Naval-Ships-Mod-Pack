----------------------------------------------------------------------------------------------------------------------------------
--LUA CODE BY SUNTSAG V1.0 14/04/20--
--Model arguments that need to be changed are as follows: RADAR needs Arg11 - PROPELLER needs Arg8--
--CA compatible - Max AI Speed on water = 6mph - If driven in CA speed on water is increased - Sim limitation cannot be improved--
----------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------
--A faire : modèle de dégat / ajouter armement / travail de texture / version navale
--------------------------------------


-- Wellington bh-7 (150) 
mount_vfs_model_path	(current_mod_path.."/Shapes/Navy")
mount_vfs_texture_path  (current_mod_path.."/Textures/Navy/bh-7.zip")
GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape = "wellington_bh-7_naval"
GT.visual.shape_dstr = "wellington_bh-7_naval"

GT.animation_arguments.water_propeller = 65;

GT.life = 800
GT.mass = 3.65e+006
GT.max_velocity = 65
GT.race_velocity = 60
GT.economy_velocity = 7
GT.economy_distance = 8.5192e+006
GT.race_distance = 2.9632e+006
GT.shipLength = 25.2
GT.Width = 14.4
GT.Height = 11.6
GT.Length = 25.2
GT.DeckLevel = 9
GT.X_nose = 12
GT.X_tail = -12
GT.Tail_Width = 12
GT.Gamma_max = 0.35
GT.Om = 0.05
GT.speedup = 0.365728
GT.R_min = 247
GT.distFindObstacles = 300

GT.airWeaponDist = 7000 
GT.airFindDist = 4000 

-- Brake system

GT.WS = {}
GT.WS.maxTargetDetectionRange = 8000;
GT.WS.radar_type = 109 --optical in wstypes
GT.WS.searchRadarMaxElevation = math.rad(70);

GT.radar1_period = 3.0;
GT.radar2_period = 1.0;
local ws;

----YJ83
----Rampe 1

GT_t.WS_t.ship_HARPOON = {}
GT_t.WS_t.ship_HARPOON.angles = {
					{math.rad(90), math.rad(-90), math.rad(-130), math.rad(50)},
					};
GT_t.WS_t.ship_HARPOON.reference_angle_Z = math.rad(50)
GT_t.WS_t.ship_HARPOON.moveable = false
GT_t.WS_t.ship_HARPOON.LN = {}
add_launcher(GT_t.WS_t.ship_HARPOON, GT_t.LN_t.HARPOON);

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_HARPOON )
--GT.WS[ws].area = 'KORMA_TOP';
GT.WS[ws].pos = {-83.594,7.002,-4.54} ------position centrale du lanceur
GT.WS[ws].angles[1][1] = math.rad(50);
GT.WS[ws].angles[1][2] = math.rad(-50);
GT.WS[ws].LN[1].beamWidth = math.rad(90);
GT.WS[ws].LN[1].PL[1].ammo_capacity = 1;
GT.WS[ws].animation_alarm_state = {time = 1.5, arg = 4} ----argument de l'ouverture de la porte du silo
GT.WS[ws].LN[1].BR = {
                        {
                            connector_name = 'Point_ROCKET_01',  -----connecteur de la porte du silo
                            drawArgument = 302,  ----argument du missile qui apparait dans le silo
                        },
                    }


GT.Name = "BH-7 Naval"
GT.DisplayName = _("Wellington BH-7 Naval")
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
GT.mapclasskey = "P0000000634";
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,
                    "Frigates",
   				};
GT.Categories = {
					{name = "Armed Ship"}
				};
--------------------------------------------------------
add_surface_unit(GT)
GT.Countries = {"Iran"}