
ENT.Base = "lvs_base_wheeldrive"

ENT.PrintName = "Mule"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Trucks"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 80

ENT.MassCenterOverride = Vector(0,-80,20)

ENT.MDL = "models/hunter/plates/plate2x7.mdl"

ENT.AITEAM = 0

ENT.MaxVelocity = 1200

ENT.SteerSpeed = 1
ENT.SteerReturnSpeed = 2

ENT.PhysicsWeightScale = 2

ENT.ThrottleRate = 0.3

ENT.EngineTorque = 200
ENT.EngineCurve = 0
ENT.EngineCurveBoostLow = 4

ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

ENT.WheelBrakeForce = 400

ENT.WheelBrakeLockupRPM = 8

ENT.PhysicsInertia = Vector(8000,2000,8000)

ENT.WheelPhysicsMass = 100
ENT.WheelPhysicsInertia = Vector(25,10,25)
ENT.WheelPhysicsTireHeight = 10

ENT.WheelSideForce = 800
ENT.WheelDownForce = 2000

ENT.TransGears = 8
ENT.TransGearsReverse = 1
ENT.TransShiftSpeed = 0.1
ENT.TransMinGearHoldTime = 0.5

ENT.EngineSounds = {
	{
		sound = "lvs/vehicles/pz2/eng_idle_loop.wav",
		Volume = 1,
		Pitch = 70,
		PitchMul = 30,
		SoundLevel = 75,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "lvs/vehicles/pz2/eng_loop.wav",
		Volume = 1,
		Pitch = 20,
		PitchMul = 90,
		SoundLevel = 85,
		SoundType = LVS.SOUNDTYPE_NONE,
		UseDoppler = true,
	}
}
