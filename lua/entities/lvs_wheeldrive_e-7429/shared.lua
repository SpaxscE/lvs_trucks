ENT.Base = "lvs_wheeldrive_truckbase"

ENT.PrintName = "E-7429"
ENT.Author = ""
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Trucks - Pack"

ENT.VehicleCategory = "Rig"
ENT.VehicleSubCategory = "Trucks"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/thegordonbeeman/vehicles/e-7429.mdl"

ENT.MaxVelocity = 500
ENT.MaxVelocityReverse = 100

ENT.PhysicsWeightScale = 2.0

ENT.EngineCurve = 1
ENT.EngineCurveBoostLow = 5.0
ENT.EngineTorque = 50

ENT.EngineIdleRPM = 500
ENT.EngineMaxRPM = 3250

ENT.ThrottleRate = 0.3
ENT.BrakeRate = 0.5

-- ENT.EngineIgnitionTime = 0.8
-- ENT.EngineStartStopVolume = 0.5
-- ENT.EngineStartSound = "lmx/vehicles/m2_halftrack/start.wav"
-- ENT.EngineStopSound = "lmx/vehicles/m2_halftrack/stop.wav"

ENT.TransGears = 4
ENT.TransGearsReverse = 1
ENT.TransShiftSpeed = 1.0
ENT.TransShiftTorqueFactor = 0.5
ENT.TransMinGearHoldTime = 1

ENT.SteerSpeed = 1.0
ENT.SteerReturnSpeed = 1.0

ENT.WheelBrakeLockupRPM = 3
ENT.WheelBrakeApplySound = "LVS.Brake.Apply"
ENT.WheelBrakeReleaseSound = "LVS.Brake.Release"

ENT.AllowSuperCharger = false
ENT.AllowTurbo = true

ENT.PhysicsInertia = Vector( 12000, 2000, 12000)

ENT.WheelPhysicsMass = 120
ENT.WheelPhysicsInertia = Vector( 30, 10, 30)
ENT.WheelPhysicsTireHeight = 16

ENT.WheelBrakeForce = 400

ENT.WheelSideForce = 800
ENT.WheelDownForce = 2500

ENT.TurboBlowOff = "common/null.wav"
ENT.TurboSound = "lvs/vehicles/mzkt/mzkt_trans.wav"
ENT.TurboVolume = 1.0

ENT.EngineSounds = {
	{ sound = "lvs/vehicles/mzkt/mzkt_idle.wav",
		Volume = 1.0,
		Pitch = 80,
		PitchMul = 30,
		SoundLevel = 80,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{ sound = "lvs/vehicles/mzkt/mzkt_high.wav",
		Volume = 1.0,
		Pitch = 60,
		PitchMul = 50,
		SoundLevel = 80,
		SoundType = LVS.SOUNDTYPE_REV_UP,
	},
	{ sound = "lvs/vehicles/mzkt/mzkt_low.wav",
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
		pos = Vector( 2.379, 0.715, 3.637) * 40,
		ang = Angle(-90),
	},
}

ENT.Lights = {
	{	Trigger = "main",
		ProjectedTextures = {
			{
				pos = Vector( 4.647, 1.187, 1.074) * 40, ang = Angle(),
				colorB = 200, colorA = 100,
				shadows = true,
			},
			{
				pos = Vector( 4.647,-1.187, 1.074) * 40, ang = Angle(),
				colorB = 200, colorA = 100,
				shadows = true,
			},
		},
	},
	{	Trigger = "high",
		ProjectedTextures = {
			{
				pos = Vector( 4.647, 1.187, 1.074) * 40, ang = Angle(),
				colorB = 200, colorA = 100,
				shadows = true,
			},
			{
				pos = Vector( 4.647,-1.187, 1.074) * 40, ang = Angle(),
				colorB = 200, colorA = 100,
				shadows = true,
			},
		},
	},
	{	Trigger = "main+high",
		SubMaterialID = "models/thegordonbeeman/vehicles/e-7429/light#main+high",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector( 4.647, 1.187, 1.074) * 40,
				colorB = 200, colorA = 100,
			},
			{	pos = Vector( 4.647,-1.204, 1.074) * 40,
				colorB = 200, colorA = 100,
			},
		},
	},
	{   Trigger = "active",
		SubMaterialID = "models/thegordonbeeman/vehicles/e-7429/light#active",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector( 4.643, 1.373, 1.141) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 30, height = 30,
			},
			{	pos = Vector( 4.643,-1.373, 1.141) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 30, height = 30,
			},

			{	pos = Vector( 3.988, 0.122, 3.319) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 15, height = 15,
			},
			{	pos = Vector( 3.988, 0.000, 3.319) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 15, height = 15,
			},
			{	pos = Vector( 3.988,-0.122, 3.319) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 15, height = 15,
			},
			
			{	pos = Vector(-4.723, 1.233, 1.201) * 40,
				colorG = 50, colorB = 50, colorA = 30,
				width = 30, height = 30,
			},
			{	pos = Vector(-4.723,-1.233, 1.201) * 40,
				colorG = 50, colorB = 50, colorA = 30,
				width = 30, height = 30,
			},
		},
	},
	{	Trigger = "main+brake",
		SubMaterialID = "models/thegordonbeeman/vehicles/e-7429/light#main+brake",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector(-4.723, 1.314, 1.201) * 40,
				colorG = 50, colorB = 50, colorA = 30,
				width = 30, height = 30,
			},
			{	pos = Vector(-4.723,-1.314, 1.201) * 40,
				colorG = 50, colorB = 50, colorA = 30,
				width = 30, height = 30,
			},
		},
	},
	{	Trigger = "turnleft",
		SubMaterialID = "models/thegordonbeeman/vehicles/e-7429/light#turnleft",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector(-4.723, 1.143, 1.201) * 40,
				colorG = 150, colorB = 0, colorA = 50,
				width = 30, height = 30,
			},
			{	pos = Vector( 3.001, 1.119, 1.900) * 40,
				colorG = 150, colorB = 0, colorA = 50,
				width = 30, height = 25,
			},
			{	pos = Vector( 4.502, 1.528, 1.036) * 40,
				colorG = 150, colorB = 0, colorA = 50,
				width = 30, height = 30,
			},
		},
	},
	{	Trigger = "turnright",
		SubMaterialID = "models/thegordonbeeman/vehicles/e-7429/light#turnright",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector(-4.723,-1.143, 1.201) * 40,
				colorG = 150, colorB = 0, colorA = 50,
				width = 30, height = 30,
			},
			{	pos = Vector( 3.001,-1.119, 1.900) * 40,
				colorG = 150, colorB = 0, colorA = 50,
				width = 30, height = 25,
			},
		},
	},
}