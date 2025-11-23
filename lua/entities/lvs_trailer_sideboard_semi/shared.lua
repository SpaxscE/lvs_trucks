ENT.Base = "lvs_base_wheeldrive_trailer"

ENT.PrintName = "Sideboard semi-trailer"
ENT.Author = ""
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Trucks - Pack"

ENT.VehicleCategory = "Rig"
ENT.VehicleSubCategory = "Trailers"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/thegordonbeeman/vehicles/sideboard_semi-trailer.mdl"

function ENT:OnSetupDataTables()
	self:AddDT( "Bool", "Supports" )
end

ENT.Lights = {
	{   Trigger = "active",
		SubMaterialID = "models/thegordonbeeman/vehicles/sideboard_semi-trailer/light#active",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector( 1.018, 1.186, 1.371) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 15, height = 15,
			},
			{	pos = Vector(-1.268, 1.186, 1.371) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 15, height = 15,
			},
			{	pos = Vector(-3.440, 1.186, 1.371) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 15, height = 15,
			},
			{	pos = Vector(-4.941, 1.186, 1.371) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 15, height = 15,
			},
            
			{	pos = Vector( 1.018,-1.186, 1.371) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 15, height = 15,
			},
			{	pos = Vector(-1.268,-1.186, 1.371) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 15, height = 15,
			},
			{	pos = Vector(-3.440,-1.186, 1.371) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 15, height = 15,
			},
			{	pos = Vector(-4.941,-1.186, 1.371) * 40,
				colorG = 200, colorB = 50, colorA = 50,
				width = 15, height = 15,
			},
            
			{	pos = Vector(-7.678, 0.843, 1.232) * 40,
				colorG = 50, colorB = 50, colorA = 30,
				width = 30, height = 30,
			},
			{	pos = Vector(-7.678,-0.843, 1.232) * 40,
				colorG = 50, colorB = 50, colorA = 30,
				width = 30, height = 30,
			},
		},
	},
	{	Trigger = "turnleft",
		SubMaterialID = "models/thegordonbeeman/vehicles/sideboard_semi-trailer/light#turnleft",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector(-7.679, 1.089, 1.232) * 40,
				colorG = 150, colorB = 0, colorA = 50,
				width = 30, height = 30,
			},
		},
	},
	{	Trigger = "turnright",
		SubMaterialID = "models/thegordonbeeman/vehicles/sideboard_semi-trailer/light#turnright",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector(-7.679,-1.089, 1.232) * 40,
				colorG = 150, colorB = 0, colorA = 50,
				width = 30, height = 30,
			},
		},
	},
	{	Trigger = "main+brake",
		SubMaterialID = "models/thegordonbeeman/vehicles/sideboard_semi-trailer/light#main+brake",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector(-7.679, 0.963, 1.247) * 40,
				colorG = 50, colorB = 50, colorA = 30,
				width = 30, height = 30,
			},
			{	pos = Vector(-7.679,-0.963, 1.247) * 40,
				colorG = 50, colorB = 50, colorA = 30,
				width = 30, height = 30,
			},
		},
	},
}