local function kick( pl, cmd, args )
	if not args[1] then return end
	if not pl:IsModerator( ) then return end
	local reason = "Kicked by "..pl:Name( )
	
	local target = FindPlayer( args[1] )

	if target == nil then 
		pl:ChatPrint( "Nobody was found." )
		return
	end
	
	if args[2] then
		reason = table.concat( args, " ", 2 )
	end

	target:Kick( reason )
	PrintAll( "ADMIN", "Player <color=red>"..pl:Name( ).."</color> kicked <color=white>player</color> <color=red>"..target:Name( ).."</color>.", "gui/silkicons/exclamation" )
	GAMEMODE:WriteToLog( "Admin", "Player "..pl:Name( ).."<"..pl:SteamID( ).."> has kicked "..target:Name( ).." with the reason "..reason.."." )
end
concommand.Add( "devasion_kick", kick )
chatcommand.Add( "!kick", kick )

local function ban( pl, cmd, args )
	if not args[1] then return end
	if not pl:IsAdmin( ) then return end
	local reason = "Banned by "..pl:Name( )
	local time = 5
	
	local target = FindPlayer( args[1] )

	if target == nil then 
		pl:ChatPrint( "Nobody was found." )
		return
	end
	
	if not args[2] then
		pl:ChatPrint( "Please provide a ban time." )
		return
	end
	
	if not args[3] then
		pl:ChatPrint( "Please provide a ban reason." )
		return
	end
	
	time = tonumber( args[2] ) 
	reason = table.concat( args, " ", 3 )
	reason = tostring( reason )
	
	PrintAll( "ADMIN", "Player <color=red>"..pl:Name( ).."</color> banned <color=white>player</color> <color=red>"..target:Name( ).."</color> for <color=red>"..time.."</color> minutes.", "gui/silkicons/exclamation" )
	GAMEMODE:WriteToLog( "Admin", "Player "..pl:Name( ).."<"..pl:SteamID( ).."> has banned "..target:Name( ).." with the reason "..reason.." for "..time.." minutes." )
		
	target:Ban( reason, time, pl:Name( ) )
	target:Kick( reason )
end
concommand.Add( "devasion_ban", ban )
chatcommand.Add( "!ban", ban )
	
local function slay( pl, cmd, args )
	if not args[1] then return end
	if not pl:IsModerator( ) then return end
	
	if args[1] == "*" then
		for k, v in pairs( player.GetAll( ) ) do
			target = v
			target:Slay( )
		end
		
		PrintAll( "ADMIN", "Player <color=red>"..pl:Name( ).."</color> slayed <color=red>everyone</color>.", "gui/silkicons/exclamation" )
		GAMEMODE:WriteToLog( "Admin", "Player "..pl:Name( ).."<"..pl:SteamID( ).."> has slayed everyone.")
		return
	end
	
	local target = FindPlayersByName( args[1] )
	
	if target == nil then 
		pl:ChatPrint( "Nobody was found" )
		return
	end
	
	for k, v in pairs( target ) do
		v:Slay( )
	end
	
	PrintAll( "ADMIN", "Player <color=red>"..pl:Name( ).."</color> slayed <color=white>player</color> <color=red>"..PlayerList( target ).."</color>.", "gui/silkicons/exclamation" )
	GAMEMODE:WriteToLog( "Admin", "Player "..pl:Name( ).."<"..pl:SteamID( ).."> has slayed "..PlayerList( target )..".")
end
concommand.Add( "devasion_slay", slay )
chatcommand.Add( "!slay", slay )

local function slap( pl, cmd, args )
	if not args[1] then return end
	if not pl:IsModerator( )  then return end

		if args[1] == "*" then
		for k, v in pairs( player.GetAll( ) ) do
			target = v
			target:Slap( )
		end
		
		PrintAll( "ADMIN", "Player <color=red>"..pl:Name( ).."</color> slapped <color=red>everyone</color>.", "gui/silkicons/exclamation" )
		GAMEMODE:WriteToLog( "Admin", "Player "..pl:Name( ).."<"..pl:SteamID( ).."> has slapped everyone.")
		return
	end
	
	local target = FindPlayersByName( args[1] )
	
	if target == nil then 
		pl:ChatPrint( "Nobody was found" )
		return
	end
	
	for k, v in pairs( target ) do
		v:Slap( )
	end
	
	PrintAll( "ADMIN", "Player <color=red>"..pl:Name( ).."</color> slapped <color=white>player</color> <color=red>"..PlayerList( target ).."</color>.", "gui/silkicons/exclamation" )
	GAMEMODE:WriteToLog( "Admin", "Player "..pl:Name( ).."<"..pl:SteamID( ).."> has slapped "..PlayerList( target )..".")
end
concommand.Add( "devasion_slap", slap )
chatcommand.Add( "!slap", slap )

local function teleport( pl, cmd, args )
	if not args[1] then return end
	if not args[2] then return end
	if not pl:IsAdmin( ) then return end
	
	local target = FindPlayer( args[2] )
	
	if target == nil then
		pl:ChatPrint( "Nobody was found" )
		return
	end
	
	if args[1] == "bring" then
		target:SetPos( pl:GetPos( ) + Vector( 0, 0, 80 ) )
		PrintAll( "ADMIN", "Player <color=red>"..target:Name( ).."</color> was teleported to <color=white>player</color> <color=red>"..pl:Name( ).."</color>.", "gui/silkicons/exclamation" )
		GAMEMODE:WriteToLog( "Admin", "Player "..pl:Name( ).."<"..pl:SteamID( ).."> has brought "..target:Name( )..".")
	elseif args[1] == "goto" then
		pl:SetPos( target:GetPos( ) + Vector( 0, 0, 80 ) )
		PrintAll( "ADMIN", "Player <color=red>"..pl:Name( ).."</color> teleported to <color=white>player</color> <color=red>"..target:Name( ).."</color>.", "gui/silkicons/exclamation" )
		GAMEMODE:WriteToLog( "Admin", "Player "..pl:Name( ).."<"..pl:SteamID( ).."> has teleported to "..target:Name( )..".")
	else
		pl:ChatPrint( "Incorrect use; !teleport bring/goto <name>" )
		return
	end
	
end
concommand.Add( "devasion_teleport", teleport )
chatcommand.Add( "!teleport", teleport )

local function spawn( pl, cmd, args )
	if not args[1] then return end
	if not pl:IsSuperAdmin( ) then return end
	
	if args[1] == "*" then
		for k, v in pairs( player.GetAll( ) ) do
			target = v
			target:SetTeam( TEAM_BLUE )
			target:Spawn( )
			target:UnSpectate( )
		end
		
		PrintAll( "ADMIN", "Player <color=red>"..pl:Name( ).."</color> spawned <color=red>everyone</color>.", "gui/silkicons/exclamation" )
		GAMEMODE:WriteToLog( "Admin", "Player "..pl:Name( ).."<"..pl:SteamID( ).."> has spawned everyone.")
		return
	end
	
	local target = FindPlayersByName( args[1] )
	
	if target == nil then
		pl:ChatPrint( "Nobody was found" )
		return
	end
	
	for k, v in pairs( target ) do
		v:SetTeam( TEAM_BLUE )
		v:Spawn( )
		v:UnSpectate( )
	end
	
	PrintAll( "ADMIN", "Player <color=red>"..pl:Name( ).."</color> spawned <color=white>player</color> <color=red>"..PlayerList( target ).."</color>.", "gui/silkicons/exclamation" )
	GAMEMODE:WriteToLog( "Admin", "Player "..pl:Name( ).."<"..pl:SteamID( ).."> has spawned "..Playerlist( target )..".")
end
concommand.Add( "devasion_spawn", spawn )
chatcommand.Add( "!spawn", spawn )

local function rcon( pl, cmd, args )
	if not args[1] then return end
	if not pl:IsOwner( ) then return end
	
	local command = table.concat( args, " ", 1 )
	game.ConsoleCommand( command.."\n" )
end
concommand.Add( "devasion_rcon", rcon )
chatcommand.Add( "!rcon", rcon )