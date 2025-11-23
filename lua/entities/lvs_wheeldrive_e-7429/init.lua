AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )

include( "shared.lua" )

function ENT:OnSpawn( pObj )
	-- local Bonnet_Handler = self:AddDoorHandler( "!bonnet",
	-- Vector( 3.790, 0.000, 1.975) * 40, Angle(),
	-- Vector(-30,-28,-5), Vector( 30, 28, 5),
	-- Vector(-30,-28,-5), Vector( 0, 28, 60) )
	-- Bonnet_Handler:SetRate( 3.5 )
    -- Bonnet_Handler:SetRateExponent( 1.1 )
	-- Bonnet_Handler:SetSoundOpen( "lvs/vehicles/generic/truck_open_01.wav" )
	-- Bonnet_Handler:SetSoundClose( "lvs/vehicles/generic/truck_close_01-short.wav" )

	local Door1L_Handler = self:AddDoorHandler( "door1_l",
	Vector( 3.653, 1.076, 2.252) * 40, Angle(),
	Vector(-20,-6,-35), Vector( 20, 6, 35),
	Vector(-20, 0,-35), Vector( 20, 40, 35) )
	Door1L_Handler:SetRate( 3.5 )
    Door1L_Handler:SetRateExponent( 1.1 )
	Door1L_Handler:SetSoundOpen( "lvs/vehicles/generic/truck_open_01.wav" )
	Door1L_Handler:SetSoundClose( "lvs/vehicles/generic/truck_close_01-short.wav" )

	local Door1R_Handler = self:AddDoorHandler( "door1_r",
	Vector( 3.653,-1.076, 2.252) * 40, Angle(),
	Vector(-20,-6,-35), Vector( 20, 6, 35),
	Vector(-20,-40,-35), Vector( 20, 0, 35) )
	Door1R_Handler:SetRate( 3.5 )
    Door1R_Handler:SetRateExponent( 1.1 )
	Door1R_Handler:SetSoundOpen( "lvs/vehicles/generic/truck_open_01.wav" )
	Door1R_Handler:SetSoundClose( "lvs/vehicles/generic/truck_close_01-short.wav" )

    local Seat
    Seat = self:AddDriverSeat( Vector( 3.100, 0.656, 1.950) * 40, Angle( 0,-90,-5) )
	Door1L_Handler:LinkToSeat( Seat )

    Seat = self:AddPassengerSeat( Vector( 3.550,-0.691, 2.000) * 40, Angle( 0,-90, 10) )
	Door1R_Handler:LinkToSeat( Seat )

	self:AddEngine( Vector( 2.850, 0.000, 1.950) * 40 )

	self:AddTurboCharger()

    self:SpawnWheels()

	self:AddTrailerHitch( Vector(-2.318, 0.000, 1.837) * 40, LVS.HITCHTYPE_MALE )
end

function ENT:SpawnWheels()
    local WheelModel = "models/thegordonbeeman/vehicles/e-7429_wheel.mdl"

    local Wheel1L = self:AddWheel( {
		pos = Vector( 2.737, 1.244, 0.591) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0, 90),
        radius = 0.769 * 40,
	} )
    local Wheel1R = self:AddWheel( {
		pos = Vector( 2.737,-1.244, 0.591) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0,-90),
        radius = 0.769 * 40,
	} )
	local Axle1 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(),
			SteerType = LVS.WHEEL_STEER_ACKERMANN,
			SteerAngle = 30,
			TorqueFactor = 0.25,
			BrakeFactor = 1,
			UseHandbrake = false,
		},
		Wheels = { Wheel1L, Wheel1R },
		Suspension = {
			Height = 5,
			MaxTravel = 7,
			SpringConstant = 35000,
			SpringDamping = 2000,
			SpringRelativeDamping = 2000,
		},
	} )

	self:CreateRigControler( "1l", Wheel1L, 40 * 0.650, 40 * 0.500 )
	self:CreateRigControler( "1r", Wheel1R, 40 * 0.650, 40 * 0.500 )

    local Wheel2L = self:AddWheel( {
		pos = Vector( 0.526, 1.244, 0.591) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0, 90),
        radius = 0.769 * 40,
	} )
    local Wheel2R = self:AddWheel( {
		pos = Vector( 0.526,-1.244, 0.591) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0,-90),
        radius = 0.769 * 40,
	} )
	local Axle2 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(),
			SteerType = LVS.WHEEL_STEER_ACKERMANN,
			SteerAngle = 15,
			TorqueFactor = 0.25,
			BrakeFactor = 1,
			UseHandbrake = false,
		},
		Wheels = { Wheel2L, Wheel2R },
		Suspension = {
			Height = 5,
			MaxTravel = 7,
			SpringConstant = 35000,
			SpringDamping = 2000,
			SpringRelativeDamping = 2000,
		},
	} )

	self:CreateRigControler( "2l", Wheel2L, 40 * 0.650, 40 * 0.500 )
	self:CreateRigControler( "2r", Wheel2R, 40 * 0.650, 40 * 0.500 )

    local Wheel3L = self:AddWheel( {
		pos = Vector(-2.108, 1.244, 0.700) * 40,--0.591) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0, 90),
        radius = 0.769 * 40,
	} )
    local Wheel3R = self:AddWheel( {
		pos = Vector(-2.108,-1.244, 0.700) * 40,--0.591) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0,-90),
        radius = 0.769 * 40,
	} )
	local Axle3 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(),
			SteerType = LVS.WHEEL_STEER_NONE,
			SteerAngle = 0,
			TorqueFactor = 0.25,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { Wheel3L, Wheel3R },
		Suspension = {
			Height = 7,
			MaxTravel = 10,
			SpringConstant = 40000,
			SpringDamping = 3000,
			SpringRelativeDamping = 3000,
		},
	} )

	self:CreateRigControler( "3l", Wheel3L, 40 * 0.887, 40 * 0.593 )
	self:CreateRigControler( "3r", Wheel3R, 40 * 0.887, 40 * 0.593 )

    local Wheel4L = self:AddWheel( {
		pos = Vector(-3.806, 1.244, 0.700) * 40,--0.591) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0, 90),
        radius = 0.769 * 40,
	} )
    local Wheel4R = self:AddWheel( {
		pos = Vector(-3.806,-1.244, 0.700) * 40,--0.591) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0,-90),
        radius = 0.769 * 40,
	} )
	local Axle4 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(),
			SteerType = LVS.WHEEL_STEER_NONE,
			SteerAngle = 0,
			TorqueFactor = 0.25,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { Wheel4L, Wheel4R },
		Suspension = {
			Height = 7,
			MaxTravel = 10,
			SpringConstant = 40000,
			SpringDamping = 3000,
			SpringRelativeDamping = 3000,
		},
	} )

	self:CreateRigControler( "4l", Wheel4L, 40 * 0.887, 40 * 0.593 )
	self:CreateRigControler( "4r", Wheel4R, 40 * 0.887, 40 * 0.593 )
end

function ENT:HandleStart()
	local Driver = self:GetDriver()

	if IsValid( Driver ) then
        self.TimeKeyReload = isnumber( self.TimeKeyReload ) and self.TimeKeyReload or -2
		local KeyReload = Driver:lvsKeyDown( "ENGINE" )

        local Engine = self:GetEngine() -- emit sound from the engine

		if self.OldKeyReload ~= KeyReload then
			self.OldKeyReload = KeyReload

			if KeyReload then
                if ( self:GetEngineActive() ) then
                    self:StopEngine()

                    Engine:EmitSound( self.EngineStopSound, 75, 100, self.EngineStartStopVolume )
                else
                    self.TimeKeyReload = CurTime()

                    Engine:EmitSound( self.EngineStartSound, 75, 100, self.EngineStartStopVolume )
                end
			else
                if ( not self:GetEngineActive() and self.TimeKeyReload >= -1 ) then
                    self.TimeKeyReload = -1

                    Engine:StopSound( self.EngineStartSound )
                    Engine:EmitSound( self.EngineStopSound, 75, 100, self.EngineStartStopVolume * 0.2 )
                end
            end
		else
            if ( self.TimeKeyReload > -1 and self.TimeKeyReload < CurTime() - self.EngineIgnitionTime ) then
                self:StartEngine()

                self.TimeKeyReload = -1
            end
        end
	end
end