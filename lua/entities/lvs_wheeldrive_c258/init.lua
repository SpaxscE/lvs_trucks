AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include( "shared.lua" )

function ENT:OnSpawn( pObj )
	local Bonnet_Handler = self:AddDoorHandler( "!bonnet",
		Vector( 3.790, 0.000, 1.975) * 40, Angle(),
		Vector(-30,-28,-5), Vector( 30, 28, 5),
		Vector(-30,-28,-5), Vector( 0, 28, 60)
	)
	Bonnet_Handler:SetRate( 3.5 )
	Bonnet_Handler:SetRateExponent( 1.1 )
	Bonnet_Handler:SetSoundOpen( "lvs/vehicles/generic/truck_open_01.wav" )
	Bonnet_Handler:SetSoundClose( "lvs/vehicles/generic/truck_close_01_short.wav" )

	local Door1L_Handler = self:AddDoorHandler( "door1_l",
		Vector( 2.312, 0.890, 1.900) * 40, Angle(),
		Vector(-15,-6,-24), Vector( 15, 6, 24),
		Vector(-15, 0,-24), Vector( 15, 24, 24)
	)
	Door1L_Handler:SetRate( 3.5 )
	Door1L_Handler:SetRateExponent( 1.1 )
	Door1L_Handler:SetSoundOpen( "lvs/vehicles/generic/truck_open_01.wav" )
	Door1L_Handler:SetSoundClose( "lvs/vehicles/generic/truck_close_01_short.wav" )

	local Door1R_Handler = self:AddDoorHandler( "door1_r",
		Vector( 2.312,-0.890, 1.900) * 40, Angle(),
		Vector(-15,-6,-24), Vector( 15, 6, 24),
		Vector(-15,-24,-24), Vector( 15, 0, 24)
	)
	Door1R_Handler:SetRate( 3.5 )
	Door1R_Handler:SetRateExponent( 1.1 )
	Door1R_Handler:SetSoundOpen( "lvs/vehicles/generic/truck_open_01.wav" )
	Door1R_Handler:SetSoundClose( "lvs/vehicles/generic/truck_close_01_short.wav" )

	local Seat
	Seat = self:AddDriverSeat( Vector( 1.750, 0.485, 1.500) * 40, Angle( 0,-90,-5) )
	Seat:SetCameraDistance( 0.1 )
	Door1L_Handler:LinkToSeat( Seat )

	Seat = self:AddPassengerSeat( Vector( 2.200,-0.490, 1.550) * 40, Angle( 0,-90, 10) )
	Seat:SetCameraDistance( 0.1 )
	Door1R_Handler:LinkToSeat( Seat )

	self:AddEngine( Vector( 2.207, 0.000, 1.188) * 40 )
	self:AddFuelTank( Vector(45,0,35), Angle(0,0,0), 1000, LVS.FUELTYPE_DIESEL, Vector(-20,-45,-10),Vector(20,45,10) )
	
	self:AddTurboCharger() -- turbodiesel but idk how you want it  // tbh i wouldnt add turbo by default. Right now it serves no real purpose as it doesnt add turbo sounds or anything. It just takes the option away to easily tune it ingame

	self:SpawnWheels()

	self:AddTrailerHitch( Vector(-0.951, 0.000, 1.421) * 40, LVS.HITCHTYPE_MALE )

	self:AddReverseSound( Vector(-150,0,60), "lvs/vehicles/generic/reverse_warning_beep.wav" )

end

function ENT:SpawnWheels()
	local WheelModel = "models/thegordonbeeman/vehicles/c-256_wheel_front.mdl"

	local Wheel1L = self:AddWheel( {
		pos = Vector( 3.820, 0.997, 0.636) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0, 90),
		radius = 0.542 * 40,
	} )
	local Wheel1R = self:AddWheel( {
		pos = Vector( 3.820,-0.997, 0.636) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0,-90),
		radius = 0.542 * 40,
	} )
	local Axle1 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(),
			SteerType = LVS.WHEEL_STEER_FRONT,
			SteerAngle = 30,
			TorqueFactor = 0,
			BrakeFactor = 1,
			UseHandbrake = false,
		},
		Wheels = { Wheel1L, Wheel1R },
		Suspension = {
			Height = 10,
			MaxTravel = 7,
			ControlArmLength = 250,
			SpringConstant = 50000,
			SpringDamping = 5000,
			SpringRelativeDamping = 3500,
		},
	} )

	self:CreateRigControler( "1l", Wheel1L, 40 * 0.835, 40 * 0.480 )
	self:CreateRigControler( "1r", Wheel1R, 40 * 0.835, 40 * 0.480 )

	WheelModel = "models/thegordonbeeman/vehicles/c-256_wheel_rear.mdl"

	local Wheel2L = self:AddWheel( {
		pos = Vector(-0.255, 0.997, 0.624) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0, 90),
		radius = 0.542 * 40,
		width = 10,
	} )
	local Wheel2R = self:AddWheel( {
		pos = Vector(-0.255,-0.997, 0.624) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0,-90),
		radius = 0.542 * 40,
		width = 10,
	} )
	local Axle2 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(),
			SteerType = LVS.WHEEL_STEER_NONE,
			SteerAngle = 0,
			TorqueFactor = 0.5,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { Wheel2L, Wheel2R },
		Suspension = {
			Height = 6,
			MaxTravel = 7,
			ControlArmLength = 250,
			SpringConstant = 35000,
			SpringDamping = 4000,
			SpringRelativeDamping = 3000,
		},
	} )

	self:CreateRigControler( "2l", Wheel2L, 40 * 0.835, 40 * 0.480 )
	self:CreateRigControler( "2r", Wheel2R, 40 * 0.835, 40 * 0.480 )

	local Wheel3L = self:AddWheel( {
		pos = Vector(-1.718, 0.997, 0.624) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0, 90),
		radius = 0.542 * 40,
		width = 10,
	} )
	local Wheel3R = self:AddWheel( {
		pos = Vector(-1.718,-0.997, 0.624) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0,-90),
		radius = 0.542 * 40,
		width = 10,
	} )
	local Axle3 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(),
			SteerType = LVS.WHEEL_STEER_NONE,
			SteerAngle = 0,
			TorqueFactor = 0.5,
			BrakeFactor = 1,
			UseHandbrake = false,
		},
		Wheels = { Wheel3L, Wheel3R },
		Suspension = {
			Height = 6,
			MaxTravel = 7,
			ControlArmLength = 250,
			SpringConstant = 35000,
			SpringDamping = 4000,
			SpringRelativeDamping = 3000,
		},
	} )

	self:CreateRigControler( "3l", Wheel3L, 40 * 0.835, 40 * 0.480 )
	self:CreateRigControler( "3r", Wheel3R, 40 * 0.835, 40 * 0.480 )
end
