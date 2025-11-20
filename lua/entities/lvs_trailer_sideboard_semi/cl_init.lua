include( "shared.lua" )

function ENT:OnSpawn() end

function ENT:UpdatePoseParameters( steer, speed_kmh, engine_rpm, throttle, brake, handbrake, clutch, gear, temperature, fuel, oil, ammeter )
	local Supports = self:GetSupports()

	local CT = CurTime()

	if ( Supports ) then
        self._SupportsTime = CT + 0.25
    end

	local SupportsActive = ( self._SupportsTime or 0 ) > CT

	self:SetPoseParameter( "supports", self:QuickLerp( "supports", ( SupportsActive and 1 or 0 ), 10 ) )
end