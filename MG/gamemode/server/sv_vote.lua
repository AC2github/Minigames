
VoteMaps = {}
local Map = game.GetMap( )
VoteTable = {}
MapDataNew = {}
local HasVoted = {}
local FinalMap 

function AddMaps( )
	local Map = table.Random( MapData ).ID 
	
	if table.HasValue( VoteMaps, Map ) or game.GetMap( ) == Map then 
		VoteMaps = {} 
	end
	
	table.insert( VoteMaps, Map )
	
	if #VoteMaps == 5 then
		print( "[MG] Maps are now in the table." )
	end
end

while #VoteMaps < 5 do
	AddMaps( )
end

for k, v in pairs( MapData ) do
	MapDataNew[v.ID] = MapData[k]
end

function GM:SendMaps( pl )
	for k, v in pairs( VoteMaps ) do
		umsg.Start( "votemaps", pl )
			umsg.String( VoteMaps[k] )
		umsg.End( )
	end
end

local function PlayerHasVoted( pl )
	return table.HasValue( HasVoted, pl:SteamID( ) )
end

function IsValidMap( map )
	for k, v in pairs( VoteMaps ) do
		if VoteMaps[k] == map then 
			return true
		end
	end
	return false
end

function AddVote( Map, Amount )
	if not Map or not Amount then return end
	
	local ToVote 
	for k, v in pairs( VoteMaps ) do
		if VoteMaps[k] == Map then 
			ToVote = v
		end
	end
	
	if not IsValidMap( tostring(ToVote) ) then MsgN("Map is not valid") return end

	local MapVotes = MapDataNew[ToVote].Votes or 0
	MapDataNew[ToVote].Votes = Amount + MapVotes
	for k, v in pairs( MapDataNew ) do
		VoteTable[ToVote] = MapDataNew[ToVote].Votes
	end
end

local function Vote( pl, cmd, args )
	if not args[1] then return end
	if not IsValidMap( args[1] ) then return end
	local ToVote = args[1]
	
	if not MAPCHANGE then pl:ChatPrint("You cannot vote at this time.") return end
	if PlayerHasVoted( pl ) then return end
	local Votes = pl:Frags( ) + 1
	
	table.insert( HasVoted, pl:SteamID( ) )
	
	if pl:IsPlatinum( ) then
		AddVote( ToVote, 3 )
		PrintAll( "ADMIN", "<color=red>"..pl:Name( ).."</color> placed <color=red>3</color> votes for <color=red>"..ToVote.."</color>.", "gui/silkicons/heart" )
	elseif pl:IsPremium( ) then
		AddVote( ToVote, 2 ) 
		PrintAll( "ADMIN", "<color=red>"..pl:Name( ).."</color> placed <color=red>2</color> votes for <color=red>"..ToVote.."</color>.", "gui/silkicons/heart" )
	else
		AddVote( ToVote, 1 )
		PrintAll( "ADMIN", "<color=red>"..pl:Name( ).."</color> placed <color=red>1</color> vote for <color=red>"..ToVote.."</color>." )
	end
end
concommand.Add("mg_vote", Vote )

