local function switch( pl, cmd, args )
	if not args[1] then return end
	if not args[2] then return end
	local map = game.GetMap( )
	if not pl:IsSuperAdmin( ) then return end
	
	local target = FindPlayerByName( args[1] )
	local othertarget = FindPlayerByName( args[2] )
	
	if target == nil then 
		pl:ChatPrint( "First player was not found." )
		return
	end
	
	if othertarget == nil then
		pl:ChatPrint( "Second player was not found." )
		return
	end
	
	if GAMEMODE:GetMapFromTable( map ).TeamBased == true or GAMEMODE:GetMapFromTable( map ).RoundBased == true then
		local team = target:Team( )
		local team_other = othertarget:Team( )
		
		target:SetTeam( team_other )
		othertarget:SetTeam( team )
	else
		pl:ChatPrint( "This map doesn't allow this action." )
		return
	end
	
	PrintAll( "ADMIN", "Player <color=red>"..pl:Name( ).."</color> has switched <color=white>player</color> <color=red>"..target:Name( ).."</color> with <color=red>"..othertarget:Name().."</color>.", "gui/silkicons/exclamation" )
end
concommand.Add( "devasion_switch", switch )
chatcommand.Add( "!switch", switch )