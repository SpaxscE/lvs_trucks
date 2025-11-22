
AddCSLuaFile()

ENT.Base = "lvs_base_wheeldrive"
DEFINE_BASECLASS( "lvs_base_wheeldrive" )

ENT.PrintName = "[LVS] Truck Base"
ENT.Author = "Luna"
ENT.Information = "Luna's Vehicle Script"
ENT.Category = "[LVS] - Trucks - Pack"

ENT.Spawnable			= false
ENT.AdminSpawnable		= false

ENT.WheelBrakeReleaseSound = "lvs/vehicles/generic/truck_brake_release.ogg"

if CLIENT then return end

function ENT:LerpBrake( Brake )
	local Old = self:GetBrake()

	BaseClass.LerpBrake( self, Brake )

	local New = self:GetBrake()

	self:OnBrakeChanged( Old, New )
end

function ENT:OnBrakeChanged( Old, New )
	local BrakeActive = New ~= 0

	if BrakeActive == self._OldBrakeActive then return end

	self._OldBrakeActive = BrakeActive

	for _, wheel in pairs( self:GetWheels() ) do
		if not IsValid( wheel ) then continue end

		if not BrakeActive and wheel:IsRotationLocked() then
			self:EmitSound( self.WheelBrakeReleaseSound, 75, math.random(90,110), 0.25 )

			break
		end
	end
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
