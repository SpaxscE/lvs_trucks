ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "C-258"
ENT.Author = ""
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Trucks"

ENT.VehicleCategory = "Cars" -- LVS Trucks?
ENT.VehicleSubCategory = "Trucks"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/thegordonbeeman/vehicles/c-258.mdl"

ENT.MaxVelocity = 780
ENT.MaxVelocityReverse = 150

ENT.PhysicsWeightScale = 2.0

ENT.EngineCurve = 1
ENT.EngineCurveBoostLow = 3.0
ENT.EngineTorque = 40

ENT.EngineIdleRPM = 500
ENT.EngineMaxRPM = 3250

ENT.ThrottleRate = 0.3
ENT.BrakeRate = 0.3

-- ENT.EngineIgnitionTime = 0.8
-- ENT.EngineStartStopVolume = 0.5
-- ENT.EngineStartSound = "lmx/vehicles/m2_halftrack/start.wav"
-- ENT.EngineStopSound = "lmx/vehicles/m2_halftrack/stop.wav"

ENT.TransGears = 5
ENT.TransGearsReverse = 1
ENT.TransShiftSpeed = 1.0
ENT.TransShiftTorqueFactor = 0.6
ENT.TransMinGearHoldTime = 1.5

ENT.SteerSpeed = 1.5
ENT.SteerReturnSpeed = 1.3

ENT.WheelBrakeLockupRPM = 1

ENT.AllowSuperCharger = false
ENT.AllowTurbo = true -- supposed to be turbodiesel already so

ENT.PhysicsInertia = Vector( 8000, 2000, 8000)

ENT.WheelPhysicsMass = 100
ENT.WheelPhysicsInertia = Vector( 25, 10, 25)
ENT.WheelPhysicsTireHeight = 35.53

ENT.WheelBrakeForce = 400

ENT.WheelSideForce = 800
ENT.WheelDownForce = 2000

ENT.TurboBlowOff = "common/null.wav"
ENT.TurboSound = "lvs/vehicles/generic/truck_turbo.wav"
ENT.TurboVolume = 1.0

ENT.EngineSounds = {
	{ sound = "lvs/vehicles/kraz/kraz_idle.wav",
		Volume = 1.0,
		Pitch = 90,
		PitchMul = 30,
		SoundLevel = 80,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{ sound = "lvs/vehicles/kraz/kraz_high_off.wav",
		Volume = 1.0,
		Pitch = 60,
		PitchMul = 50,
		SoundLevel = 80,
		SoundType = LVS.SOUNDTYPE_REV_UP,
	},
	{ sound = "lvs/vehicles/kraz/kraz_high.wav",
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