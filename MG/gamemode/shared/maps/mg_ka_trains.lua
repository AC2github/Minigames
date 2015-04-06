local MAP = {}

MAP.Key = 7
MAP.Map = "mg_ka_trains"
MAP.Name = "Trains"
MAP.Desc = "Very fun map."
MAP.TeamBased = true
MAP.RoundBased = false
MAP.Red = { "weapon_crowbar" }
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

local spawns_health = {
	Vector( 1160, -312, 230),
	Vector( 1647, -319, 230),
	Vector( 912, -64, 355 ),
	Vector( 333, -318, 85 )
}

MAP.OnMapRestart = function( )
	for k, v in pairs( spawns_health ) do
		local ent = ents.Create( "ent_heal" )
		ent:SetPos( spawns_health[k] )
		ent:Spawn( )
	end
	
	local weapon = ents.Create( "ent_weapon" )
	weapon:SetWeapon( "weapon_mg_deagle" )
	weapon:SetPos( Vector( -590, -321, 55) )
	weapon:Spawn( )
end

RegisterMap( MAP )