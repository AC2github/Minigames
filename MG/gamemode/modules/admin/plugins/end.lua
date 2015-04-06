
local function vote( pl, cmd, args )
	if not pl:IsAdmin( ) then return end
	
	GAMEMODE:EndRound( )
	PrintAll( "ADMIN", "Player <color=red>"..pl:Name( ).."</color> has forced a map vote.", "gui/silkicons/exclamation" )
end
concommand.Add( "devasion_vote", vote )
chatcommand.Add( "!end", vote )