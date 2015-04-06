DATABASE = {}

DATABASE.Host = "GS03.DAEMONSERVERS.CO.UK"
DATABASE.Database = "selwynm_tc25583513135235770168605"
DATABASE.Username = "selwynm"
DATABASE.Password = "minigames"

DATABASE.Port = 3306
DATABASE.Module = require("tmysql")

DATABASE.Types = {
	[0] = "Connection has been made.",
	[1] = "Attempt to connect.",
	[2] = "Connection failure.",
	[3] = "Connection failure." 
}

DATABASE.QUERIES = {
	[0] = "The query has not been started yet.",
	[1] = "The query is executing on the DATABASE.",
	[2] = "The query has been run, and is now reading the data back.",
	[3] = "The query has completed (successfully or with an error)",
	[4] = "The query has been aborted.",
}

function DATABASE:Setup( )
	print( "[MYSQL] Checking for tables." )
	DATABASE:Query( "CREATE TABLE IF NOT EXISTS player_data ( name text, steamid text, ip text, time text, points int, online text )")
	DATABASE:Query( "CREATE TABLE IF NOT EXISTS player_stats ( name text, steamid text, money int, tokens int, model text, trail text, hat text, title text, titlecolor text, aura text, tag text)")
	DATABASE:Query( "CREATE TABLE IF NOT EXISTS player_shop ( steamid text, items text)")
	DATABASE:Query( "CREATE TABLE IF NOT EXISTS player_achievements ( steamid text, achievements text)")
	DATABASE:Query( "CREATE TABLE IF NOT EXISTS player_bans ( name text, steamid text, time text, reason text, admin text)")
	DATABASE:Query( "CREATE TABLE IF NOT EXISTS player_access ( name text, steamid text, access text, server text)")
	DATABASE:Query( "CREATE TABLE IF NOT EXISTS player_donate ( email text, steamid text, amount int )" )
	DATABASE:Query( "CREATE TABLE IF NOT EXISTS player_cards ( steamid text, cards int )" )
	DATABASE:Query( "CREATE TABLE IF NOT EXISTS player_servers( server text, player int, ip text )")
	print( "[MYSQL] Created tables for players." )
end

function DATABASE:Connect( )
	if not DATABASE.Module then 
		print( "[MYSQL] Module was not found!" )
		return 
	end
	
	DATABASE.Connection = tmysql.initialize( DATABASE.Host, DATABASE.Username, DATABASE.Password, DATABASE.Database, DATABASE.Port, 2, 2 )
	
	print( "[MYSQL] Connecting with "..DATABASE.Host )
	
	timer.Simple( 1, function( )
		DATABASE:Setup( )
	end)
end

function DATABASE:Query( q, result )
	if MAPCHANGE == true then return end
	tmysql.query( tostring(q), result )
end

function DATABASE:Escape( text )
	return tmysql.escape( text )
end

DATABASE:Connect( )
