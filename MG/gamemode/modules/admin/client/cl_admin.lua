
function DEVASION:CreateMenu( )
	if not LocalPlayer( ):IsModerator( ) then return end

	if DEVASION.Menu then
		DEVASION.Menu:Remove( )
	end
	
	DEVASION.Menu = vgui.Create( "DFrame" )
	DEVASION.Menu:SetSize( 200, 400 )
	DEVASION.Menu:SetPos( 100, 100 )
	DEVASION.Menu:SetTitle( "" )
	DEVASION.Menu:ShowCloseButton( false )
	
	DEVASION.Menu.Paint = function( ) end
	
	local options = DermaMenu( )
	options:SetParent( DEVASION.Menu )
	options:SetMinimumWidth( 150 )
	
	local players = options:AddOption( "------------- PLAYERS  -------------" )
	local kick = options:AddSubMenu( "Kick player" )
	
	local ban = options:AddSubMenu( "Ban player" )
	
	local slay = options:AddSubMenu( "Slay player" )
	local slap = options:AddSubMenu( "Slap player" )
	
	local spawn = options:AddSubMenu( "Spawn player" )
	
	local teleport = options:AddSubMenu( "Teleport player" )
	local bring = teleport:AddSubMenu( "Bring" )
	local goto = teleport:AddSubMenu( "Goto" )
	
	if LocalPlayer( ):IsSuperAdmin( ) then
		local server = options:AddOption( "------------- SERVER  -------------" )
		local mapvote = options:AddOption( "Force vote", function( ) RunConsoleCommand( "devasion_vote" ) end )
		local map = options:AddOption( "Switch map", function( ) RunConsoleCommand( "devasion_rcon", "changelevel", "gg_autumn" ) end )
		local restart = options:AddOption( "Restart server", function( ) RunConsoleCommand( "devasion_rcon", "_restart" ) end )
	end
	
	if LocalPlayer( ):IsOwner( ) then
		local shop = options:AddOption( "------------- SHOP  -------------" )
		local give = options:AddSubMenu( "Give money - 10000" )
		local take = options:AddSubMenu( "Take money - 10000" )
		
		for k, v in pairs( player.GetAll( ) ) do
			give:AddOption( v:Name( ), function( ) RunConsoleCommand( "shop_give", v:UserID( ), 10000 ) end )
			take:AddOption( v:Name( ), function( ) RunConsoleCommand( "shop_take", v:UserID( ), 10000 ) end )
		end
	end
	
	for k, v in pairs( player.GetAll( ) ) do
		kick:AddOption( v:Name( ), function( ) RunConsoleCommand( "devasion_kick", v:UserID( ) ) end )
		ban:AddOption( v:Name( ), function( ) RunConsoleCommand( "devasion_ban", v:UserID( ), "5" ) end )
		slay:AddOption( v:Name( ), function( ) RunConsoleCommand( "devasion_slay", v:UserID( ) ) end )
		slap:AddOption( v:Name( ), function( ) RunConsoleCommand( "devasion_slap", v:UserID( ) ) end )
		spawn:AddOption( v:Name( ), function( ) RunConsoleCommand( "devasion_spawn", v:UserID( ) ) end )
		bring:AddOption( v:Name( ), function( ) RunConsoleCommand( "devasion_teleport", "bring", v:UserID( ) ) end )
		goto:AddOption( v:Name( ), function( ) RunConsoleCommand( "devasion_teleport", "goto", v:UserID( ) ) end )
	end
	
	gui.EnableScreenClicker( true )
end

function DEVASION:RemoveMenu( )
	if DEVASION.Menu then
		DEVASION.Menu:Remove( )
		gui.EnableScreenClicker( false )
	end
end