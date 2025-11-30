ENT.Base = "lvs_wheeldrive_truckbase"

ENT.PrintName = "C-258"
ENT.Author = ""
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Trucks - Pack"

ENT.VehicleCategory = "Rig"
ENT.VehicleSubCategory = "Trucks"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/thegordonbeeman/vehicles/c-258.mdl"

ENT.MaxVelocity = 780
ENT.MaxVelocityReverse = 150

ENT.PhysicsWeightScale = 5
ENT.PhysicsDampingSpeed = 50
ENT.PhysicsDampingForward = true
ENT.PhysicsDampingReverse = true

ENT.SteerAssistDeadZoneAngle = 10
ENT.SteerAssistMaxAngle = 0
ENT.SteerAssistExponent = 1
ENT.SteerAssistMultiplier = 0

ENT.PhysicsWeightScale = 2.5

ENT.EngineCurve = 0.65
ENT.EngineCurveBoostLow = 3
ENT.EngineTorque = 140

ENT.EngineIdleRPM = 500
ENT.EngineMaxRPM = 3250

ENT.ThrottleRate = 0.3
ENT.BrakeRate = 0.5

ENT.EngineIgnitionTime = 1.0
ENT.EngineStartStopVolume = 1.0
ENT.EngineStartSound = "lvs/vehicles/kraz/kraz_start.wav"
ENT.EngineStopSound = "lvs/vehicles/kraz/kraz_stop.wav"

ENT.TransGears = 5
ENT.TransGearsReverse = 1
ENT.TransShiftSpeed = 1.0
ENT.TransShiftTorqueFactor = 0.5
ENT.TransMinGearHoldTime = 1.5

ENT.SteerSpeed = 1.5
ENT.SteerReturnSpeed = 1.3

ENT.WheelBrakeLockupRPM = 3
ENT.WheelBrakeApplySound = "LVS.Brake.Apply"
ENT.WheelBrakeReleaseSound = "LVS.Brake.Release"

ENT.PhysicsInertia = Vector(1500,1500,1500)

ENT.MassCenterOverride = Vector(80,0,40)

ENT.WheelPhysicsMass = 100
ENT.WheelPhysicsInertia = Vector(14,14,14)
ENT.WheelPhysicsTireHeight = 8.77

ENT.WheelBrakeForce = 400

ENT.WheelSideForce = 800
ENT.WheelDownForce = 2500

ENT.TurboBlowOff = "common/null.wav"
ENT.TurboSound = "lvs/vehicles/generic/truck_turbo.wav"
ENT.TurboVolume = 1.0

ENT.HornSound = "lvs/horn3.wav"
ENT.HornPos = Vector(150,0,35)

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/kraz/kraz_idle.wav",
		Volume = 1.0,
		Pitch = 90,
		PitchMul = 30,
		SoundLevel = 80,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/kraz/kraz_high_off.wav",
		Volume = 1.0,
		Pitch = 60,
		PitchMul = 50,
		SoundLevel = 80,
		SoundType = LVS.SOUNDTYPE_REV_UP,
	},
	{
		sound = "lvs/vehicles/kraz/kraz_high.wav",
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
		pos = Vector( 1.061, 0.668, 0.563) * 40,
		ang = Angle( 22, 100),
	},
}

ENT.Lights = {
	{
		Trigger = "main",
		ProjectedTextures = {
			{
				pos = Vector( 4.466, 0.716, 1.508) * 40, ang = Angle(),
				colorB = 200, colorA = 100,
				shadows = true,
			},
			{
				pos = Vector( 4.466,-0.716, 1.508) * 40, ang = Angle(),
				colorB = 200, colorA = 100,
				shadows = true,
			},
		},
	},
	{
		Trigger = "high",
		ProjectedTextures = {
			{
				pos = Vector( 4.466, 0.716, 1.508) * 40, ang = Angle(),
				colorB = 200, colorA = 100,
				shadows = true,
			},
			{
				pos = Vector( 4.466,-0.716, 1.508) * 40, ang = Angle(),
				colorB = 200, colorA = 100,
				shadows = true,
			},
		},
	},
	{
		Trigger = "main+high",
		SubMaterialID = "models/thegordonbeeman/vehicles/c-256/light#main+high",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector( 4.466, 0.716, 1.508) * 40,
				colorB = 200, colorA = 100,
			},
			{	pos = Vector( 4.466,-0.716, 1.508) * 40,
				colorB = 200, colorA = 100,
			},
		},
	},
	{
		Trigger = "active",
		SubMaterialID = "models/thegordonbeeman/vehicles/c-256/light#active",
		SubMaterialBrightness = 0.2,
		Sprites = {
			{	pos = Vector( 4.311, 1.050, 1.389) * 40,
				colorG = 220, colorB = 150, colorA = 50,
				width = 20, height = 20,
			},
			{	pos = Vector( 4.311,-1.050, 1.389) * 40,
				colorG = 220, colorB = 150, colorA = 50,
				width = 20, height = 20,
			},
		},
	},
	{
		Trigger = "active",
		SubMaterialID = "models/thegordonbeeman/vehicles/c-256/light#active2",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector( 2.605, 0.170, 2.743) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 15, height = 15,
			},
			{	pos = Vector( 2.605, 0.000, 2.743) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 15, height = 15,
			},
			{	pos = Vector( 2.605,-0.170, 2.743) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 15, height = 15,
			},
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = "models/thegordonbeeman/vehicles/c-256/light#turnleft",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector( 3.667, 1.166, 1.500) * 40,
				colorG = 150, colorB = 0, colorA = 50,
				width = 30, height = 30,
			},
		},
	},
	{
		Trigger = "turnright",
		SubMaterialID = "models/thegordonbeeman/vehicles/c-256/light#turnright",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector( 3.667,-1.166, 1.500) * 40,
				colorG = 150, colorB = 0, colorA = 50,
				width = 30, height = 30,
			},
		},
	},
}