local Map = game.GetMap( )
local VoteTable = {}
local CanVote = false
RTVVotes = 0

timer.Simple( RTV_TIME, function( ) 
	PrintAll( "ADMIN", "RTV is now enabled.") 
	CanVote = true 
end )

timer.Create( "RoundTimer", ROUND_TIME, 0, function( )
	if #player.GetAll( ) == 0 then
		game.ConsoleCommand( "changelevel "..table.Random( MapData ).ID.."\n" )
	end
	
	if MAPCHANGE == true then return end
	
	PrintAll( "ADMIN", "Time for a change!")
	MAPCHANGE = true 
	GAMEMODE:EndRound( )
	CanVote = false 
end )

local function VotesRequired( )
	local Players = #player.GetAll( )
	if Players <= 2 then return 1 end
	if Players <= 4 then return 2 end
	return (Players / 2) + 2
end

local function PlayerVoted( pl )
	return table.HasValue( VoteTable, pl:SteamID( ) )
end

function VoteChanged( )
    if MAPCHANGE then return end
	if RTVVotes >= VotesRequired( ) then
		GAMEMODE:EndRound( )
	end
end

local function timeleft( pl, cmd, args )
	if MAPCHANGE then return end
	pl:ChatPrint(math.Round( ROUND_TIME - CurTime( ) ).." seconds left till a vote." )
end
concommand.Add("mg_timeleft", timeleft )
chatcommand.Add("timeleft", timeleft )

local function RTV( pl )
	if CanVote == false then pl:ChatPrint("RTV is disabled.") return end
	if MAPCHANGE == true then pl:ChatPrint("RTV is disabled.") return end
	if PREROUND == true then pl:ChatPrint( "RTV is disabled." ) return end
	
	if PlayerVoted( pl ) then
		pl:ChatPrint("You already voted ( "..RTVVotes.." / "..math.Round(VotesRequired( )).." ) ")
		return
	end
	
	RTVVotes = RTVVotes + 1
	table.insert( VoteTable, pl:SteamID( ) )
	PrintAll( "ADMIN", "Player <color=red>"..pl:Name( ).."</color> wants to change the map ( <color=red>"..RTVVotes.."</color> / <color=red>"..math.Round(VotesRequired( )).."</color> )" )
	
	VoteChanged( )
end
concommand.Add("mg_rtv", RTV )
chatcommand.Add("rtv", RTV )
