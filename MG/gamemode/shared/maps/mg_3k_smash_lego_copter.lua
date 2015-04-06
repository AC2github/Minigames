local MAP = {}

MAP.Key = 30
MAP.Map = "mg_3k_smash_lego_copter"
MAP.Name = "Lego Smash"
MAP.Desc = "Very fun map."
MAP.TeamBased = true
MAP.RoundBased = false
MAP.Red = {}
MAP.Blue = {}
MAP.Reward = 100

MAP.OnMapRestart = function( )
	if timer.IsTimer( "giveplayers" ) then
		timer.Destroy( "giveplayers" )
	end
	
	timer.Create( "killplayers", 85, 1, function( ) 
		for k, v in pairs( player.GetAll( ) ) do
			v:Give( "weapon_crowbar" )
		end
	end)
end

RegisterMap( MAP )