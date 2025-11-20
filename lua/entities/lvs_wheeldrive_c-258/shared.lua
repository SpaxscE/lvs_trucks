ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "C-258"
ENT.Author = ""
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Cars"

ENT.VehicleCategory = "Cars" -- LVS Trucks?
ENT.VehicleSubCategory = "Trucks"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/thegordonbeeman/vehicles/c-258.mdl"

ENT.MaxVelocity = 780
ENT.MaxVelocityReverse = 150

ENT.PhysicsWeightScale = 1.0

ENT.EngineCurve = 0.1
ENT.EngineCurveBoostLow = 2.0
ENT.EngineTorque = 70

ENT.ThrottleRate = 0.5

-- ENT.EngineIgnitionTime = 0.8
-- ENT.EngineStartStopVolume = 0.5
-- ENT.EngineStartSound = "lmx/vehicles/m2_halftrack/start.wav"
-- ENT.EngineStopSound = "lmx/vehicles/m2_halftrack/stop.wav"

ENT.TransGears = 5
ENT.TransGearsReverse = 1
ENT.TransShiftSpeed = 1.0

-- ENT.SteerSpeed = 2.0
-- ENT.SteerReturnSpeed = 2.0

ENT.WheelBrakeLockupRPM = 0

ENT.AllowSuperCharger = false
ENT.AllowTurbo = true -- supposed to be turbodiesel already so

-- ENT.WheelBrakeForce = 200

-- ENT.WheelSideForce = 800
-- ENT.WheelDownForce = 500

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
		pos = Vector( 1.061, 0.668, 0.563) * 40,
		ang = Angle( 22, 100),
	},
}