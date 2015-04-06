if SERVER then AddCSLuaFile("shared.lua") end

if CLIENT then
   ENT.PrintName = "slope_winner"
end

ENT.Type = "anim"
ENT.Model = Model("models/Gibs/HGIBS.mdl")

function ENT:Initialize()
	self.Entity:SetModel(self.Model)
	--self.Entity:SetColor( 0, 0, 0, 0 )

	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	self.Entity:SetCollisionGroup(COLLISION_GROUP_NONE)

	if SERVER then
		self.Entity:SetUseType(SIMPLE_USE)
	end
end

if CLIENT then
	function ENT:Draw( )
		self.Particles = {}
		self.Emitter = ParticleEmitter( self:GetPos( ) )
		
		self.Entity:SetModelScale( Vector( 3, 3, 3 ) )
		local partSize = math.Rand( 10, 15 )
		
		self.Particles[1] = self.Emitter:Add( "sprites/light_glow02_add", self:GetPos( ))
		self.Particles[1]:SetVelocity( Vector( math.random( -100, 100 ), math.random( -100, 100 ), math.random( -100, 100 ) ) )
		self.Particles[1]:SetDieTime( 1.5 )
		self.Particles[1]:SetStartAlpha( 255 )
		self.Particles[1]:SetEndAlpha( 255 )
		self.Particles[1]:SetStartSize( partSize )
		self.Particles[1]:SetEndSize( 0 )
		self.Particles[1]:SetRoll( 1 )
		self.Particles[1]:SetColor( math.random( 70, 90 ), math.random( 70, 200 ), math.random( 30, 70 ) ) 
		
		local ang = self.Entity:GetAngles( )
		
		ang:RotateAroundAxis(ang:Up(), 1)
		self:SetAngles(ang)
		
		self:DrawModel( )
	end
end

if SERVER then
	function ENT:Use( caller, activator )
		for k, v in pairs( player.GetAll( ) ) do
			if v:Team( ) == TEAM_BLUE then
				if not (activator == v) then
					v:Kill( )
				end
			end
		end
	end

	function ENT:Touch( hitEnt )
		if not hitEnt:IsPlayer( ) then return end
		for k, v in pairs( player.GetAll( ) ) do
			if v:Team( ) == TEAM_BLUE then
				if not (hitEnt == v) then
					v:Kill( )
					self.Entity:Remove( )
				end
			end
		end
	end
end