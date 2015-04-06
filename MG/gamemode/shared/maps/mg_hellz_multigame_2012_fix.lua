local MAP = {}

MAP.Key = 30
MAP.Map = "mg_hellz_multigame_2012_fix"
MAP.Name = "HELLZ"
MAP.Desc = "Very fun map."
MAP.TeamBased = true
MAP.RoundBased = false
MAP.Red = {}
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

local spawns = { 
	Vector( -2833.6787, 3073.2585, -895.2849 ),
	Vector( -2814.6594, 1640.5634, -937.2540 ),
	Vector( -1625.4530, 3065.0425, -977.2326 ),
	Vector( -2815.0000, 4494.0273, -912.8005 ),
	Vector( -3967.0413, 3061.7866, -907.7165 )
}

MAP.OnMapRestart = function( )
	for k, v in pairs( ents.GetAll( ) ) do
		if v:GetClass( ) == "func_button" then
			if v:GetPos( ) == Vector( -960.0000, 648.0000, 2496.0000 ) then
				v:Remove( )
			end
			
			if v:GetPos( ) == Vector( -1664.0000, 2680.0000, 2528.0000 ) then
				v:Remove( )
			end
		end
	end
	
	for k, v in pairs( spawns ) do
		local ent = ents.Create( "weapon_mg_ak47" )
		ent:SetPos( spawns[k] )
		ent:Spawn( )
	end
end

RegisterMap( MAP )