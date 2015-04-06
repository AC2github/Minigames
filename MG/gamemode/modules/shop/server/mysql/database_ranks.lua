
local TOPPLAYERS = {}

function DATABASE:GetTopMoney( pl )
	DATABASE:Query( "SELECT name, money FROM player_stats ORDER BY money DESC LIMIT 5", function( result ) 
		if result and result[1] then
			TOPPLAYERS["money"] = {}
			local players = result
			for k, v in pairs( players ) do
				table.insert( TOPPLAYERS["money"], { Name = players[k][1], Money = players[k][2] } )
			end
		
			for k, v in pairs( TOPPLAYERS["money"] ) do
				umsg.Start( "player_ranks_money", pl )
					umsg.String( glon.encode(TOPPLAYERS["money"][k]) )
				umsg.End( )
			end
		end
	end)
end

function DATABASE:GetTopPoints( pl )
	local data = DATABASE:Query( "SELECT name, points FROM player_data ORDER BY points DESC LIMIT 5", function( result )
		if result and result[1] then
			TOPPLAYERS["points"] = {}
			local players = result
			for k, v in pairs( players ) do
				table.insert( TOPPLAYERS["points"], { Name = players[k][1], Points = players[k][2] } )
			end
		
			for k, v in pairs( TOPPLAYERS["points"] ) do
				umsg.Start( "player_ranks_points", pl )
					umsg.String( glon.encode(TOPPLAYERS["points"][k]) )
				umsg.End( )
			end
		end
	end)
end