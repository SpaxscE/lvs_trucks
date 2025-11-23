include( "shared.lua" )

function ENT:OnSpawn()
	self:CreateBonePoseParameter( "door1_l", self:LookupBone( "door1_l" ), nil, Angle(-130), nil, nil )
	self:CreateBonePoseParameter( "door1_r", self:LookupBone( "door1_r" ), nil, Angle( 130), nil, nil )
end

function ENT:UpdatePoseParameters( steer, speed_kmh, engine_rpm, throttle, brake, handbrake, clutch, gear, temperature, fuel, oil, ammeter )
	local Supports = self:GetSupports()

	local T = CurTime()

	if Supports then
		self._SupportsTime = T + 0.25
	end

	local SupportsActive = (self._SupportsTime or 0) > T

	self:SetPoseParameter( "supports", self:QuickLerp( "supports", (SupportsActive and 1 or 0), 10 ) )
end