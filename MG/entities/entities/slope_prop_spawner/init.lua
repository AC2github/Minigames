AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local propmodels = { 
	"models/props_junk/TrashDumpster01a.mdl",
	"models/props_junk/TrashDumpster02.mdl",
	"models/props_wasteland/cargo_container01.mdl",
	"models/props_lab/blastdoor001c.mdl",
	"models/props_wasteland/controlroom_storagecloset001a.mdl",
	"models/props_c17/furnitureStove001a.mdl",
	"models/props_trainstation/train001.mdl",
}
	
function ENT:Initialize()
	self.Entity:SetColor(0, 0, 0, 0)
	self.Entity:SetModel( "" )
	self.Entity.LastSpam = 0
end

function ENT:Start( )
	self.Entity.CanSpam = true
end

function ENT:Stop( )
	self.Entity.CanSpam = false
end

function ENT:Think( )
	if not (self.Entity.LastSpam >= CurTime()) and (self.Entity.CanSpam == true) and math.random( 1 , 15 ) == 4 then
		self.Prop = ents.Create( "prop_physics" )
		self.Prop:SetPos( self.Entity:GetPos( ) )
		self.Prop:SetModel( table.Random( propmodels ) )
		self.Prop:Spawn( )
		self.Prop:SetVelocity( Vector( math.random( -1000, 1000 ), math.random( -1000, 1000 ), math.random( -1000, 1000 ) ) )
		
		self.Phys = self.Prop:GetPhysicsObject()
		
		if (self.Phys:IsValid()) then
			self.Phys:Wake()
		end

		self.Phys:SetMass( 100000 )
		
		self.LastSpam = 15
	end
end