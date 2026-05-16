ENT.Base = "lvs_base_wheeldrive_trailer"

ENT.PrintName = "Curtainside semi-trailer"
ENT.Author = ""
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Trucks - Pack"

ENT.VehicleCategory = "Rig"
ENT.VehicleSubCategory = "Trailers"

ENT.Spawnable			= true
ENT.AdminSpawnable		= false

ENT.MDL = "models/thegordonbeeman/vehicles/trailer_semi_curtainside.mdl"

ENT.MassCenterOverride = Vector(-300,0,40)

function ENT:OnSetupDataTables()
	self:AddDT( "Bool", "Supports" )
end

ENT.Lights = {
	{
		Trigger = "fog",
		SubMaterialID = "models/thegordonbeeman/vehicles/trailer_semi_curtainside/light_active",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector( 1.295, 1.151, 1.327) * 40,
				colorG = 100, colorB = 50, colorA = 150,
				width = 15, height = 15,
			},
			{	pos = Vector(-1.827, 1.151, 1.327) * 40,
				colorG = 100, colorB = 50, colorA = 150,
				width = 15, height = 15,
			},
			{	pos = Vector(-5.288, 1.151, 1.327) * 40,
				colorG = 100, colorB = 50, colorA = 150,
				width = 15, height = 15,
			},
			{	pos = Vector(-8.119, 1.151, 1.327) * 40,
				colorG = 100, colorB = 50, colorA = 150,
				width = 15, height = 15,
			},
			{	pos = Vector(-10.92, 1.151, 1.327) * 40,
				colorG = 100, colorB = 50, colorA = 150,
				width = 15, height = 15,
			},
            
			{	pos = Vector( 1.295,-1.151, 1.327) * 40,
				colorG = 100, colorB = 50, colorA = 150,
				width = 15, height = 15,
			},
			{	pos = Vector(-1.827,-1.151, 1.327) * 40,
				colorG = 100, colorB = 50, colorA = 150,
				width = 15, height = 15,
			},
			{	pos = Vector(-5.288,-1.151, 1.327) * 40,
				colorG = 100, colorB = 50, colorA = 150,
				width = 15, height = 15,
			},
			{	pos = Vector(-8.119,-1.151, 1.327) * 40,
				colorG = 100, colorB = 50, colorA = 150,
				width = 15, height = 15,
			},
			{	pos = Vector(-10.92,-1.151, 1.327) * 40,
				colorG = 100, colorB = 50, colorA = 150,
				width = 15, height = 15,
			},
            
			{	pos = Vector(-11.10, 0.792, 0.853) * 40,
				colorG = 50, colorB = 50, colorA = 100,
				width = 30, height = 30,
			},
			{	pos = Vector(-11.10,-0.792, 0.853) * 40,
				colorG = 50, colorB = 50, colorA = 100,
				width = 30, height = 30,
			},
		},
	},
	{
		Trigger = "turnleft",
		SubMaterialID = "models/thegordonbeeman/vehicles/trailer_semi_curtainside/light_turnleft",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector(-11.10, 1.039, 0.854) * 40,
				colorG = 150, colorB = 0, colorA = 50,
				width = 30, height = 30,
			},
		},
	},
	{
		Trigger = "turnright",
		SubMaterialID = "models/thegordonbeeman/vehicles/trailer_semi_curtainside/light_turnright",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector(-11.10,-1.039, 0.854) * 40,
				colorG = 150, colorB = 0, colorA = 50,
				width = 30, height = 30,
			},
		},
	},
	{
		Trigger = "main+brake",
		SubMaterialID = "models/thegordonbeeman/vehicles/trailer_semi_curtainside/light_main+brake",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector(-11.10, 0.913, 0.875) * 40,
				colorG = 50, colorB = 50, colorA = 30,
				width = 30, height = 30,
			},
			{	pos = Vector(-11.10,-0.913, 0.875) * 40,
				colorG = 50, colorB = 50, colorA = 30,
				width = 30, height = 30,
			},
		},
	},
	{
		Trigger = "reverse",
		SubMaterialID = "models/thegordonbeeman/vehicles/trailer_semi_curtainside/light_reverse",
		SubMaterialBrightness = 0.5,
		Sprites = {
			{	pos = Vector(-11.12, 0.658, 0.852) * 40,
				colorA = 100,
				width = 30, height = 30,
			},
		},
	},
}