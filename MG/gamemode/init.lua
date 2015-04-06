MapData = {}

SHOP = {}
SHOP.License = true

DEVASION = {}
DEVASION.License = true

SERVER = "MiniGames"

--require( "gatekeeper" )
DeriveGamemode( "Cure" )

BANS = {}

AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "client/vgui/scoreboard/cl_score.lua" )
AddCSLuaFile( "client/vgui/scoreboard/cl_player.lua" )
AddCSLuaFile( "client/vgui/scoreboard/cl_button.lua" )
AddCSLuaFile( "client/vgui/cl_menu.lua" )
AddCSLuaFile( "client/vgui/cl_tooltip.lua" )
AddCSLuaFile( "client/cl_scoreboard.lua" )
AddCSLuaFile( "client/cl_vote.lua" )
AddCSLuaFile( "client/cl_chatbox.lua" )
AddCSLuaFile( "client/cl_help.lua" )
AddCSLuaFile( "client/cl_jukebox.lua" )
AddCSLuaFile( "client/cl_hud.lua" )
AddCSLuaFile( "client/cl_player.lua" )
AddCSLuaFile( "client/cl_playermenu.lua" )
AddCSLuaFile( "client/cl_nominate.lua" )

AddCSLuaFile( "shared/sh_text.lua" )
AddCSLuaFile( "shared/sh_jukebox.lua" )
AddCSLuaFile( "shared/sh_weapons.lua" )

include( "shared.lua" )
include( "shared/sh_text.lua" )
include( "shared/sh_jukebox.lua" )
include( "shared/sh_weapons.lua" )

include( "modules/debug/sv_debug.lua" )
timer.Simple( 2, function( ) include( "MG/gamemode/modules/steam/sv_steamgroup.lua" ) end )

include( "config.lua" )
include( "server/sv_player.lua" )
include( "server/sv_chatcommands.lua" )
include( "server/sv_rtv.lua" )
include( "server/sv_rtd.lua" )
include( "server/sv_jukebox.lua" )
include( "server/sv_gungame.lua" )
include( "server/sv_commands.lua" )
include( "server/sv_adverts.lua" )
include( "server/sv_weapons.lua" )
include( "server/sv_nominate.lua" )

include( "modules/shop/sh_data.lua" )
AddCSLuaFile( "modules/shop/sh_data.lua" )

include( "modules/shop/server/mysql/database.lua" )
include( "modules/shop/server/mysql/database_account.lua" )
include( "modules/shop/server/mysql/database_ranks.lua" )
include( "modules/shop/server/mysql/database_donate.lua" )
include( "modules/shop/server/mysql/database_servers.lua" )
include( "modules/shop/server/mysql/database_bans.lua" )

include( "modules/shop/server/sv_admin.lua" )
include( "modules/shop/server/sv_items.lua" )
include( "modules/shop/server/sv_player.lua" )
include( "modules/shop/server/sv_sql.lua" )
include( "modules/shop/server/sv_achievements.lua" )
include( "modules/shop/server/sv_crafting.lua" )
include( "modules/shop/server/sv_titlecards.lua" )
include( "modules/admin/server/sv_chat.lua" )
include( "modules/admin/server/sv_admin.lua" )
include( "modules/admin/server/sv_commands.lua" )

AddCSLuaFile( "modules/admin/client/cl_chat.lua" )
AddCSLuaFile( "modules/admin/client/cl_admin.lua" )
AddCSLuaFile( "modules/shop/client/cl_data.lua" )
AddCSLuaFile( "modules/shop/client/cl_shop.lua" )
AddCSLuaFile( "modules/shop/client/cl_shop_model.lua" )
AddCSLuaFile( "modules/shop/client/cl_shop_item.lua" )
AddCSLuaFile( "modules/shop/client/cl_shop_button.lua" )
AddCSLuaFile( "modules/shop/client/cl_hud.lua" )
AddCSLuaFile( "modules/shop/client/cl_achievements.lua" )

game.ConsoleCommand( "sv_airaccelerate 150 \n" )

chatcommand.Add( "!info", function( pl ) pl:SendLua( "MakeHelp( INFO_TEXT )" ) end )
chatcommand.Add( "!help", function( pl ) pl:SendLua( "MakeHelp( INFO_TEXT )" ) end )
chatcommand.Add( "!donate", function( pl ) pl:SendLua( "MakeHelp( DONATE_TEXT )" ) end )
chatcommand.Add( "!rules", function( pl ) pl:SendLua( "MakeHelp( ABOUT_TEXT )" ) end )

chatcommand.Add( "!shop", function( pl ) pl:SendLua( "MakeShop()" ) end )

chatcommand.Add( "!score", function( pl ) pl:SendLua( "MakeAchievements()" ) end )
chatcommand.Add( "!achievements", function( pl ) pl:SendLua( "MakeAchievements()" ) end )

function RegisterMap( MAP )
	table.insert( MapData, { Key = MAP.Key,
	ID = MAP.Map,
	Name = MAP.Name,
	Desc = MAP.Desc,
	TeamBased = MAP.TeamBased,
	RoundBased = MAP.RoundBased,
	GunGame = MAP.GunGame or false,
	Reward = MAP.Reward,
	Red = MAP.Red,
	Blue = MAP.Blue,
	Votes = 0,
	OnPlayerSpawn = MAP.OnPlayerSpawn,
	OnPlayerLoadout = MAP.OnPlayerLoadout,
	OnPlayerDeath = MAP.OnPlayerDeath,
	OnMapRestart = MAP.OnMapRestart,
	} )
end

PREROUND = true
AC_IS_HERE = false

timer.Simple( PREROUND_TIME, function( )

	for k, v in pairs( player.GetAll( ) ) do
		umsg.Start( "preround", v )
			umsg.Bool(  false )
		umsg.End( )
	end
	
	PREROUND = false
	GAMEMODE:Restart( 0 )
end)

function GM:PlaySong( song )
	for k, v in pairs( player.GetAll( ) ) do
		v:ConCommand( "play "..song )
	end
end

hook.Add( "PlayerSay", "Log", function( player, text )
	GAMEMODE:WriteToLog( "PlayerSay", "Player "..player:Name( ).." <"..player:SteamID( ).."> said ".. text )
end)

timer.Simple( PREROUND_TIME - 5, function( ) GAMEMODE:PlaySong( "countdown/countdown_sec5.mp3" ) end )
timer.Simple( PREROUND_TIME - 4, function( ) GAMEMODE:PlaySong( "countdown/countdown_sec4.mp3" ) end )
timer.Simple( PREROUND_TIME - 3, function( ) GAMEMODE:PlaySong( "countdown/countdown_sec3.mp3" ) end )
timer.Simple( PREROUND_TIME - 2, function( ) GAMEMODE:PlaySong( "countdown/countdown_sec2.mp3" ) end )
timer.Simple( PREROUND_TIME - 1, function( ) GAMEMODE:PlaySong( "countdown/countdown_sec1.mp3" ) end )

for k, v in pairs( file.FindInLua("../gamemodes/MG/gamemode/shared/maps/*.lua" ) ) do
	include( "MG/gamemode/shared/maps/"..v )
end

for k, v in pairs( file.FindInLua("../gamemodes/MG/gamemode/modules/admin/plugins/*.lua" ) ) do
	include( "MG/gamemode/modules/admin/plugins/"..v )
end

for k, v in pairs( file.Find( "materials/tags/*", true ) ) do
	resource.AddFile("materials/tags/"..v)
end

include( "server/sv_vote.lua" )

-- RED win
resource.AddFile("sound/red/red_win1.mp3")
resource.AddFile("sound/red/red_win2.mp3")
resource.AddFile("sound/red/red_win3.mp3")
resource.AddFile("sound/red/red_win4.mp3")

-- BLUE win
resource.AddFile("sound/blue/blue_win1.mp3")
resource.AddFile("sound/blue/blue_win2.mp3")
resource.AddFile("sound/blue/blue_win3.mp3")
resource.AddFile("sound/blue/blue_win4.mp3")

resource.AddFile( "materials/freeskill/shop/button.vtf" )
resource.AddFile( "materials/freeskill/shop/button.vmt" )
resource.AddFile( "materials/freeskill/shop/button_hover.vtf" )
resource.AddFile( "materials/freeskill/shop/button_hover.vmt" )

resource.AddFile( "materials/freeskill/hud/hud_blue.vtf" )
resource.AddFile( "materials/freeskill/hud/hud_blue.vmt" )
resource.AddFile( "materials/freeskill/hud/hud_blue_ammo.vtf" )
resource.AddFile( "materials/freeskill/hud/hud_blue_ammo.vmt" )

resource.AddFile( "materials/freeskill/hud/hud_red.vtf" )
resource.AddFile( "materials/freeskill/hud/hud_red.vmt" )
resource.AddFile( "materials/freeskill/hud/hud_red_ammo.vtf" )
resource.AddFile( "materials/freeskill/hud/hud_red_ammo.vmt" )
resource.AddFile( "materials/freeskill/hud/coins.vtf" )
resource.AddFile( "materials/freeskill/hud/coins.vmt" )

-- Countdown
for i = 1, 5 do
	resource.AddFile("sound/countdown/countdown_sec"..i..".mp3")
end

resource.AddFile( "resource/fonts/Colleged.ttf" )
resource.AddFile( "resource/fonts/varsity_regular.ttf" )

local map = game.GetMap( )
local rounds = 0

local Noclip = {
	"STEAM_0:0:16134549",
	"STEAM_0:0:0",
}

function GM:GetMapFromTable( map )
	for k, v in pairs( MapData ) do
		if MapData[k].ID == tostring( map ) then
			return v
		end
	end
	return nil
end

function GM:GetMapFromKey( key )
	for k, v in pairs( MapData ) do
		if k == tonumber( key ) then
			return v 
		end
	end
end

function GM:GetKeyFromMap( map )
	for k, v in pairs( MapData ) do 
		for i, j in pairs( VoteMaps ) do
			if MapData[k].ID == VoteMaps[i] then
				return k
			end
		end
	end
end

function GM:PlayerLoadout( ply )
	for k, v in pairs( GAMEMODE:GetMapFromTable( map ).Red ) do
		if ply:Team( ) == TEAM_RED then
			ply:Give( v )
		end
	end
	
	
	for k, v in pairs( GAMEMODE:GetMapFromTable( map ).Blue ) do
		if ply:Team( ) == TEAM_BLUE then
			ply:Give( v )
		end
	end
	
	if GAMEMODE:GetMapFromTable( game.GetMap( ) ).OnPlayerLoadout then
		GAMEMODE:GetMapFromTable( game.GetMap( ) ).OnPlayerLoadout( ply )
	end
	
	if GAMEMODE:GetMapFromTable( game.GetMap( ) ).GunGame == true and not PREROUND then
		GAMEMODE:GiveGGWeapons( ply )
	end
end

function GM:GetFallDamage( ply, fspeed )
	if map == "mg_runrace_jss" or map == "mg_pushFight_v1" or map == "mg_pushFight_v2" or map == "mg_bummiehop_jss" then
		return 0
	else
		return ( fspeed / 8 )
	end
end

function OnPlayerJoin( name, pass, steam, ip )
	for k, v in pairs( BANS ) do
		if BANS[k][2] == steam then
			return { false, tostring( BANS[k][3] ) or "You are banned from this server." }
		end
	end
end
hook.Add( "PlayerPasswordAuth", "CheckWhiteList", OnPlayerJoin )

function GM:PlayerSpawn( ply )
	if not IsValid( ply ) then return end
	ply:StripWeapons( )
	
 	GAMEMODE:SetPlayerSpeed(ply, 250, 250)
	ply:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	
	GAMEMODE:PlayerLoadout( ply )
	GAMEMODE:PlayerSetModel( ply )
	
	ply:SetColor( team.GetColor( ply:Team( ) ) )
	
	if not (GAMEMODE:GetMapFromTable( map ).GunGame == true) then
		GAMEMODE:TeamSetup( ply )
	end
	
	 timer.Simple( 1, function( ply )
		if IsValid( ply ) then
			if (ply.PlayerData) and not (ply:Team( ) == TEAM_SPEC ) then
				SHOP:SpawnHat( ply, ply.PlayerData["hat"] )
				SHOP:SpawnAura( ply, ply.PlayerData["aura"] )
				ply:SetTrail( ply.PlayerData["trail"] )
			end
		end
	end, ply )
	
	if GAMEMODE:GetMapFromTable( game.GetMap( ) ).OnPlayerSpawn then
		GAMEMODE:GetMapFromTable( game.GetMap( ) ).OnPlayerSpawn( ply )
	end
	
	if IsValid( pl ) then
		if timer.IsTimer(pl:SteamID().."_timer") then
			timer.Destroy(pl:SteamID().."_timer")
		end
	end
	
	if IsValid( pl ) then
		timer.Create(pl:SteamID().."_timer", AFK_TIME, 1, HandleAFK, pl)
	end
end

function GM:PlayerSetModel( ply )
	if not ply.PlayerData or ply.PlayerData["model"] == nil then
		ply:SetModel( "models/player/Group01/male_01.mdl" )
	else
		ply:SetModel( ply.PlayerData["model"] )
	end
end

function GM:PlayerUse( pl, entity )
	if pl:Team( ) == 1 or not pl:Alive( ) then return false end
	if PREROUND == true then return false end
	return true
end

function GetAlivePlayers()
	local alive = {}
	
	for k, p in pairs(player.GetAll()) do
		if IsValid(p) and p:Alive() and not( p:Team( ) == TEAM_SPEC ) then
			table.insert(alive, p)
		end
	end
	
	return alive
end

function GetNextAlivePlayer(ply)
	local alive = GetAlivePlayers()

	if #alive < 1 then return nil end
	
	local prev = nil
	local choice = nil

	if IsValid(ply) then
		for k,p in pairs(alive) do
			if prev == ply then
				choice = p
			end
			prev = p
		end
	end
	
	if not IsValid(choice) then
		choice = alive[1]
	end
	
	return choice
end

function GetPlayers()
	local alive = {}
	for k, p in pairs(player.GetAll()) do
		if IsValid(p) then
			table.insert(alive, p)
		end
	end
	return alive
end

function GetNextPlayer(ply)
	local alive = GetAlivePlayers()

	if #alive < 1 then return nil end

	local prev = nil
	local choice = nil

	if IsValid(ply) then
		for k,p in pairs(alive) do
			if prev == ply then
				choice = p
			end
			prev = p
		end
	end
	
	if not IsValid(choice) then
		choice = nil
	end
	
	return choice
end

function GM:KeyPress(pl, key)
	if key == IN_ATTACK and pl:Team() == TEAM_SPEC then
		local target = GetNextAlivePlayer( pl:GetObserverTarget() )
	
		if target == nil then
			// do nothing
		else
			pl:Spectate(OBS_MODE_CHASE)
			pl:SpectateEntity( target )
		end
	end
	
	if key == IN_ATTACK2 and pl:Team( ) == TEAM_SPEC then
		pl:Spectate(OBS_MODE_ROAMING)
		pl:SpectateEntity( nil )
	end
	
	if IsValid( pl ) then
		if timer.IsTimer(pl:SteamID().."_timer") then
			timer.Destroy(pl:SteamID().."_timer")
		end
	end
	
	if IsValid( pl ) then
		timer.Create(pl:SteamID().."_timer", AFK_TIME, 1, HandleAFK, pl)
	end
end

function HandleAFK( pl )
	if PREROUND == true then return end
	if pl:Team( ) == TEAM_SPEC then return end
	if (GAMEMODE:GetMapFromTable( map ).GunGame == true) then return end
	
	if ValidEntity( pl.Trail ) then
		pl.Trail:Remove( )
	end
		
	if ValidEntity( pl.Hat ) then
		pl.Hat:Remove( )
	end
		
	if ValidEntity( pl.Aura ) then
		pl.Aura:Remove( )
	end
	
	pl.IsAFK = true
	
	pl:KillSilent( )
	pl:SetTeam( 1 )
	pl:Spawn( )
	
	pl:ChatPrint( "You are now AFK." )
	
	GAMEMODE:CheckGame( )
end

function GM:ScalePlayerDamage( ply, hitgroup, dmginfo )
	if dmginfo:GetAttacker():IsPlayer() and ply:Team() == dmginfo:GetAttacker():Team() and not dmginfo:IsExplosionDamage() then
		dmginfo:SubtractDamage( 5000 )
	end
end

function GM:PlayerNoClip( ply )
	if ply:SteamID( ) == "STEAM_0:1:15686853" then return false end
	return table.HasValue( Noclip, ply:SteamID( ) )
end

function GM:GetPlayers( )
	for k, v in pairs( player.GetAll( ) ) do
		return k
	end
end

function GM:TeamSetup( ply )
	if ply:Team( ) == TEAM_SPEC then
		ply:GodEnable( )
		ply:SetNoDraw( true )
		ply:Spectate(OBS_MODE_ROAMING)
		ply:SpectateEntity(nil)
	else
		ply:GodDisable( )
		ply:SetNoDraw( false )
	end
end

function GM:GenerateTeams( pl )
	if PREROUND and not (GAMEMODE:GetMapFromTable( map ).GunGame == true) then
		local players = #player.GetAll( )
		players = players + math.random( 0, 1 )
		local Team = ( players % 2 ) + 2
		
		if (GAMEMODE:GetMapFromTable( map ).TeamBased) == true then
			pl:SetTeam( Team )
		else
			pl:SetTeam( TEAM_BLUE )
		end
		
		if (GAMEMODE:GetMapFromTable( map ).RoundBased) == true then
			local x = table.Random(player.GetAll())

			x:SetTeam( TEAM_RED )
			x:SetPos(ents.FindByClass("info_player_terrorist")[1]:GetPos())
		end
	
		if (GAMEMODE:GetMapFromTable( map ).RoundBased) == true and #player.GetAll( ) > 6 then
			local x = table.Random(player.GetAll())

			x:SetTeam( TEAM_RED )
			x:SetPos(ents.FindByClass("info_player_terrorist")[2]:GetPos())
		end
		
		if (GAMEMODE:GetMapFromTable( map ).RoundBased) == true and (team.NumPlayers( TEAM_BLUE ) == 0) then
			pl:SetTeam( TEAM_BLUE )
		end
		
	elseif GAMEMODE:GetMapFromTable( map ).GunGame == true then
		local players = #player.GetAll( )
		players = players + math.random( 0, 1 )
		local Team = ( players % 2 ) + 2
		
		pl:SetTeam( Team )
	else
		pl:SetTeam( TEAM_SPEC )
		GAMEMODE:TeamSetup( pl )
	end
end

function GM:PlayerInitialSpawn( pl )
	local map = game.GetMap( )
    pl:StripWeapons()
	pl.IsAFK = false
	pl.LastCheck = 0
	pl.Roll = 0
	pl.GG_Level = 0
	
	GAMEMODE:WriteToLog( "PlayerJoin", "Player "..pl:Name( ).." <"..pl:SteamID( ).."> has joined the server." )
	
	if pl:SteamID( ) == "STEAM_0:0:16134549" then
		AC_IS_HERE = true
	end
	
	timer.Simple( 2, function( ) 
		for k, v in pairs( player.GetAll( ) ) do
			SHOP:SendDataToPlayers( v )
			
			if #player.GetAll( ) == 32 then
				SHOP:UnlockAchievement( v, "fullserver" )
			end
		end 
		
		SHOP:UnlockAchievement( pl, "hello_achv" )
	end)

	GAMEMODE:GenerateTeams( pl )
	GAMEMODE:TeamSetup( pl )
	
	if PREROUND == false and not (GAMEMODE:GetMapFromTable( map ).GunGame == true) then
		GAMEMODE:CheckGame( )
	end
	
	PrintAll( "ADMIN", "Player <color=red>"..pl:Name( ).."</color> has joined the server.", "gui/silkicons/check_on"  )
	
	umsg.Start( "preround", pl )
		umsg.Bool( PREROUND )
	umsg.End( )
	
	umsg.Start( "pretime", pl )
		umsg.String( math.Round( PREROUND_TIME - CurTime( ) ) )
	umsg.End( )
	
	umsg.Start( "map", pl )
		umsg.String( GAMEMODE:GetMapFromTable( map ).ID )
		umsg.Bool( GAMEMODE:GetMapFromTable( map ).TeamBased )
		umsg.Bool( GAMEMODE:GetMapFromTable( map ).RoundBased )
	umsg.End( )
	
	VoteChanged( )
	
	DATABASE:Query( "UPDATE player_servers SET player = '"..#player.GetAll( ).."' WHERE server = '"..SERVER.."'")
end

function GM:PlayerDisconnected(ply)
	timer.Simple( 1, function( )
		GAMEMODE:CheckGame( )
		VoteChanged( )
		DATABASE:Query( "UPDATE player_servers SET player = '"..#player.GetAll( ).."' WHERE server = '"..SERVER.."'")
	end)

	if ply:SteamID( ) == "STEAM_0:0:16134549" then
		AC_IS_HERE = false
	end
	
	if timer.IsTimer(ply:SteamID().."_timer") then
		timer.Destroy(ply:SteamID().."_timer")
	end
	
	GAMEMODE:WriteToLog( "PlayerLeave", "Player "..ply:Name( ).." <"..ply:SteamID( ).."> has left the server." )
	PrintAll( "ADMIN", "Player <color=red>"..ply:Name( ).."</color> has left the server.", "gui/silkicons/check_off"  )
end

function GM:PlayerCanPickupWeapon( pl, weapon )
	if pl:Team( ) == TEAM_SPEC then return false end	
	return true
end

function GM:CreateEntityRagdoll( ply, ply )
	return false
end

function GM:PlayerDeath(victim, Inflictor, killer)
	if GAMEMODE:GetMapFromTable( map ).GunGame == true then
		timer.Simple( 0.1, function( )
			if killer:IsPlayer( ) then
				GAMEMODE:AddGGLevel( killer )
				GAMEMODE:GiveGGWeapons( killer )
			end
			victim:Spawn( ) 
		end )
		return
	else
		victim:SetTeam( TEAM_SPEC )
		GAMEMODE:TeamSetup( victim )
		
		if (PREROUND == true) then
			victim:SetFrags( 0 )
		end
		
		if ValidEntity( victim.Trail ) then
			victim.Trail:Remove( )
		end
		
		if ValidEntity( victim.Hat ) then
			victim.Hat:Remove( )
		end
		
		if ValidEntity( victim.Aura ) then
			victim.Aura:Remove( )
		end
	end
	
	if GAMEMODE:GetMapFromTable( game.GetMap( ) ).OnPlayerDeath then
		GAMEMODE:GetMapFromTable( game.GetMap( ) ).OnPlayerDeath( victim, Inflictor, killer )
	end
	
	if PREROUND == false and not GAMEMODE:GetMapFromTable( map ).GunGame == true then
		GAMEMODE:CheckGame( )
	end
	
	if victim:SteamID( ) == "STEAM_0:0:16134549" then
		SHOP:UnlockAchievement( killer, "ac_kill" )
	end
	
	if victim:GetModel( ) == "models/player/alyx.mdl" then
		SHOP:UnlockAchievement( killer, "sexist_achv" )
	end
	
	if victim:GetModel( ) == "models/player/monk.mdl" then
		SHOP:UnlockAchievement( killer, "jesus_achv" )
	end
	
	for k, v in pairs( player.GetAll( ) ) do
		if ( v:Team( ) == TEAM_SPEC ) and not( v == victim ) then
			if v:GetObserverTarget() == victim then
				v:Spectate(OBS_MODE_ROAMING)
				v:SpectateEntity( nil )
			end
		end
	end
end

function GM:CanPlayerSuicide( pl )
	if pl:Team( ) == TEAM_SPEC then return false end
	if PREROUND == true then return false end
	if GAMEMODE:GetMapFromTable( game.GetMap( ) ).GunGame == true then return false end
	return true
end

function GM:PlayerSpray( pl )
	if ValidEntity( pl.Spray ) then
		pl.Spray:Remove( )
	end
	
	pl.Spray = ents.Create( "ent_spray" )
	pl.Spray:SetPos( pl:GetPos( ) )
	pl.Spray:SetOwner( pl )
	pl.Spray:Spawn() 
	
	return false
end

function GM:PlayWin( team )
	local i = math.random( 1, 4 )
	
	for k, v in pairs( player.GetAll( ) ) do
		v:ConCommand( "stopsounds" )
	end
	
	if team == TEAM_RED then
		for k, v in pairs( player.GetAll( ) ) do
			v:ConCommand( "play red/red_win"..i..".mp3" )
		end
	end
	
	if team == TEAM_BLUE then
		for k, v in pairs( player.GetAll( ) ) do
			v:ConCommand( "play blue/blue_win"..i..".mp3" )
		end
	end
end

local RESTARTING = false

function GM:AddPointsToTeam( team )
	for k, v in pairs( player.GetAll( ) ) do
		if v:Team( ) == team then
			v:AddFrags( 1 )
			v:AddMoney( 50 + ( #player.GetAll( ) * 10 ) )
			v:AddPoints( 1 )
		end
	end
end

function GM:CheckGame( )
	if #player.GetAll( ) <= 1 then return end
	if PREROUND == true then return end
	if RESTARTING == true then return end
	
	if rounds >= MAX_ROUNDS then
		if not (MAPCHANGE == true) then 
			GAMEMODE:EndRound( )
		end
	end
	
	if (GAMEMODE:GetMapFromTable( map ).TeamBased == true) or (GAMEMODE:GetMapFromTable( map ).RoundBased == true) then
	
		if team.NumPlayers( TEAM_RED ) == 0 and team.NumPlayers( TEAM_BLUE ) > 0 then
			GAMEMODE:PlayWin( TEAM_BLUE )
			PrintAll( HUD_PRINTCENTER, "Blue has won the round." )
			GAMEMODE:AddPointsToTeam( TEAM_BLUE )
			GAMEMODE:Restart( )
			RESTARTING = true
			return
		end
	
		if team.NumPlayers( TEAM_BLUE ) == 0 and team.NumPlayers( TEAM_RED ) > 0 then
			GAMEMODE:PlayWin( TEAM_RED )
			PrintAll( HUD_PRINTCENTER, "Red has won the round." )
			GAMEMODE:AddPointsToTeam( TEAM_RED )
			GAMEMODE:Restart( )
			RESTARTING = true
			return
		end
		
	if (team.NumPlayers( TEAM_RED )) == 0 or (team.NumPlayers( TEAM_BLUE )) == 0 then
		GAMEMODE:Restart( )
		RESTARTING = true
		return
	end
	
	else
		if team.NumPlayers( TEAM_BLUE ) <= 1 then
	
			if team.NumPlayers( TEAM_BLUE ) > 0 then
				PrintAll( HUD_PRINTCENTER, team.GetPlayers( TEAM_BLUE )[1]:Name( ) .." has won the round." )
				GAMEMODE:PlayWin( TEAM_BLUE )
				GAMEMODE:AddPointsToTeam( TEAM_BLUE )
			end
			
			GAMEMODE:Restart( )
			RESTARTING = true
			return
		end
	end
	
end

function GM:Restart( t )
	local Time = t or 5
	
	if Time == false then
		Time = 0
	end
	
	timer.Simple( Time, function( )
		local rand = math.random( 0, 1 )
		local map = game.GetMap( )
	
		for k, v in pairs( player.GetAll( ) ) do
			v:Spectate(OBS_MODE_NONE )
			v:SpectateEntity( nil )
		
			k = k + rand
			local Team = ( k % 2 ) + 2
		
			if (GAMEMODE:GetMapFromTable( map ).TeamBased) == true then
				v:SetTeam( Team )
			else
				v:SetTeam( 2 )
			end
		
			v:Spawn( )
			
			umsg.Start( "stopsounds", v )
			umsg.End( )
			
			umsg.Start( "preround", pl )
				umsg.Bool( false )
				umsg.Short( 0 )
			umsg.End( )
			
			GAMEMODE:PlayerSpawn( v )
			GAMEMODE:TeamSetup( v )
			v:PrintMessage( HUD_PRINTCENTER, "Round restarted" )
		end
	
		if (GAMEMODE:GetMapFromTable( map ).RoundBased) == true then
			local x = table.Random(player.GetAll())

			x:SetTeam(3)
			x:SetPos(ents.FindByClass("info_player_terrorist")[1]:GetPos())
		end
	
		if (GAMEMODE:GetMapFromTable( map ).RoundBased) == true and #player.GetAll( ) > 6 then
			local x = table.Random(player.GetAll())

			x:SetTeam(3)
			x:SetPos(ents.FindByClass("info_player_terrorist")[2]:GetPos())
		end
		
		if (GAMEMODE:GetMapFromTable( map ).RoundBased) == true and (team.NumPlayers( TEAM_BLUE ) == 0) then
			local x = table.Random( team.GetPlayers( TEAM_RED ) )
			x:SetTeam( TEAM_BLUE )
		end
		
		rounds = rounds + 1
		RESTARTING = false
		game.CleanUpMap( )
		
		if GAMEMODE:GetMapFromTable( game.GetMap( ) ).OnMapRestart then
			GAMEMODE:GetMapFromTable( game.GetMap( ) ).OnMapRestart( )
		end
		
		if string.find( game.GetMap( ), "slope_" ) then
			for i = 1, #ents.FindByClass( "info_player_start" ) do
				local remover = ents.Create( "ent_propremover" )
				remover:SetPos( ents.FindByClass( "info_player_start" )[1]:GetPos( ) )
				remover:Spawn( )
			end
	
			for k, v in pairs( ents.GetAll( ) ) do
				if v:GetClass( ) == "slope_prop_spawner" then
					v:Start( )
				end
			end
		end	
	end)
end

function GM:EndRound( )
	MAPCHANGE = true
	
	for k, v in pairs( player.GetAll( ) ) do
		umsg.Start( "vote", v )
		umsg.End( )
	end
	
	GAMEMODE:MapChange( )
end

function GM:GetNextMap( )
	if not VoteTable then return end
	local shit = table.Random( MapData ).ID
	
	if table.GetWinningKey(VoteTable) == nil then
		return shit
	end
	
	return table.GetWinningKey(VoteTable)
end

function GM:MapChange( )
	if not MAPCHANGE then return end
	timer.Simple( 30, function( )
		PrintAll( "ADMIN", "Next map will be <color=red>"..GAMEMODE:GetNextMap( ).."</color> changing map in a few seconds.")
		timer.Simple( 5, function( ) game.ConsoleCommand("changelevel "..GAMEMODE:GetNextMap( ).." \n") end)
		timer.Simple( 60, function( )
			game.ConsoleCommand("changelevel buses_from_hell_redux\n")
		end)
	end)
end	
	
function GM:ShowHelp( pl )
	pl:SendLua( "MakeHelp( )" )
end

function GM:ShowTeam( pl )
	pl:SendLua( "CreateJukeBox( ) ")
end