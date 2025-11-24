AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include( "shared.lua" )

function ENT:OnSpawn( pObj )
	self:SpawnWheels()

	self:AddTrailerHitch( Vector( 5.984, 0.000, 2.002) * 40, LVS.HITCHTYPE_FEMALE )

	self:AddSupport( {
		pos = Vector( 2.187, 0.490, 0.125) * 40,
		mass = 150,
	} )

	self:AddSupport( {
		pos = Vector( 2.187,-0.490, 0.125) * 40,
		mass = 150,
	} )

	self:SetSupports( true )
end

function ENT:SpawnWheels()
	local WheelModel = "models/thegordonbeeman/vehicles/lowboy_semi-trailer_wheel.mdl"

	local Wheel1L = self:AddWheel( {
		pos = Vector(-2.235, 1.240, 0.450) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0, 90),
		radius = 0.499 * 40,
	} )
	local Wheel1R = self:AddWheel( {
		pos = Vector(-2.235,-1.244, 0.450) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0,-90),
		radius = 0.499 * 40,
	} )
	local Axle1 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(),
			SteerType = LVS.WHEEL_STEER_NONE,
			SteerAngle = 0,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { Wheel1L, Wheel1R },
			Suspension = {
			Height = 3,
			MaxTravel = 1,
			SpringConstant = 40000,
			SpringDamping = 1000,
			SpringRelativeDamping = 1000,
		},
	} )

	-- self:CreateRigControler( "1l", Wheel1L, 40 * 0.714, 40 * 0.398 )
	-- self:CreateRigControler( "1r", Wheel1R, 40 * 0.714, 40 * 0.398 )

	local Wheel2L = self:AddWheel( {
		pos = Vector(-3.408, 1.240, 0.450) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0, 90),
		radius = 0.499 * 40,
	} )
	local Wheel2R = self:AddWheel( {
		pos = Vector(-3.408,-1.244, 0.450) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0,-90),
		radius = 0.499 * 40,
	} )
	local Axle2 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(),
			SteerType = LVS.WHEEL_STEER_NONE,
			SteerAngle = 0,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
		Wheels = { Wheel2L, Wheel2R },
			Suspension = {
			Height = 3,
			MaxTravel = 1,
			SpringConstant = 40000,
			SpringDamping = 1000,
			SpringRelativeDamping = 1000,
		},
	} )

	-- self:CreateRigControler( "2l", Wheel2L, 40 * 0.714, 40 * 0.398 )
	-- self:CreateRigControler( "2r", Wheel2R, 40 * 0.714, 40 * 0.398 )

	local Wheel3L = self:AddWheel( {
		pos = Vector(-4.583, 1.240, 0.450) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0, 90),
		radius = 0.499 * 40,
	} )
	local Wheel3R = self:AddWheel( {
		pos = Vector(-4.583,-1.244, 0.450) * 40,
		mdl = WheelModel,
		mdl_ang = Angle(0,-90),
		radius = 0.499 * 40,
	} )
	local Axle3 = self:DefineAxle( {
		Axle = {
			ForwardAngle = Angle(),
			SteerType = LVS.WHEEL_STEER_NONE,
			SteerAngle = 0,
			BrakeFactor = 1,
			UseHandbrake = true,
		},
			Wheels = { Wheel3L, Wheel3R },
			Suspension = {
			Height = 3,
			MaxTravel = 1,
			SpringConstant = 40000,
			SpringDamping = 1000,
			SpringRelativeDamping = 1000,
		},
	} )

	-- self:CreateRigControler( "3l", Wheel3L, 40 * 0.714, 40 * 0.398 )
	-- self:CreateRigControler( "3r", Wheel3R, 40 * 0.714, 40 * 0.398 )
end

-- Coupling and supports

ENT.SupportEntities = {}

function ENT:AddSupport( data )
	if not data.pos or not isvector( data.pos ) then return end

	data.mass = data.mass or 100

	local SupportEntity = ents.Create( "prop_physics" )

	if not IsValid( SupportEntity ) then return end

	SupportEntity:SetModel( "models/props_junk/PopCan01a.mdl" )
	SupportEntity:SetPos( self:LocalToWorld( data.pos ) )
	SupportEntity:SetAngles( self:GetAngles() )
	SupportEntity:Spawn()
	SupportEntity:Activate()
	SupportEntity:PhysicsInitSphere( 5, "default_silent" )
	SupportEntity:SetNoDraw( true ) 
	SupportEntity:SetCollisionGroup( COLLISION_GROUP_PLAYER )
	SupportEntity.DoNotDuplicate = true
	SupportEntity.BaseMass = data.mass

	self:DeleteOnRemove( SupportEntity )
	SupportEntity:SetOwner( self )

	constraint.Weld( self, SupportEntity, 0, 0, 0, false, false )

	local pObj = SupportEntity:GetPhysicsObject()

	if not IsValid( pObj ) then
		SupportEntity:Remove()
		return
	end

	pObj:SetMass( data.mass )

	table.insert( self.SupportEntities, SupportEntity )
end

DEFINE_BASECLASS( "lvs_base_wheeldrive_trailer" )
function ENT:OnCoupleChanged( targetVehicle, targetHitch, active )
	BaseClass.OnCoupleChanged( self, targetVehicle, targetHitch, active )

	if not IsValid( targetVehicle ) then return end

	local Seats = targetVehicle:GetPassengerSeats()
	table.insert( Seats, targetVehicle:GetDriverSeat() )

	for _, Pod in pairs( Seats ) do
		if not IsValid( Pod ) then continue end

		local CurDist = Pod:GetCameraDistance()

		if active then
			Pod._OldCamDistance = CurDist
			Pod:SetCameraDistance( 1 )
		else
			if Pod._OldCamDistance then
				Pod:SetCameraDistance( Pod._OldCamDistance )
			end
		end
	end
end

function ENT:OnCoupled( targetVehicle, targetHitch )
	self:SetSupports( false )

	for _, ent in ipairs( self.SupportEntities ) do
		if not IsValid( ent ) or not IsValid( ent:GetPhysicsObject() ) then continue end

		ent:GetPhysicsObject():SetMass( 1 )
	end
end

function ENT:OnDecoupled( targetVehicle, targetHitch )
	self:SetSupports( true )

	for _, ent in ipairs( self.SupportEntities ) do
		if not IsValid( ent ) or not IsValid( ent:GetPhysicsObject() ) then continue end

		ent:GetPhysicsObject():SetMass( ent.BaseMass or 100 )
	end
end

function ENT:OnStartDrag( caller, activator )
	self:SetSupports( false )

	for _, ent in ipairs( self.SupportEntities ) do
		if not IsValid( ent ) or not IsValid( ent:GetPhysicsObject() ) then continue end

		ent:GetPhysicsObject():SetMass( 1 )
	end
end

function ENT:OnStopDrag( caller, activator )
	self:SetSupports( true )

	for _, ent in ipairs( self.SupportEntities ) do
		if not IsValid( ent ) or not IsValid( ent:GetPhysicsObject() ) then continue end

		ent:GetPhysicsObject():SetMass( ent.BaseMass or 100 )
	end
end