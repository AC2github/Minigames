if SERVER then AddCSLuaFile("shared.lua") end

if CLIENT then
   ENT.PrintName = "ent_heal"
end

ENT.Type = "anim"
ENT.Model = Model("models/healthvial.mdl")

function ENT:Initialize()
	self.Entity:SetModel(self.Model)
	--self.Entity:SetColor( 0, 0, 0, 0 )

	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetCollisionGroup(COLLISION_GROUP_NONE)
end

if CLIENT then
	function ENT:Draw( )
		self.Particles = {}
		self.Emitter = ParticleEmitter( self:GetPos( ) )
		
		local partSize = math.Rand( 5, 10 )
		
		self.Entity:SetModelScale( Vector( 1.5, 1.5, 1.5 ) )
		
		self.Particles[1] = self.Emitter:Add( "sprites/light_glow02_add", self:GetPos( ))
		self.Particles[1]:SetVelocity( Vector( math.random( -100, 100 ), math.random( -100, 100 ), math.random( -100, 100 ) ) )
		self.Particles[1]:SetDieTime( 1.5 )
		self.Particles[1]:SetStartAlpha( 255 )
		self.Particles[1]:SetEndAlpha( 100 )
		self.Particles[1]:SetStartSize( partSize )
		self.Particles[1]:SetEndSize( 0 )
		self.Particles[1]:SetRoll( 1 )
		self.Particles[1]:SetColor( 0, 0, 255 ) 
		
		local ang = self.Entity:GetAngles( )
		
		ang:RotateAroundAxis(ang:Up(), 1)
		self:SetAngles(ang)
		
		self:DrawModel( )
	end
end

if SERVER then
	function ENT:Touch( hitEnt )
		if not hitEnt:IsPlayer( ) then return end
		hitEnt:SetHealth( 100 )
		self.Entity:Remove( )
	end
end