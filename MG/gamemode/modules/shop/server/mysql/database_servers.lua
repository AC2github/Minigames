
function DATABASE:GetServers( )
	CreateAdverts( )
	
	DATABASE:Query( "SELECT * FROM player_servers", function( result )
		if result and result[1] then
			table.insert( adverts, "<color=red>"..result[1][1].."</color> is now playing with <color=red>"..result[1][2].."</color> players at <color=red>"..result[1][3].."</color>." )
		end
	end)
end