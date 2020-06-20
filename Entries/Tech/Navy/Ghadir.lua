-----------------------------------------
--A faire : modèle de dégat / supprimer la vague en plongée / tester les profondeurs mini de plongée
--------------------------------------

-- Submarine Ghadir (SSC Yono Submarine) v1.2

mount_vfs_model_path	(current_mod_path.."/Shapes/Navy")
mount_vfs_texture_path  (current_mod_path.."/Textures/Navy/ghadir.zip")

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape = "Ghadir.EDM"
GT.visual.shape_dstr = ""

--GT.animation_arguments.water_propeller = 65;

GT.life = 300
GT.mass = 3.076e+006
GT.max_velocity = 8.74556
GT.race_velocity = 5.14444
GT.economy_velocity = 3.60111
GT.economy_distance = 1.1112e+007
GT.race_distance = 740800
GT.shipLength = 29.0 -- above the water part
GT.Width = 3.0 -- above the water part
GT.Height = 7.46 -- above the water part
GT.Length = 29.0 -- above the water part
GT.DeckLevel = 0
GT.baseSubmersion = 0;
GT.X_nose = 14.4
GT.X_tail = -14.5
GT.Tail_Width = 7.3
GT.Gamma_max = 0.35
GT.Om = 0.02
GT.speedup = 0.203634
GT.R_min = 125.2
GT.distFindObstacles = 237.8

GT.minPeriscopeDepth = 5.0;
GT.maxPeriscopeDepth = 10.0;

GT.animation_arguments = {
	radar1_rotation = -1,
	radar2_rotation = -1,
	radar3_rotation = -1,
	flag_animation = -1,
	water_propeller  = 65,
    locator_rotation = 1,
	periscope = 32
}

--[[
GT.animation_arguments.alarm_state     = 3;
GT.animation_arguments.water_propeller = 65;
]]
GT.propeller_omega_max                 = 120.0

-- times
local start_diving_  = 1;
local stop_diving_   = 3;
local start_rising_  = stop_diving_;
local stop_rising_   = 5;

local totalDuration_ = stop_rising_;

GT.toggle_alarm_state_interval = totalDuration_

GT.animation_arguments.alarm_state_sequence =
{
    totalDuration = totalDuration_,
    { 3, {{startTime=0.0, endTime = start_diving_, startVal = 0.0, endVal = 0.0},
          {startTime=start_diving_, endTime = stop_diving_, startVal = 0.0, endVal = 1.0},
          {startTime=start_rising_, endTime = totalDuration_, startVal = 1.0, endVal = 1.0}}
    },
    -- periscope etc
    {16, {{startTime=0.0, endTime = start_rising_, startVal = 0.0, endVal = 0.0},
          {startTime=start_rising_, endTime = stop_rising_, startVal = 0.0, endVal = 1.0},
          {startTime=stop_rising_, endTime = totalDuration_, startVal = 1.0, endVal = 1.0}}
    },
    {14, {{startTime=0.0, endTime = start_diving_, startVal = 1.0, endVal = 1.0},
          {startTime=start_diving_, endTime = stop_diving_/3.0, startVal = 1.0, endVal = 0.0},
          {startTime=stop_diving_/3.0, endTime = totalDuration_, startVal = 0.0, endVal = 0.0}}
    },
    {15, {{startTime=0.0, endTime = start_diving_, startVal = 1.0, endVal = 1.0},
          {startTime=start_diving_, endTime = stop_diving_/3.0, startVal = 1.0, endVal = 0.0},
          {startTime=stop_diving_/3.0, endTime = totalDuration_, startVal = 0.0, endVal = 0.0}}
    },
    {17, {{startTime=0.0, endTime = start_diving_, startVal = 1.0, endVal = 1.0},
          {startTime=start_diving_, endTime = stop_diving_/3.0, startVal = 1.0, endVal = 0.0},
          {startTime=stop_diving_/3.0, endTime = totalDuration_, startVal = 0.0, endVal = 0.0}}
    },
    {18, {{startTime=0.0, endTime = start_diving_, startVal = 0.0, endVal = 0.0},
          {startTime=start_diving_, endTime = stop_diving_/3.0, startVal = 0.0, endVal = 1.0},
          {startTime=stop_diving_/3.0, endTime = totalDuration_, startVal = 1.0, endVal = 1.0}}
    },
    --[[
    {14, {{startTime=0.0, endTime = start_rising_, startVal = 0.0, endVal = 0.0},
          {startTime=start_rising_, endTime = stop_rising_, startVal = 0.0, endVal = 1.0},
          {startTime=stop_rising_, endTime = totalDuration_, startVal = 1.0, endVal = 1.0}}
    },
    {15, {{startTime=0.0, endTime = start_rising_, startVal = 0.0, endVal = 0.0},
          {startTime=start_rising_, endTime = stop_rising_, startVal = 0.0, endVal = 1.0},
          {startTime=stop_rising_, endTime = totalDuration_, startVal = 1.0, endVal = 1.0}}
    },
    {17, {{startTime=0.0, endTime = start_rising_, startVal = 0.0, endVal = 0.0},
          {startTime=start_rising_, endTime = stop_rising_, startVal = 0.0, endVal = 1.0},
          {startTime=stop_rising_, endTime = totalDuration_, startVal = 1.0, endVal = 1.0}}
    },
    ]]
}
-- {depth, fx_dx, fx_len, fx_width)
--fx_dx - distance from stern to stern fx position
--fx_len - distance from bow to stern fx
GT.sternEffectDX = {{2.5, 19, 10, 1.0}, {6.0, 18, 1.0, 1.0}}

GT.DM = {
    { area_name = "BODY_FRONT", area_arg = 71, area_life = 80, area_fire = { pos = { -7.379, 2.46, 0}, size = 0.8}},
    { area_name = "BODY_TOP",   area_arg = 70, area_life = 80, area_fire = { pos = { 18.327, 7.4, 0}, size = 0.8}},
    -- { area_name = "BODY_BACK",  area_arg = -1, area_life = 80, area_fire = { pos = {-20, 5.0, 0}, size = 0.8}},
}

GT.airWeaponDist = 0
GT.airFindDist = 0
-- weapon systems

GT.Name = "SSC Yono"
GT.DisplayName = _("SSC Yono")
GT.Rate = 1200

GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV"},
            };

GT.DetectionRange  = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton   ="no";
GT.mapclasskey = "P0091000038";
GT.attribute = {wsType_Navy,wsType_Ship,wsType_Submarine,KILO,
				"Submarines",
				};
				
--------------------------------------------------------
add_surface_unit(GT)
GT.Countries = {"Iran"; "North Korea"}