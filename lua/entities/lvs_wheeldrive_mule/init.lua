AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include("shared.lua")

function ENT:OnSpawn( PObj )
	PObj:SetMass( 2500 )

	self:AddDriverSeat( Vector(0,40,0), Angle(0,0,0) )
	self:AddEngine( Vector(0,0,0), Angle(0,0,0) )

	local WheelModel = "models/props_vehicles/tire001a_tractor.mdl"

	local FrontAxle = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,90,0),
			SteerType = LVS.WHEEL_STEER_ACKERMANN,
			SteerAngle = 30,
			TorqueFactor = 0.5,
			BrakeFactor = 1,
		},
		Wheels = {
			self:AddWheel( {
				pos = Vector(-40,120,-15),
				mdl = WheelModel,
				mdl_ang = Angle(0,180,0),
			} ),

			self:AddWheel( {
				pos = Vector(40,120,-15),
				mdl = WheelModel,
				mdl_ang = Angle(0,0,0),
			} ),
		},
		Suspension = {
			Height = 2,
			MaxTravel = 25,
			ControlArmLength = 50,
			SpringConstant = 35000,
			SpringDamping = 2000,
			SpringRelativeDamping = 2000,
		},
	} )

	local RearAxle1 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,90,0),
			SteerType = LVS.WHEEL_STEER_NONE,
			TorqueFactor = 0.5,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = {
			self:AddWheel( {
				pos = Vector(-40,-70,-15),
				mdl = WheelModel,
				mdl_ang = Angle(0,180,0),
			} ),

			self:AddWheel( {
				pos = Vector(40,-70,-15),
				mdl = WheelModel,
				mdl_ang = Angle(0,0,0),
			} ),
		},
		Suspension = {
			Height = 10,
			MaxTravel = 15,
			ControlArmLength = 50,
			SpringConstant = 35000,
			SpringDamping = 1000,
			SpringRelativeDamping = 1000,
		},
	} )

	local RearAxle2 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(0,90,0),
			SteerType = LVS.WHEEL_STEER_ACKERMANN,
			SteerAngle = 20,
			TorqueFactor = 0.5,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = {
			self:AddWheel( {
				pos = Vector(-40,-140,-15),
				mdl = WheelModel,
				mdl_ang = Angle(0,180,0),
			} ),

			self:AddWheel( {
				pos = Vector(40,-140,-15),
				mdl = WheelModel,
				mdl_ang = Angle(0,0,0),
			} ),
		},
		Suspension = {
			Height = 10,
			MaxTravel = 15,
			ControlArmLength = 50,
			SpringConstant = 35000,
			SpringDamping = 1000,
			SpringRelativeDamping = 1000,
		},
	} )
end
