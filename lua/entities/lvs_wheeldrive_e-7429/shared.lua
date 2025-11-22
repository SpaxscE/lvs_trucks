ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "E-7429"
ENT.Author = ""
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Trucks"

ENT.VehicleCategory = "Cars"
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

ENT.ThrottleRate = 0.2
ENT.BrakeRate = 0.3

-- ENT.EngineIgnitionTime = 0.8
-- ENT.EngineStartStopVolume = 0.5
-- ENT.EngineStartSound = "lmx/vehicles/m2_halftrack/start.wav"
-- ENT.EngineStopSound = "lmx/vehicles/m2_halftrack/stop.wav"

ENT.TransGears = 4
ENT.TransGearsReverse = 1
ENT.TransShiftSpeed = 1.0
ENT.TransShiftTorqueFactor = 0.4
ENT.TransMinGearHoldTime = 0.5

ENT.SteerSpeed = 1.0
ENT.SteerReturnSpeed = 1.0

ENT.WheelBrakeLockupRPM = 3

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