
local function team( pl, cmd, args )
	if not args[1] then return end
	if not args[2] then return end
	local map = game.GetMap( )
	if not pl:IsSuperAdmin( ) then return end
	
	local target = FindPlayerByName( args[1] )
	
	if target == nil then 
		pl:ChatPrint( "Nobody was found" )
		return
	end
	
	if string.upper(args[2]) == "RED" then
		if GAMEMODE:GetMapFromTable( map ).TeamBased == true or GAMEMODE:GetMapFromTable( map ).RoundBased == true then
			target:SetTeam( TEAM_RED )
		else
			pl:ChatPrint( "This map doesn't allow this action." )
			return
		end
	elseif string.upper(args[2]) == "BLUE" then
		target:SetTeam( TEAM_BLUE )
	else
		pl:ChatPrint( "Incorrect use: !team <player> <red> or <blue>" )
		return
	end
	
	PrintAll( "ADMIN", "Player <color=red>"..pl:Name( ).."</color> has set <color=white>player</color> <color=red>"..target:Name( ).."</color> to <color=red>"..args[2].."</color>.", "gui/silkicons/exclamation" )
end
concommand.Add( "devasion_team", team )
chatcommand.Add( "!team", team )