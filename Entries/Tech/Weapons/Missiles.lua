-- Based on YJ83 from China Asset

dofile('Scripts/Database/Weapons/warheads.lua')

BarrelsReloadTypes = {
    ['ORDINARY']       = 1,
    ['SIMULTANEOUSLY'] = 2,
    ['SEQUENTIALY']    = 3
}

tail_solid  = { 1, 1, 1, 1 };
tail_liquid = { 0.9, 0.9, 0.9, 0.05 };

local ANTISHIP_MISSILE_TYPE = 11 -- 11: surface to surface; 8: air to surface

local MM38_WH =
{
    mass                 = 165, -- masse charge
    caliber              = 350, -- diamètre
    expl_mass            = 100,
    piercing_mass        = 0.0,
    other_factors        = { 1.0, 1.0, 1.0 },
    concrete_factors     = { 2.0, 1.0, 1.0 },
    concrete_obj_factor  = 2.0,
    obj_factors          = { 5.0, 1.0 },
    cumulative_factor    = 2.0,
    cumulative_thickness = 0.0,
}


local MM38_Exocet = 'MM38'
MM38_Exo = {
    category        = CAT_MISSILES,
    name            = MM38_Exocet,
    user_name       = _(MM38_Exocet),
    model           = 'MM38',
    mass            = 670,
    wsTypeOfWeapon  = {4,4,ANTISHIP_MISSILE_TYPE,WSTYPE_PLACEHOLDER},
    
    Escort       = 0,
    Head_Type    = 5,
    sigma        = {30, 30, 20},
    M            = 735,
    H_max        = 6000.0,
    H_min        = 50,
    Diam         = 343.0,
    Cx_pil       = 1,
    D_max        = 40000.0,
    D_min        = 7000.0,
    Head_Form    = 1,
    Life_Time    = 1850.0,
    Nr_max       = 6,
    v_min        = 100.0,
    v_mid        = 150.0,
    Mach_max     = 0.93,
    t_b          = 0.0,
    t_acc        = 5,
    t_marsh      = 1800.0,
    Range_max    = 40000.0,
    H_min_t      = 0.0,
    Fi_start     = 0.25,
    Fi_rak       = 3.14152,
    Fi_excort    = 0.35,
    Fi_search    = 99.9,
    OmViz_max    = 99.9,
    Stage        = 1,
    Engine_Type  = 5,
    exhaust1     = tail_solid,
    X_back       = -2.566,
    Y_back       = 0.0,
    Z_back       = 0.0,
    X_back_acc   = -2.6,
    Y_back_acc   = 0.0,
    Z_back_acc   = 0.0,
    Reflection   = 0.121,
    KillDistance = 0.0,
    
    warhead     = MM38_WH,
    warhead_air = MM38_WH,
    
    add_attributes = {"Anti-Ship missiles"},

    shape_table_data = {
        {
            name     = MM38_Exocet,
            file     = 'MM38',
            life     = 1.5,
            fire     = {0, 1},
            username = MM38_Exocet,
            index    = WSTYPE_PLACEHOLDER,
        },
    },
    
    
    class_name      = "wAmmunitionSelfHoming",
    scheme          = "anti_ship_missile_tb",

    fm = {
        mass            = 735,  
        caliber         = 0.35,  
        cx_coeff        = {1, 0.3, 0.65, 0.018, 1.6},
        L               = 5.145,
        I               = 1 / 12 * 670.0 * 5.145 * 5.145,
        Ma              = 0.6,
        Mw              = 1.116,
        wind_sigma      = 0.0,
        wind_time       = 1000.0,
        Sw              = 0.75,
        dCydA           = {0.07, 0.036},
        A               = 0.08,
        maxAoa          = 0.3,
        finsTau         = 0.05,
        Ma_x            = 3,
        Ma_z            = 3,
        Kw_x            = 0.05,
    },
    
    simple_seeker = {
        delay        = 1.0,
        FOV          = math.rad(45),
        stTime       = 0.5,
        opTime       = 9999,
    },
    
    autopilot =    --inertial autopilot + horiz correction when seeker is on
    {
        delay                      = 1,        -- time delay
        Kpv                        = 0.026,    -- vertical control PID
        Kdv                        = 3.2,
        Kiv                        = 0.00001,
        Kph                        = 500.0,        -- horiz control PID
        Kdh                        = 5.0,
        Kih                        = 0.0,
        glide_height               = 14.0,        -- cruise glide height
        use_current_height         = 0,        -- keep launch height
        max_vert_speed             = 25.0,        -- max vertical speed kept from launch height to glide height
        altim_vel_k                = 1.0,        -- proximity sensor correction by velocity coeff
        finsLimit                  = 0.68,        -- max signal value from autopilot to fins 
        inertial_km_error          = 0.05,        -- inertial guidance error coeff to 1 km flight distance
    },
    
    final_autopilot =        -- final stage guidance with terminal maneuver
    {
        delay                    = 0,
        K                        = 60,        -- autopilot P
        Ki                       = 0,        -- I
        Kg                       = 15,        -- D
        finsLimit                = 0.68,        
        useJumpByDefault         = 1,        -- 
        J_Power_K                = 2.0,        -- terminal maneuver params: P
        J_Diff_K                 = 0.8,        -- D
        J_Int_K                  = 0,        -- I
        J_Angle_K                = -0.175,        -- jump maneuver angle 0.68
        J_FinAngle_K             = -0.32,        -- jump inactivation trigger angle to target 0.32
        J_Angle_W                = -4.0,        -- max maneuver angle speed
        bang_bang                = 0,        -- use only -1, 1 values to control fins
        J_Trigger_Vert           = 1,        -- use global y axis
    },
    
    h_glide_on = {            -- turn on seeker and start horiz. correction if target is locked on
        delay                   = 1,
        trigger_dist            = 10000,
    },
    
    mode_switcher = {        -- use final maneuver if target is locked on
        delay           = 1,
        trigger_dist    = 4000,
    },
    
    self_destruct =         -- if seeker still can not find a target explode warhead
    {
        delay = 1,
        trigger_dist            = 1000,
        inactivation_dist       = 900,
    },
    
    controller = {
        boost_start = 0.0001,
        march_start = 0.01,
    },
    
    boost = {    
        impulse                             = 170,
        fuel_mass                           = 125,
        work_time                           = 6,
        boost_time                          = 0,
        boost_factor                        = 0,
        nozzle_position                     = {{-2.6, 0.0, 0.125},{-2.6, 0.0, -0.125}},
        nozzle_orientationXYZ               = {{-1, 0, 0}}, {{1, 0, 0}},
        tail_width                          = 0.6,
        smoke_color                         = {1, 1, 1},
        smoke_transparency                  = 0.9,
        custom_smoke_dissipation_factor     = 0.3,
    },
    
    booster_animation = {
        start_val = 0, -- start arg.1 value ( default value without animation)
    },

    play_booster_animation = {
        val = 0, -- 1/0
    },
    
    march = {
		impulse			= 660,
		fuel_mass		= 80,
		work_time		= 9999,
		min_fuel_rate	= 0.005,
		min_thrust		= 0,
		max_thrust		= 5000,
		thrust_Tau		= 0.0017,
    },
    
    engine_control = {
        default_speed   = 300,
        K               = 300,
        Kd              = 0.01,
        Ki              = 0.001,
        burst_signal    = 9999, -- used in 'anti_ship_missile_tb' scheme
    },
}

declare_weapon(MM38_Exo)

--MM40 Based on YJ83 from China Asset

dofile('Scripts/Database/Weapons/warheads.lua')

BarrelsReloadTypes = {
    ['ORDINARY']       = 1,
    ['SIMULTANEOUSLY'] = 2,
    ['SEQUENTIALY']    = 3
}

tail_solid  = { 1, 1, 1, 1 };
tail_liquid = { 0.9, 0.9, 0.9, 0.05 };

local ANTISHIP_MISSILE_TYPE = 11 -- 11: surface to surface; 8: air to surface

local MM40_WH =
{
    mass                 = 165, -- masse charge
    caliber              = 350, -- diamètre
    expl_mass            = 100,
    piercing_mass        = 0.0,
    other_factors        = { 1.0, 1.0, 1.0 },
    concrete_factors     = { 2.0, 1.0, 1.0 },
    concrete_obj_factor  = 2.0,
    obj_factors          = { 5.0, 1.0 },
    cumulative_factor    = 2.0,
    cumulative_thickness = 0.0,
}


local MM40_Exocet = 'MM40'
MM40_Exo = {
    category        = CAT_MISSILES,
    name            = MM40_Exocet,
    user_name       = _(MM40_Exocet),
    model           = 'MM40',
    mass            = 670,
    wsTypeOfWeapon  = {4,4,ANTISHIP_MISSILE_TYPE,WSTYPE_PLACEHOLDER},
    
    Escort       = 0,
    Head_Type    = 5,
    sigma        = {30, 30, 20},
    M            = 735,
    H_max        = 6000.0,
    H_min        = 50,
    Diam         = 343.0,
    Cx_pil       = 1,
    D_max        = 70000.0,
    D_min        = 7000.0,
    Head_Form    = 1,
    Life_Time    = 1850.0,
    Nr_max       = 6,
    v_min        = 100.0,
    v_mid        = 150.0,
    Mach_max     = 0.93,
    t_b          = 0.0,
    t_acc        = 5,
    t_marsh      = 1800.0,
    Range_max    = 70000.0,
    H_min_t      = 0.0,
    Fi_start     = 0.25,
    Fi_rak       = 3.14152,
    Fi_excort    = 0.35,
    Fi_search    = 99.9,
    OmViz_max    = 99.9,
    Stage        = 1,
    Engine_Type  = 5,
    exhaust1     = tail_solid,
    X_back       = -2.566,
    Y_back       = 0.0,
    Z_back       = 0.0,
    X_back_acc   = -2.6,
    Y_back_acc   = 0.0,
    Z_back_acc   = 0.0,
    Reflection   = 0.121,
    KillDistance = 0.0,
    
    warhead     = MM40_WH,
    warhead_air = MM40_WH,
    
    add_attributes = {"Anti-Ship missiles"},

    shape_table_data = {
        {
            name     = MM40_Exocet,
            file     = 'MM40',
            life     = 1.5,
            fire     = {0, 1},
            username = MM40_Exocet,
            index    = WSTYPE_PLACEHOLDER,
        },
    },
    
    
    class_name      = "wAmmunitionSelfHoming",
    scheme          = "anti_ship_missile_tb",

    fm = {
        mass            = 735,  
        caliber         = 0.35,  
        cx_coeff        = {1, 0.3, 0.65, 0.018, 1.6},
        L               = 5.145,
        I               = 1 / 12 * 670.0 * 5.145 * 5.145,
        Ma              = 0.6,
        Mw              = 1.116,
        wind_sigma      = 0.0,
        wind_time       = 1000.0,
        Sw              = 0.75,
        dCydA           = {0.07, 0.036},
        A               = 0.08,
        maxAoa          = 0.3,
        finsTau         = 0.05,
        Ma_x            = 3,
        Ma_z            = 3,
        Kw_x            = 0.05,
    },
    
    simple_seeker = {
        delay        = 1.0,
        FOV          = math.rad(45),
        stTime       = 0.5,
        opTime       = 9999,
    },
    
    autopilot =    --inertial autopilot + horiz correction when seeker is on
    {
        delay                      = 1,        -- time delay
        Kpv                        = 0.026,    -- vertical control PID
        Kdv                        = 3.2,
        Kiv                        = 0.00001,
        Kph                        = 500.0,        -- horiz control PID
        Kdh                        = 5.0,
        Kih                        = 0.0,
        glide_height               = 14.0,        -- cruise glide height
        use_current_height         = 0,        -- keep launch height
        max_vert_speed             = 25.0,        -- max vertical speed kept from launch height to glide height
        altim_vel_k                = 1.0,        -- proximity sensor correction by velocity coeff
        finsLimit                  = 0.68,        -- max signal value from autopilot to fins 
        inertial_km_error          = 0.05,        -- inertial guidance error coeff to 1 km flight distance
    },
    
    final_autopilot =        -- final stage guidance with terminal maneuver
    {
        delay                    = 0,
        K                        = 60,        -- autopilot P
        Ki                       = 0,        -- I
        Kg                       = 15,        -- D
        finsLimit                = 0.68,        
        useJumpByDefault         = 1,        -- 
        J_Power_K                = 2.0,        -- terminal maneuver params: P
        J_Diff_K                 = 0.8,        -- D
        J_Int_K                  = 0,        -- I
        J_Angle_K                = -0.175,        -- jump maneuver angle 0.68
        J_FinAngle_K             = -0.32,        -- jump inactivation trigger angle to target 0.32
        J_Angle_W                = -4.0,        -- max maneuver angle speed
        bang_bang                = 0,        -- use only -1, 1 values to control fins
        J_Trigger_Vert           = 1,        -- use global y axis
    },
    
    h_glide_on = {            -- turn on seeker and start horiz. correction if target is locked on
        delay                   = 1,
        trigger_dist            = 10000,
    },
    
    mode_switcher = {        -- use final maneuver if target is locked on
        delay           = 1,
        trigger_dist    = 4000,
    },
    
    self_destruct =         -- if seeker still can not find a target explode warhead
    {
        delay = 1,
        trigger_dist            = 1000,
        inactivation_dist       = 900,
    },
    
    controller = {
        boost_start = 0.0001,
        march_start = 0.01,
    },
    
    boost = {    
        impulse                             = 170,
        fuel_mass                           = 125,
        work_time                           = 6,
        boost_time                          = 0,
        boost_factor                        = 0,
        nozzle_position                     = {{-2.6, 0.0, 0.125},{-2.6, 0.0, -0.125}},
        nozzle_orientationXYZ               = {{-1, 0, 0}}, {{1, 0, 0}},
        tail_width                          = 0.6,
        smoke_color                         = {1, 1, 1},
        smoke_transparency                  = 0.9,
        custom_smoke_dissipation_factor     = 0.3,
    },
    
    booster_animation = {
        start_val = 0, -- start arg.1 value ( default value without animation)
    },

    play_booster_animation = {
        val = 0, -- 1/0
    },
    
    march = {
		impulse			= 660,
		fuel_mass		= 80,
		work_time		= 9999,
		min_fuel_rate	= 0.005,
		min_thrust		= 0,
		max_thrust		= 5000,
		thrust_Tau		= 0.0017,
    },
    
    engine_control = {
        default_speed   = 300,
        K               = 300,
        Kd              = 0.01,
        Ki              = 0.001,
        burst_signal    = 9999, -- used in 'anti_ship_missile_tb' scheme
    },
}

declare_weapon(MM40_Exo)