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

ENT.PhysicsWeightScale = 1.2

ENT.WheelPhysicsMass = 120
ENT.WheelPhysicsInertia = Vector( 30, 10, 30)
ENT.WheelPhysicsTireHeight = 16

function ENT:OnSetupDataTables()
	self:AddDT( "Bool", "Supports" )
end