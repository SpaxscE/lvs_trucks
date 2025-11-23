include( "shared.lua" )

function ENT:OnSpawn()
	-- self:CreateBonePoseParameter( "bonnet", self:LookupBone( "bonnet" ), nil, Angle( 70), nil, nil )

	self:CreateBonePoseParameter( "pedal_clutch", self:LookupBone( "pedal_clutch" ), nil, Angle( 20), nil, nil )
	self:CreateBonePoseParameter( "pedal_brake", self:LookupBone( "pedal_brake" ), nil, Angle( 20), nil, nil )
	self:CreateBonePoseParameter( "pedal_throttle", self:LookupBone( "pedal_throttle" ), nil, Angle( 20), nil, nil )
    
	self:CreateBonePoseParameter( "stick_handbrake", self:LookupBone( "stick_handbrake" ), nil, Angle( 30), nil, nil )
    
	self:CreateBonePoseParameter( "stick_gear", self:LookupBone( "stick_gear" ), nil, Angle(-30), nil, nil )
end

function ENT:UpdatePoseParameters( steer, speed_kmh, engine_rpm, throttle, brake, handbrake, clutch, gear, temperature, fuel, oil, ammeter )
	self:SetPoseParameter( "vehicle_steer", steer )

	self:SetBonePoseParameter( "pedal_throttle", throttle )
	self:SetBonePoseParameter( "pedal_clutch", clutch )
	self:SetBonePoseParameter( "pedal_brake", brake )

	self:SetBonePoseParameter( "stick_handbrake", handbrake )

	local GearIDtoPose = {
		[-1] = 0,
		[0] = 0.5,
		[1] = 1,
	}
	self:SetBonePoseParameter( "stick_gear", self:QuickLerp( "stick_gear", ( GearIDtoPose[ gear ] or 1 ), 2 ) )

	local EntTable = self:GetTable()

	local RPM = 0
	for _, wheel in pairs( self:GetWheels() ) do
		RPM = RPM + wheel:GetRPM()
	end

	EntTable.ShaftRotation = (EntTable.ShaftRotation or 0) + RPM * FrameTime() * 2

	if EntTable.ShaftRotation > 360 then EntTable.ShaftRotation = EntTable.ShaftRotation - 360 end
	if EntTable.ShaftRotation < -360 then EntTable.ShaftRotation = EntTable.ShaftRotation + 360 end

	self:SetPoseParameter( "shaft", EntTable.ShaftRotation )
end

function ENT:OnEngineActiveChanged( Active )
end