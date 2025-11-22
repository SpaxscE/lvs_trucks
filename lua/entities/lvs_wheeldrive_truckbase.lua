
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

ENT.TransShiftSound = "common/null.wav"

sound.Add( {
	name = "LVS.Brake.Release",
	channel = CHAN_STATIC,
	level = 75,
	volume = 1,
	sound = {
		"lvs/vehicles/generic/pneumatic_brake_release_01.wav",
		"lvs/vehicles/generic/pneumatic_brake_release_02.wav",
		"lvs/vehicles/generic/pneumatic_brake_release_03.wav",
		"lvs/vehicles/generic/pneumatic_brake_release_04.wav",
	}
} )

sound.Add( {
	name = "LVS.Brake.Apply",
	channel = CHAN_STATIC,
	level = 75,
	volume = 1,
	sound = "lvs/vehicles/generic/pneumatic_brake_pull.wav",
} )

if CLIENT then

	ENT.IconEngine = Material( "lvs/engine.png" )
	ENT.IconFuel = Material( "lvs/fuel.png" )

	local WaveScale = 0
	local WaveMaterial = Material( "effects/select_ring" )
	local oldThrottleActive = false
	local oldReverse = false
	local oldGear = -1

	function ENT:LVSHudPaintInfoText( X, Y, W, H, ScrX, ScrY, ply )
		if self:GetRacingHud() then return end

		local EntTable = self:GetTable()

		local T = CurTime()

		if (EntTable._nextRefreshVel or 0) < T then
			EntTable._nextRefreshVel = T + 0.1
			EntTable._refreshVel = self:GetVelocity():Length()
		end

		local kmh = math.Round( (EntTable._refreshVel or 0) * 0.09144,0)
		draw.DrawText( "km/h ", "LVS_FONT", X + 72, Y + 35, color_white, TEXT_ALIGN_RIGHT )
		draw.DrawText( kmh, "LVS_FONT_HUD_LARGE", X + 72, Y + 20, color_white, TEXT_ALIGN_LEFT )

		if ply ~= self:GetDriver() then return end

		local Throttle = self:GetThrottle()
		local MaxThrottle = self:GetMaxThrottle()

		if MaxThrottle < 1 and Throttle > 0 then
			Throttle = math.min( Throttle / MaxThrottle, 1 )
		end

		local Col = Throttle <= 1 and color_white or Color(0,0,0,255)
		local hX = X + W - H * 0.5
		local hY = Y + H * 0.25 + H * 0.25

		local fueltank = self:GetFuelTank()

		if IsValid( fueltank ) and fueltank:GetFuel() <= 0 then
			surface.SetMaterial( EntTable.IconFuel )
		else
			surface.SetMaterial( EntTable.IconEngine )
		end

		surface.SetDrawColor( 0, 0, 0, 200 )
		surface.DrawTexturedRectRotated( hX + 4, hY + 1, H * 0.5, H * 0.5, 0 )
		surface.SetDrawColor( color_white )
		surface.DrawTexturedRectRotated( hX + 2, hY - 1, H * 0.5, H * 0.5, 0 )

		if not self:GetEngineActive() then
			draw.SimpleText( "X" , "LVS_FONT",  hX, hY, Color(0,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		else
			oldThrottleActive = false
		
			local Reverse = self:GetReverse()

			if oldReverse ~= Reverse then
				oldReverse = Reverse

				WaveScale = 1
			end

			local IsManual = self:IsManualTransmission()
			local Gear = self:GetGear()

			if oldGear ~= Gear then
				oldGear = Gear

				WaveScale = 1
			end

			if WaveScale > 0 then
				WaveScale = math.max( WaveScale - RealFrameTime() * 2, 0 )

				local WaveRadius = (1 - WaveScale) * H * 1.5

				surface.SetDrawColor( 0, 127, 255, 255 * WaveScale ^ 2 )
				surface.SetMaterial( WaveMaterial )

				surface.DrawTexturedRectRotated( hX, hY, WaveRadius, WaveRadius, 0 )

				if not Reverse and not IsManual then
					draw.SimpleText( "D" , "LVS_FONT",  hX, hY, Color(0,0,0,math.min(800 * WaveScale ^ 2,255)), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
			end

			if IsManual then
				draw.SimpleText( (Reverse and -1 or 1) * Gear , "LVS_FONT",  hX, hY, Color(0,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			else
				if Reverse then
					draw.SimpleText( "R" , "LVS_FONT",  hX, hY, Color(0,0,0,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
			end
		end

		self:LVSDrawCircle( hX, hY, H * 0.35, math.min( Throttle, 1 ) )

		if Throttle > 1 then
			draw.SimpleText( "+"..math.Round((Throttle - 1) * 100,0).."%" , "LVS_FONT",  hX, hY, Col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
	end

	return
end

function ENT:LerpBrake( Brake )
	local Old = self:GetBrake()

	BaseClass.LerpBrake( self, Brake )

	local New = self:GetBrake()

	self:OnBrakeChanged( Old, New )
end

function ENT:OnBrakeChanged( Old, New )
	if Old == New then return end

	local BrakeActive = New ~= 0

	if BrakeActive == self._OldBrakeActive then return end

	self._OldBrakeActive = BrakeActive

	if BrakeActive then
		if self:GetVelocity():Length() > 100 then
			self:EmitSound( self.WheelBrakeApplySound, 75, 100, 1 )
		end

		return
	end

	self:EmitSound( self.WheelBrakeReleaseSound, 75, math.random(90,110), 1 )
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

function ENT:OnHandbrakeActiveChanged( Active )
	if Active then
		if self:GetVelocity():Length() > 100 then
			self:EmitSound( self.WheelBrakeApplySound, 75, 100, 1 )
			self._AllowReleaseSound = true
		end
	else
		if self._AllowReleaseSound then
			self._AllowReleaseSound = nil
			self:EmitSound( self.WheelBrakeReleaseSound, 75, math.random(90,110), 1 )
		end
	end
end
