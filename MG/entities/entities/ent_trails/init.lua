AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

/*---------------------------------------------------------
Initialize
---------------------------------------------------------*/
function ENT:Initialize()
	
	self:SetModel( "models/Gibs/HGIBS.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )	
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	local phys = self.Entity:GetPhysicsObject()
	local trail = util.SpriteTrail(self.Entity, 0, Color(255, 255, 255, 255), false, 10, 10, 4, 1/(10+10)*0.5, string.gsub(self:GetOwner():Trail( ), "vtf", "vmt"))
	self.NextThink = CurTime() +  1

	if ( phys:IsValid() ) then
		phys:Wake()
		phys:SetMass( 1 )
	end

	self:GetPhysicsObject():SetMass( 1 )	
end

/*---------------------------------------------------------
Think
---------------------------------------------------------*/
function ENT:Think()
	
	self.lifetime = self.lifetime or CurTime() + 20
	if CurTime() > self.lifetime then
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
	
	local Ent = data.HitEntity
	if !(ValidEntity( Ent ) || Ent:IsWorld()) then return end

	if Ent:IsWorld() then
			util.Decal( "ManhackCut", data.HitPos + data.HitNormal, data.HitPos - data.HitNormal )
	elseif Ent.Health then
		if not(Ent:IsPlayer() || Ent:IsNPC() || Ent:GetClass() == "prop_ragdoll") then 
			util.Decal( "ManhackCut", data.HitPos + data.HitNormal, data.HitPos - data.HitNormal )
		end

		if (Ent:IsPlayer() || Ent:IsNPC() || Ent:GetClass() == "prop_ragdoll") then 
			local effectdata = EffectData()
			effectdata:SetStart( data.HitPos )
			effectdata:SetOrigin( data.HitPos )
			effectdata:SetScale( 1 )
			util.Effect( "BloodImpact", effectdata )
		end
	end

	self.Entity:SetOwner( NUL )
	
	self.Entity:Remove()
	
end

/*---------------------------------------------------------
Use
---------------------------------------------------------*/
function ENT:Use( activator, caller )
end
