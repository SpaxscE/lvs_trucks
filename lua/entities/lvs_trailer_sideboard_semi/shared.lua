ENT.Base = "lvs_base_wheeldrive_trailer"

ENT.PrintName = "Sideboard semi-trailer"
ENT.Author = ""
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Trailers"

ENT.VehicleCategory = "Cars"
ENT.VehicleSubCategory = "Trailers"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/thegordonbeeman/vehicles/sideboard_semi-trailer.mdl"

function ENT:OnSetupDataTables()
	self:AddDT( "Bool", "Supports" )
end