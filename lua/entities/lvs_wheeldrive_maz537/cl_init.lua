include( "shared.lua" )

function ENT:OnSpawn()
	-- self:CreateBonePoseParameter( "bonnet", self:LookupBone( "bonnet" ), nil, Angle( 70), nil, nil )

	self:CreateBonePoseParameter( "pedal_clutch", self:LookupBone( "pedal_clutch" ), nil, Angle( 20), nil, nil )
	self:CreateBonePoseParameter( "pedal_brake", self:LookupBone( "pedal_brake" ), nil, Angle( 20), nil, nil )
	self:CreateBonePoseParameter( "pedal_throttle", self:LookupBone( "pedal_throttle" ), nil, Angle( 20), nil, nil )
    
	-- self:CreateBonePoseParameter( "stick_handbrake", self:LookupBone( "stick_handbrake" ), nil, Angle( 30), nil, nil )
    
	self:CreateBonePoseParameter( "stick_gear", self:LookupBone( "stick_gear_pitch" ), nil, Angle(-30), nil, nil )
end

function ENT:UpdatePoseParameters( steer, speed_kmh, engine_rpm, throttle, brake, handbrake, clutch, gear, temperature, fuel, oil, ammeter )
	self:SetPoseParameter( "vehicle_steer", steer )

	self:SetBonePoseParameter( "pedal_throttle", throttle )
	self:SetBonePoseParameter( "pedal_clutch", clutch )
	self:SetBonePoseParameter( "pedal_brake", brake )

	-- self:SetBonePoseParameter( "stick_handbrake", handbrake )

	local GearIDtoPose = {
		[-1] = 0,
		[0] = 0.5,
		[1] = 1,
	}
	self:SetBonePoseParameter( "stick_gear", self:QuickLerp( "stick_gear", ( GearIDtoPose[ gear ] or 1 ), 2 ) )

	local EntTable = self:GetTable()

	local DriveWheel1 = self:GetNWEntity( "DriveWheel1" )
	local DriveWheel2 = self:GetNWEntity( "DriveWheel2" )

	local RPM = 0
	if IsValid( DriveWheel1 ) then
		RPM = RPM - DriveWheel1:GetRPM()
	end
	if IsValid( DriveWheel2 ) then
		RPM = RPM - DriveWheel2:GetRPM()
	end

	-- if ( self:GetSirenMode() >= 0 ) then
	--     self:SetPoseParameter( "siren_spin", CurTime() * 1000 + self:EntIndex() * 1337 )
    -- end

	EntTable.ShaftRotation = ( EntTable.ShaftRotation or 0 ) + RPM * FrameTime() * 6

	if ( EntTable.ShaftRotation > 360 ) then EntTable.ShaftRotation = EntTable.ShaftRotation - 360 end
	if ( EntTable.ShaftRotation < -360 ) then EntTable.ShaftRotation = EntTable.ShaftRotation + 360 end

	self:SetPoseParameter( "shaft", EntTable.ShaftRotation )
end

function ENT:OnEngineActiveChanged( Active )
end