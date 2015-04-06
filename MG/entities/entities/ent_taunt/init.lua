AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

/*---------------------------------------------------------
Initialize
---------------------------------------------------------*/
function ENT:Initialize()
	
	self:SetModel( "models/Gibs/HGIBS.mdl" )
	self.Entity:SetMoveType( MOVETYPE_NOCLIP )
	self.Time = 0
end

/*---------------------------------------------------------
Think
---------------------------------------------------------*/
function ENT:Think()
	self.Time = self.Time + 1
	local pos = self.Entity:GetPos()
	self:SetPos(Vector(pos.x, pos.y, pos.z + 1))
	if self.Time == 25 then
		self:Remove()
	end

end

/*---------------------------------------------------------
Disable
---------------------------------------------------------*/

/*---------------------------------------------------------
PhysicsCollided
---------------------------------------------------------*/
function ENT:PhysicsCollide( data, phys )
end

/*---------------------------------------------------------
Use
---------------------------------------------------------*/
function ENT:Use( activator, caller )
end
