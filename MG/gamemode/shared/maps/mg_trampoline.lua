local MAP = {}

MAP.Key = 13
MAP.Map = "mg_trampoline"
MAP.Name = "Trampoline"
MAP.Desc = "Very fun map."
MAP.TeamBased = true
MAP.RoundBased = false
MAP.Red = { "weapon_mg_m3" }
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

MAP.OnMapRestart = function( )
	for k, v in pairs( ents.GetAll( ) ) do 
		if v:GetClass( ) == "func_breakable" then
			v:Fire( "Break" ) 
		end 
	end
end

RegisterMap( MAP )