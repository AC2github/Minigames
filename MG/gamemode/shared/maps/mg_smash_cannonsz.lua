local MAP = {}

MAP.Map = "mg_smash_cannonsz"
MAP.Name = "Smash Cannons"
MAP.Desc = "Default Garrysmod Map."
MAP.TeamBased = false
MAP.RoundBased = true
MAP.Red = { "weapon_knife" }
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

MAP.OnMapRestart = function( )
	if timer.IsTimer( "killerplayers" ) then
		timer.Destroy( "killplayers" )
	end
	
	timer.Create( "killplayers", 61, 1, function( ) 
		for k, v in pairs( player.GetAll( ) ) do
			if v:Team( ) == TEAM_RED then
				v:Spawn( )
			elseif v:Team( ) == TEAM_BLUE then
				v:SetPos( Vector( -4004.356934, 86.187737, -1479.184570 ) )
				v:SetHealth( 200 )
			end
		end
	end)
	
	for k, v in pairs( ents.GetAll( ) ) do
		if v:GetClass( ) == "cttele" then
			v:Remove( )
		end
	end
end

RegisterMap( MAP )