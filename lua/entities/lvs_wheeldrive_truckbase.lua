
AddCSLuaFile()

ENT.Base = "lvs_base_wheeldrive"
DEFINE_BASECLASS( "lvs_base_wheeldrive" )

ENT.PrintName = "[LVS] Truck Base"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Trucks - Pack"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.WheelBrakeApplySound = "LVS.Brake.Apply"
ENT.WheelBrakeReleaseSound = "LVS.Brake.Release"

sound.Add( {
	name = "LVS.Brake.Release",
	channel = CHAN_STATIC,
	level = 75,
	volume = 0.25,
	sound = "lvs/vehicles/generic/truck_brake_release.ogg",
} )

sound.Add( {
	name = "LVS.Brake.Apply",
	channel = CHAN_STATIC,
	level = 75,
	volume = 0.25,
	sound = {
		"lvs/vehicles/generic/truck_brake1.ogg",
		"lvs/vehicles/generic/truck_brake2.ogg",
		"lvs/vehicles/generic/truck_brake3.ogg",
	}
} )

if CLIENT then return end

function ENT:LerpBrake( Brake )
	local Old = self:GetBrake()

	BaseClass.LerpBrake( self, Brake )

	local New = self:GetBrake()

	self:OnBrakeChanged( Old, New )
end

function ENT:OnBrakeChanged( Old, New )
	if Old == New then return end

	local BrakeActive = New ~= 0 and self:GetVelocity():Length() < 100

	if BrakeActive == self._OldBrakeActive then return end

	self._OldBrakeActive = BrakeActive

	if BrakeActive then return end

	self:EmitSound( self.WheelBrakeReleaseSound, 75, math.random(90,110), 0.25 )
end

function ENT:PostInitialize( PObj )
	BaseClass.PostInitialize( self, PObj )

	self:OnCoupleChanged( nil, nil, false )
end

function ENT:OnCoupleChanged( targetVehicle, targetHitch, active )
	self.HitchIsHooked = active
end

function ENT:GetEngineTorque()
	local TargetValue = 1

	if not self:IsManualTransmission() then
		TargetValue = self.HitchIsHooked and 1 or math.min( 0.5 + math.max( (self:GetVelocity():Length() / self.MaxVelocity) ^ 2 - 0.5, 0 ), 1 )
	end

	if TargetValue ~= self:GetMaxThrottle() then
		self:SetMaxThrottle( TargetValue )
	end

	return BaseClass.GetEngineTorque( self )
end

--ENT.TransShiftSound = "lvs/vehicles/generic/gear_shift.wav"

function ENT:OnHandbrakeActiveChanged( Active )
	if Active then
		if self:GetVelocity():Length() > 100 then
			self:EmitSound( self.WheelBrakeApplySound, 75, 100, 0.25 )
			self._AllowReleaseSound = true
		end
	else
		if self._AllowReleaseSound then
			self._AllowReleaseSound = nil
			self:EmitSound( self.WheelBrakeReleaseSound, 75, math.random(90,110), 0.25 )
		end
	end
end
