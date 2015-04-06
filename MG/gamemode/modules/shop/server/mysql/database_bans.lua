
function DATABASE:GetBans( )
	DATABASE:Query( "SELECT * FROM player_bans", function( result )
		if result then
			BANS = {}
			for k, v in pairs( result ) do
				table.insert( BANS, { result[k][1], result[k][2], result[k][4] } )
			end
		end
	end)
end

DATABASE:GetBans( )