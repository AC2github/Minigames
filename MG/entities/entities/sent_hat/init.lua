AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )

function ENT:Initialize()
	self.Entity:DrawShadow(false)
	self.Entity:SetSolid(false)
end

function ENT:SetHat( hat )
	if HatPos[hat] == nil then return end
	self.Entity:SetModel( HatPos[hat].Model )
	self.HatType = hat
end

function ENT:RemoveHat()
    self.Entity:Remove()
end

function ENT:PhysicsCollide( data, physobj )
end

function ENT:OnTakeDamage( dmginfo )
end

function ENT:Use( activator, caller )
end

function ENT:UpdateTransmitState()
	return TRANSMIT_PVS
end




