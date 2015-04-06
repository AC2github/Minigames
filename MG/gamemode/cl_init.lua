
DeriveGamemode( "Cure" )

COLOR_GRAY_PRIMARY = Color( 175, 175, 175, 255 )
COLOR_GRAY_SECONDARY = Color( 100, 100, 100, 200 )
COLOR_BLACK = Color(0,0,0,255)
COLOR_GREEN = Color(0,255,0,255)
COLOR_RED = Color(255, 0, 0, 255)
COLOR_YELLOW = Color(200, 200, 0, 255)
COLOR_LGRAY = Color(200, 200, 200, 255)
COLOR_BLUE = Color(0,0,255, 255)

COLOR_WHITE = Color(255, 255, 255, 200 )
COLOR_DISCOUNT = Color( 255, 255, 0, 200 )
COLOR_CANBUY = Color( 0, 255, 0, 200 )
COLOR_CANNOTBUY = Color( 255, 0, 0, 200 )

hook.Add("Initialize", "InitializeFonts", function( )
	surface.CreateFont( "Colleged", 20, 200, true, true, "colleged_small" )
	surface.CreateFont( "Colleged", 48, 500, true, true, "colleged_big" )
	surface.CreateFont( "varsity_regular", 48, 500, true, true, "varsity" )
end)

SHOP = {}
DEVASION = {}
PREROUND = true
PREROUND_TIME = 60
MAP = {}

include( "shared.lua" )
include( "client/vgui/scoreboard/cl_score.lua" )
include( "client/vgui/scoreboard/cl_player.lua" )
include( "client/vgui/scoreboard/cl_button.lua" )
include( "client/vgui/cl_menu.lua" )
include( "client/vgui/cl_tooltip.lua" )
include( "client/cl_scoreboard.lua" )
include( "client/cl_vote.lua" )
include( "client/cl_chatbox.lua" )
include( "client/cl_help.lua" )
include( "client/cl_jukebox.lua" )
include( "client/cl_hud.lua" )
include( "client/cl_player.lua" )
include( "client/cl_playermenu.lua" )
include( "client/cl_nominate.lua" )

include( "shared/sh_text.lua" )
include( "shared/sh_jukebox.lua" )
include( "shared/sh_weapons.lua" )

include( "modules/shop/client/cl_data.lua" )
include( "modules/shop/client/cl_shop.lua" )
include( "modules/shop/client/cl_hud.lua" )
include( "modules/shop/client/cl_shop_model.lua" )
include( "modules/shop/client/cl_shop_item.lua" )
include( "modules/shop/client/cl_shop_button.lua" )
include( "modules/shop/sh_data.lua" )
include( "modules/shop/client/cl_achievements.lua" )

include( "modules/admin/client/cl_chat.lua" )
include( "modules/admin/client/cl_admin.lua" )

usermessage.Hook( "stopsounds", function( )
	RunConsoleCommand( "stopsounds" )
end)

usermessage.Hook( "preround", function( um )
	PREROUND = um:ReadBool( )
end)

usermessage.Hook( "pretime", function( um )
	PREROUND_TIME = um:ReadString( )
end)

usermessage.Hook( "map", function( um )
	MAP.Name = um:ReadString( )
	MAP.TeamBased = um:ReadBool( )
	MAP.RoundBased = um:ReadBool( )
	
	if MAP.TeamBased == true then
		TEAM_BASED_MAP = true
	elseif MAP.RoundBased == true then
		TEAM_BASED_MAP = true
	else
		TEAM_BASED_MAP = false
	end
end)

function GM:OnContextMenuOpen( )
	DEVASION:CreateMenu( )
end

function GM:OnContextMenuClose( )
	DEVASION:RemoveMenu( )
end

function GM:OnSpawnMenuOpen()
	THIRDPERSON = not THIRDPERSON
end

function GM:ShowTeam( )
end