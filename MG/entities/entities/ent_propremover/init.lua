AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()
	self.Entity:SetColor(0, 0, 0, 0)
	self.Entity:SetModel( "" )
end

function ENT:Think( )
	for k, v in pairs( ents.GetAll( ) ) do 
		if v:GetClass( ) == "prop_physics" then
			if v:GetPos( ):Distance( self:GetPos( ) ) < 2000 then
				v:Remove( )
			end
		end
	end
end