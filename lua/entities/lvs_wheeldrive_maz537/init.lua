AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )

include( "shared.lua" )

function ENT:OnSpawn( pObj )
	local Door1L_Handler = self:AddDoorHandler( "door1_l",
		Vector( 3.960, 1.118, 2.074) * 40, Angle(),
		Vector(-12,-6,-28), Vector( 12, 6, 28),
		Vector(-12, 0,-28), Vector( 12, 22, 28)
	)
	Door1L_Handler:SetRate( 3.5 )
	Door1L_Handler:SetRateExponent( 1.1 )
	Door1L_Handler:SetSoundOpen( "lvs/vehicles/generic/truck_open_01.wav" )
	Door1L_Handler:SetSoundClose( "lvs/vehicles/generic/truck_close_01_short.wav" )

	local Door1R_Handler = self:AddDoorHandler( "door1_r",
		Vector( 3.960,-1.118, 2.074) * 40, Angle(),
		Vector(-12,-6,-28), Vector( 12, 6, 28),
		Vector(-12,-22,-28), Vector( 12, 0, 28)
	)
	Door1R_Handler:SetRate( 3.5 )
	Door1R_Handler:SetRateExponent( 1.1 )
	Door1R_Handler:SetSoundOpen( "lvs/vehicles/generic/truck_open_01.wav" )
	Door1R_Handler:SetSoundClose( "lvs/vehicles/generic/truck_close_01_short.wav" )

	local Seat
	-- Seat = self:AddDriverSeat( Vector( 3.100, 0.656, 1.950) * 40, Angle( 0,-90,-5) )
	Seat = self:AddDriverSeat( Vector( 3.400, 0.610, 1.600) * 40, Angle( 0,-90,-5) )
	Seat:SetCameraDistance( 0.2 )
	Door1L_Handler:LinkToSeat( Seat )

	-- Seat = self:AddPassengerSeat( Vector( 3.550,-0.691, 2.000) * 40, Angle( 0,-90, 10) )
	Seat = self:AddPassengerSeat( Vector( 3.550,-0.691, 2.000) * 40, Angle( 0,-90, 10) )
	Seat:SetCameraDistance( 0.2 )
	Door1R_Handler:LinkToSeat( Seat )

	self:AddEngine( Vector( 2.850, 0.000, 1.950) * 40 )
	self:AddFuelTank( Vector( 1.314, 0.000, 2.220) * 40, Angle(), 1000, LVS.FUELTYPE_DIESEL, Vector(-10,-45,-15),Vector(10,45,15) )

	self:AddTurboCharger()

	self:SpawnWheels()

	self:AddTrailerHitch( Vector(-0.965, 0.000, 2.024) * 40, LVS.HITCHTYPE_MALE )
	self:AddReverseSound( Vector(-160,0,40), "lvs/vehicles/generic/reverse_warning_beep.wav" )
end

function ENT:SpawnWheels()
	local WheelModel = "models/thegordonbeeman/vehicles/e-7429_wheel.mdl"

	local Wheel1L = self:AddWheel( {
		pos = Vector( 3.111, 1.096, 0.770) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0, 90),
		radius = 0.762 * 40,
		width = 10,
	} )
	local Wheel1R = self:AddWheel( {
		pos = Vector( 3.111,-1.096, 0.770) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0,-90),
		radius = 0.762 * 40,
		width = 10,
	} )
	local Axle1 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(),
			SteerType = LVS.WHEEL_STEER_ACKERMANN,
			SteerAngle = 30,
			TorqueFactor = 0.2,
			BrakeFactor = 1,
			UseHandbrake = false,
		},
		Wheels = { Wheel1L, Wheel1R },
		Suspension = {
			Height = 8,
			MaxTravel = 5,
			ControlArmLength = 250,
			SpringConstant = 50000,
			SpringDamping = 6000,
			SpringRelativeDamping = 100,
		},
	} )

	self:CreateRigControler( "1l", Wheel1L, 40 * 0.874, 40 * 0.517 )
	self:CreateRigControler( "1r", Wheel1R, 40 * 0.874, 40 * 0.517 )

	local Wheel2L = self:AddWheel( {
		pos = Vector( 1.407, 1.096, 0.770) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0, 90),
		radius = 0.762 * 40,
		width = 10,
	} )
	local Wheel2R = self:AddWheel( {
		pos = Vector( 1.407,-1.096, 0.770) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0,-90),
		radius = 0.762 * 40,
		width = 10,
	} )
	local Axle2 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(),
			SteerType = LVS.WHEEL_STEER_ACKERMANN,
			SteerAngle = 15,
			TorqueFactor = 0.2,
			BrakeFactor = 1,
			UseHandbrake = false,
		},
		Wheels = { Wheel2L, Wheel2R },
		Suspension = {
			Height = 8,
			MaxTravel = 5,
			ControlArmLength = 250,
			SpringConstant = 50000,
			SpringDamping = 6000,
			SpringRelativeDamping = 100,
		},
	} )

	self:CreateRigControler( "2l", Wheel2L, 40 * 0.874, 40 * 0.517 )
	self:CreateRigControler( "2r", Wheel2R, 40 * 0.874, 40 * 0.517 )

	local Wheel3L = self:AddWheel( {
		pos = Vector(-1.189, 1.096, 0.770) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0, 90),
		radius = 0.762 * 40,
		width = 10,
	} )
	local Wheel3R = self:AddWheel( {
		pos = Vector(-1.189,-1.096, 0.770) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0,-90),
		radius = 0.762 * 40,
		width = 10,
	} )
	local Axle3 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(),
			SteerType = LVS.WHEEL_STEER_NONE,
			SteerAngle = 0,
			TorqueFactor = 0.4,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { Wheel3L, Wheel3R },
		Suspension = {
			Height = 8,
			MaxTravel = 5,
			ControlArmLength = 250,
			SpringConstant = 50000,
			SpringDamping = 6000,
			SpringRelativeDamping = 100,
		},
	} )

	self:CreateRigControler( "3l", Wheel3L, 40 * 0.874, 40 * 0.517 )
	self:CreateRigControler( "3r", Wheel3R, 40 * 0.874, 40 * 0.517 )

	local Wheel4L = self:AddWheel( {
		pos = Vector(-2.883, 1.096, 0.770) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0, 90),
		radius = 0.762 * 40,
		width = 10,
	} )
	local Wheel4R = self:AddWheel( {
		pos = Vector(-2.883,-1.096, 0.770) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0,-90),
		radius = 0.762 * 40,
		width = 10,
	} )

	self:SetNWEntity( "DriveWheel1", Wheel4L )
	self:SetNWEntity( "DriveWheel2", Wheel4R )

	local Axle4 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(),
			SteerType = LVS.WHEEL_STEER_NONE,
			SteerAngle = 0,
			TorqueFactor = 0.4,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { Wheel4L, Wheel4R },
		Suspension = {
			Height = 8,
			MaxTravel = 5,
			ControlArmLength = 250,
			SpringConstant = 50000,
			SpringDamping = 6000,
			SpringRelativeDamping = 100,
		},
	} )

	self:CreateRigControler( "4l", Wheel4L, 40 * 0.874, 40 * 0.517 )
	self:CreateRigControler( "4r", Wheel4R, 40 * 0.874, 40 * 0.517 )
end
