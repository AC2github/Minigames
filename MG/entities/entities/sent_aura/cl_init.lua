include("shared.lua")

function ENT:Initialize()
	self:DrawShadow(false)
	self:SetRenderBounds( Vector(-40, -40, -18), Vector(40, 40, 84) )
end

function ENT:DrawTranslucent()
	local owner = self.Entity:GetOwner( )
	if not owner then return end
	
	if (owner == LocalPlayer( )) and (THIRDPERSON == false) then return end
	if owner:Team( ) == TEAM_SPEC then return end
	
	if not owner.PlayerData then return end
	local aura = owner.PlayerData["aura"]
	if not aura then return end
	
	for k, v in pairs( AuraPos[aura] ) do
		local bone = owner:LookupBone( AuraPos[aura][k].Bone )
		local pos, ang = owner:GetBonePosition(bone)
		local angle = 0
		local size = AuraPos[aura][k].Size or 24
		local AddPos = AuraPos[aura][k].Pos or Vector( 0, 0, 0 )
		
		render.SetMaterial( Material( AuraPos[aura][k].Material ) )
		
		if AuraPos[aura][k].Right then
			ang:RotateAroundAxis( ang:Right(), RealTime() * 360)
			angle = ang:Forward() * 8
		end
		
		if AuraPos[aura][k].Up then
			ang:RotateAroundAxis( ang:Up(), RealTime() * 360)
			angle = ang:Forward() * 8
			angle = ang:Right() * 8
		end
		
		if AuraPos[aura][k].Forward then
			ang:RotateAroundAxis( ang:Forward(), RealTime() * 360)
			angle = ang:Right() * 8
		end
		
		if AuraPos[aura][k].Move then
			render.DrawSprite( (pos + AddPos) + angle, size, size, AuraPos[aura][k].Color or Color( 255, 0, 0, 200 ))
		else
			render.DrawSprite( pos + AddPos, size, size, AuraPos[aura][k].Color or Color( 255, 0, 0, 200 ))
		end
	end
end
