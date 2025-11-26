ENT.Base = "lvs_base_wheeldrive_trailer"

ENT.PrintName = "Lowboy semi-trailer"
ENT.Author = ""
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Trucks - Pack"

ENT.VehicleCategory = "Rig"
ENT.VehicleSubCategory = "Trailers"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/thegordonbeeman/vehicles/lowboy_semi-trailer.mdl"

ENT.MassCenterOverride = Vector(-80,0,40)

ENT.PhysicsWeightScale = 3
ENT.PhysicsDampingSpeed = 50
ENT.PhysicsDampingForward = true
ENT.PhysicsDampingReverse = true

ENT.PhysicsInertia = Vector(1500,1500,1500)

ENT.WheelPhysicsMass = 100
ENT.WheelPhysicsInertia = Vector(14,14,14)
ENT.WheelPhysicsTireHeight = 16

function ENT:OnSetupDataTables()
	self:AddDT( "Bool", "Supports" )
end