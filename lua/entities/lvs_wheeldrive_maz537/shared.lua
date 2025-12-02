ENT.Base = "lvs_wheeldrive_truckbase"

ENT.PrintName = "MAZ-537"
ENT.Author = ""
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Trucks - Pack"

ENT.VehicleCategory = "Rig"
ENT.VehicleSubCategory = "Trucks"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/thegordonbeeman/vehicles/maz-537.mdl"

ENT.MaxVelocity = 500
ENT.MaxVelocityReverse = 100

ENT.PhysicsWeightScale = 5
ENT.PhysicsDampingSpeed = 50
ENT.PhysicsDampingForward = true
ENT.PhysicsDampingReverse = true

ENT.SteerAssistDeadZoneAngle = 10
ENT.SteerAssistMaxAngle = 0
ENT.SteerAssistExponent = 1
ENT.SteerAssistMultiplier = 0

ENT.EngineCurve = 0.8
ENT.EngineCurveBoostLow = 5
ENT.EngineTorque = 120

ENT.EngineIdleRPM = 500
ENT.EngineMaxRPM = 3250

ENT.ThrottleRate = 0.3
ENT.BrakeRate = 0.5

ENT.EngineIgnitionTime = 1.7
ENT.EngineStartStopVolume = 1.0
ENT.EngineStartSound = "lvs/vehicles/maz/maz_start.ogg"
ENT.EngineStopSound = "lvs/vehicles/maz/maz_stop.ogg"

ENT.TransGears = 4
ENT.TransGearsReverse = 1
ENT.TransShiftSpeed = 1.0
ENT.TransShiftTorqueFactor = 0.7
ENT.TransMinGearHoldTime = 1

ENT.SteerSpeed = 1.0
ENT.SteerReturnSpeed = 1.0

ENT.WheelBrakeLockupRPM = 3
ENT.WheelBrakeApplySound = "LVS.Brake.Apply"
ENT.WheelBrakeReleaseSound = "LVS.Brake.Release"

ENT.PhysicsInertia = Vector(1500,1500,1500)

ENT.WheelPhysicsMass = 100
ENT.WheelPhysicsInertia = Vector(14,14,14)
ENT.WheelPhysicsTireHeight = 16

ENT.WheelBrakeForce = 700

ENT.WheelSideForce = 800
ENT.WheelDownForce = 2500

ENT.TurboBlowOff = "common/null.wav"
ENT.TurboSound = "lvs/vehicles/mzkt/mzkt_trans.wav"
ENT.TurboVolume = 1.0

ENT.HornSound = "lvs/horn3.wav"
ENT.HornPos = Vector(150,0,35)

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/maz/maz_idle.wav",
		Volume = 1.0,
		Pitch = 80,
		PitchMul = 30,
		SoundLevel = 80,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/maz/maz_trans.wav",
		Volume = 1.0,
		Pitch = 60,
		PitchMul = 30,
		SoundLevel = 80,
		SoundType = LVS.SOUNDTYPE_NONE,
	},
	{
		sound = "lvs/vehicles/maz/maz_high.wav",
		Volume = 1.0,
		Pitch = 60,
		PitchMul = 50,
		SoundLevel = 80,
		SoundType = LVS.SOUNDTYPE_REV_UP,
	},
	{
		sound = "lvs/vehicles/maz/maz_low.wav",
		Volume = 1.0,
		Pitch = 60,
		PitchMul = 50,
		SoundLevel = 80,
		SoundType = LVS.SOUNDTYPE_REV_DOWN,
	},
}

ENT.ExhaustPositions = {
	{
		effect = "lvs_truck_exhaust",
		pos = Vector( 2.331, 1.347, 1.582) * 40,
		ang = Angle( 0, 90),
	},
	{
		effect = "lvs_truck_exhaust",
		pos = Vector( 2.331,-1.347, 1.582) * 40,
		ang = Angle( 0, -90),
	},
}

-- ENT.SirenPos = Vector()
-- ENT.SirenSound = {
-- 	[1] = {
-- 		-- siren = "lvs/siren1.wav",
-- 		-- horn = "lvs/siren3.wav",
-- 	},
-- }

ENT.Lights = {
	{
		Trigger = "main",
		ProjectedTextures = {
			{
				pos = Vector( 4.709, 0.792, 1.758) * 40, ang = Angle(),
				colorB = 200, colorA = 100,
				shadows = true,
			},
			{
				pos = Vector( 4.709,-0.792, 1.758) * 40, ang = Angle(),
				colorB = 200, colorA = 100,
				shadows = true,
			},
		},
	},
	{
		Trigger = "high",
		ProjectedTextures = {
			{
				pos = Vector( 4.709, 0.792, 1.758) * 40, ang = Angle(),
				colorB = 200, colorA = 100,
				shadows = true,
			},
			{
				pos = Vector( 4.709,-0.792, 1.758) * 40, ang = Angle(),
				colorB = 200, colorA = 100,
				shadows = true,
			},
		},
	},
	{
		Trigger = "main+high",
		SubMaterialID = "models/thegordonbeeman/vehicles/maz-537/light#main+high",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector( 4.709, 0.792, 1.758) * 40,
				colorB = 200, colorA = 100,
			},
			{	pos = Vector( 4.709,-0.792, 1.758) * 40,
				colorB = 200, colorA = 100,
			},
		},
	},
	{
		Trigger = "active",
		SubMaterialID = "models/thegordonbeeman/vehicles/maz-537/light#active",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector( 4.740, 1.075, 1.755) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 30, height = 30,
			},
			{	pos = Vector( 4.740,-1.075, 1.755) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 30, height = 30,
			},
		},
	},
	{
		Trigger = "main+brake",
		SubMaterialID = "models/thegordonbeeman/vehicles/maz-537/light#main+brake",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector(-3.619, 0.664, 1.266) * 40,
				colorG = 50, colorB = 50, colorA = 30,
				width = 30, height = 30,
			},
			{	pos = Vector(-3.619,-0.664, 1.266) * 40,
				colorG = 50, colorB = 50, colorA = 30,
				width = 30, height = 30,
			},
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = "models/thegordonbeeman/vehicles/maz-537/light#turnleft",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector(-3.596, 0.826, 1.266) * 40,
				colorG = 150, colorB = 0, colorA = 50,
				width = 30, height = 30,
			},
			{	pos = Vector( 3.368, 1.383, 1.734) * 40,
				colorG = 150, colorB = 0, colorA = 50,
				width = 30, height = 30,
			},
		},
	},
	{
		Trigger = "turnright",
		SubMaterialID = "models/thegordonbeeman/vehicles/maz-537/light#turnright",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector(-3.596,-0.826, 1.266) * 40,
				colorG = 150, colorB = 0, colorA = 50,
				width = 30, height = 30,
			},
			{	pos = Vector( 3.368,-1.383, 1.734) * 40,
				colorG = 150, colorB = 0, colorA = 50,
				width = 30, height = 25,
			},
		},
	},
	-- {
	-- 	Trigger = "reverse",
	-- 	SubMaterialID = "models/thegordonbeeman/vehicles/maz-537/light#reverse",
	-- 	SubMaterialBrightness = 0.5,
	-- 	Sprites = {
	-- 		{	pos = Vector(-4.696, 0.755, 1.200) * 40,
	-- 			colorA = 100,
	-- 			width = 30, height = 30,
	-- 		},
	-- 		{	pos = Vector( 0.064,-0.721, 2.324) * 40,
	-- 			colorA = 100,
	-- 			width = 35, height = 35,
	-- 		},
	-- 	},
	-- },
	-- {
	-- 	Siren = true,
	-- 	Trigger = "1",
	-- 	SubMaterialID = "models/thegordonbeeman/vehicles/maz-537/light#siren",
	-- 	SubMaterialBrightness = 0.5,
	-- 	Sprites = {
	-- 		{	pos = "light_att1",
	-- 			colorG = 90, colorB = 50, colorA = 50,
	-- 			width = 50, height = 50,
    --             bodygroup = { name = "Light", active = { 1 } },
	-- 		},
	-- 		{	pos = "light_att1",
	-- 			colorG = 90, colorB = 80, colorA = 255,
	-- 			width = 15, height = 15,
    --             bodygroup = { name = "Light", active = { 1 } },
	-- 		},
            
	-- 		{	pos = "light_att2",
	-- 			colorG = 90, colorB = 50, colorA = 50,
	-- 			width = 50, height = 50,
    --             bodygroup = { name = "Light", active = { 2 } },
	-- 		},
	-- 		{	pos = "light_att2",
	-- 			colorG = 90, colorB = 80, colorA = 255,
	-- 			width = 15, height = 15,
    --             bodygroup = { name = "Light", active = { 2 } },
	-- 		},
            
	-- 		{	pos = "light_att3",
	-- 			colorG = 90, colorB = 50, colorA = 50,
	-- 			width = 50, height = 50,
    --             bodygroup = { name = "Light", active = { 2 } },
	-- 		},
	-- 		{	pos = "light_att3",
	-- 			colorG = 90, colorB = 80, colorA = 255,
	-- 			width = 15, height = 15,
    --             bodygroup = { name = "Light", active = { 2 } },
	-- 		},
	-- 	},
	-- },
}

-- ENT.RandomColor = {
--     {
--         Color = Color( 255, 255, 255),
--         BodyGroups = {
--             [ 2 ] = 0,
--             [ 3 ] = 0,
--         },
--     },
--     {
--         Color = Color( 79, 82, 62),
--         BodyGroups = {
--             [ 2 ] = 1,
--             [ 3 ] = 0,
--         },
--     },
--     {
--         Color = Color( 255, 255, 255),
--         BodyGroups = {
--             [ 2 ] = 0,
--             [ 3 ] = 1,
--         },
--     },
--     {
--         Color = Color( 79, 82, 62),
--         BodyGroups = {
--             [ 2 ] = 1,
--             [ 3 ] = 1,
--         },
--     },
--     {
--         Color = Color( 255, 255, 255),
--         BodyGroups = {
--             [ 2 ] = 0,
--             [ 3 ] = 2,
--         },
--     },
--     {
--         Color = Color( 79, 82, 62),
--         BodyGroups = {
--             [ 2 ] = 1,
--             [ 3 ] = 2,
--         },
--     },
-- }