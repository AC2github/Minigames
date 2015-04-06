AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

/*---------------------------------------------------------
Initialize
---------------------------------------------------------*/
function ENT:Initialize()
	
end

/*---------------------------------------------------------
Think
---------------------------------------------------------*/
function ENT:Think()

end

/*---------------------------------------------------------
Disable
---------------------------------------------------------*/

/*---------------------------------------------------------
PhysicsCollided
---------------------------------------------------------*/
function ENT:KeyValue( key, value )
	
end

/*---------------------------------------------------------
Use
---------------------------------------------------------*/
function ENT:OnRemove( )
end

function ENT:PassesTriggerFilters(ent)

end

function ENT:StartTouch( hitEnt )
	if hitEnt:IsValid() and hitEnt:IsPlayer() then
		hitEnt:Give("weapon_crowbar")
	end
end

function ENT:Touch( hitEnt )
end
 
 function ENT:AcceptInput( name, activator, caller, data )

end

function ENT:EndTouch( ent )
end