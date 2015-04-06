AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
	self:DrawShadow(false)
end

function ENT:Think()
end

function ENT:SetAura( aura )
	self.Entity:SetNWString( "aura", aura )
end
