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
GT.visual.shape = "wellington_bh-7_naval_TR"
GT.visual.shape_dstr = "wellington_bh-7_naval_TR"

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

GT.Name = "BH-7 Naval Transport"
GT.DisplayName = _("Wellington BH-7 Naval Transport")
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