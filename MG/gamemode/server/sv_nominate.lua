local HasNominated = {}

local function PlayerHasNominated( pl )
	return table.HasValue( HasNominated, pl:SteamID( ) )
end

function Nominate( pl, map )
	if not map then return end
	local validmap = false
	
	for k, v in pairs( MapData ) do
		if MapData[k].ID == map then
			validmap = true
		end
	end
	
	if validmap == false then
		GAMEMODE:WriteToLog( "errors", pl:Name( ).." tried to nominate an invalid map: "..map )
		return 
	end
	
	if table.HasValue( VoteMaps, map ) then pl:ChatPrint( "This map is already in the votetable." ) return end
	if game.GetMap( ) == map then pl:ChatPrint( "You can't nominate this map." ) return end
	if #VoteMaps >= 8 then pl:ChatPrint( "You can't nominate anymore maps." ) return end
	if (PlayerHasNominated( pl ) == true) then pl:ChatPrint( "You already nominated a map." ) return end
	if MAPCHANGE == true then pl:ChatPrint( "You can't nominate at this time." ) return end
	
	table.insert( VoteMaps, map )
	table.insert( HasNominated, pl:SteamID( ) )
	
	PrintAll( "ADMIN", "Player <color=red>"..pl:Name( ).."</color> has nominated <color=red>"..map.."</color>." )
	
	for k, v in pairs( player.GetAll( ) ) do
		umsg.Start( "votemaps_reset", v )
		umsg.End( )
		
		GAMEMODE:SendMaps( v )
	end
end

concommand.Add( "mg_nominate", function( pl, cmd, args )
	if not args[1] then return end
	
	Nominate( pl, args[1] )
end)

chatcommand.Add( "nominate", function( pl, cmd, args )
	if (PlayerHasNominated( pl ) == true) then pl:ChatPrint( "You already nominated a map." ) return end
	
	umsg.Start( "maps_reset", pl )
	umsg.End( )
	
	for k, v in pairs( MapData ) do
		umsg.Start( "maps", pl )
			umsg.String( MapData[k].ID )
		umsg.End( )
	end
	
	umsg.Start( "maps_menu", pl )
	umsg.End( )
end)