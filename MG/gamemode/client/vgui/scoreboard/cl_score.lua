local background = surface.GetTextureID( "freeskill/scoreboard/scoreboard" )
local info = surface.GetTextureID( "freeskill/scoreboard/scoreboard_info" )

local SCROLLBAR_SIZE_RED = 0
local SCROLLBAR_SIZE_BLUE = 0

TEAM_BASED_MAP = false

function GM:CreateScoreboard()	
	if pboard then
		pboard:Remove( )
	end

	pboard = vgui.Create( "DFrame" )
	pboard:SetSize( ScrW( ) / 2 + 200, ScrH( ) / 2 + 125 )
	local w, h = pboard:GetSize( )
	
	pboard:SetPos( (ScrW( ) / 2) - ( w / 2 ), (ScrH( ) / 2) - ( h / 2 ) - 50 )
	pboard:SetTitle( "" )
	pboard:ShowCloseButton( false )

	if TEAM_BASED_MAP then
		local blue = vgui.Create( "DPanelList", pboard )
	
		blue:SetSize( pboard:GetWide( ) / 2 - 1, pboard:GetTall( ) - 232 )
		blue:SetPos( 1, pboard:GetTall( ) - 300 )
	
		blue:SetSpacing( 2 )
		blue:SetPadding( 0 )
		blue:EnableVerticalScrollbar( true )
		blue:SetEnabled( true )
	
		blue.Paint = function( ) 
		end
	
		for k, v in pairs( player.GetAll( ) ) do
		local player_red = {}
			if v:Team( ) == TEAM_RED then
				player_red[k] = vgui.Create( "scoreboard_player" )
				player_red[k]:SetSize( blue:GetWide( ), 40 )
				player_red[k]:SetPlayer( v )
			end
			blue:AddItem( player_red[k] )
		
			SCROLLBAR_SIZE_BLUE = blue:GetWide( )
		end
	end
			
	local red = vgui.Create( "DPanelList", pboard )
	
	if TEAM_BASED_MAP then
		red:SetSize( pboard:GetWide( ) / 2 - 2, pboard:GetTall( ) - 232 )
		red:SetPos( pboard:GetWide( ) / 2 + 1, pboard:GetTall( ) - 300 )
	else
		red:SetSize( pboard:GetWide( ) - 1, pboard:GetTall( ) - 232 )
		red:SetPos( 1, pboard:GetTall( ) - 300 )
	end
	
	red:SetSpacing( 2 )
	red:SetPadding( 0 )
	red:EnableVerticalScrollbar( true )
	red:SetEnabled( true )
	
	red.Paint = function( )
	end
	
	for k, v in pairs( player.GetAll( ) ) do
	local player_blue = {}
		if v:Team( ) == TEAM_BLUE then
			player_blue[k] = vgui.Create( "scoreboard_player" )
			player_blue[k]:SetSize( red:GetWide( ), 40 )
			player_blue[k]:SetPlayer( v )
		end
		
		red:AddItem( player_blue[k] )
		SCROLLBAR_SIZE_RED = red:GetWide( )
	end

	pboard.Paint = function( self )
		surface.SetDrawColor( 62, 62, 62, 220 )
		surface.DrawRect( 0, 0, self:GetWide( ), self:GetTall( ) )
		
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetTexture( background )
		surface.DrawTexturedRect( 1, 1, self:GetWide( ) - 2, self:GetTall( ) - 320 )
		
		surface.SetDrawColor( 255, 255, 255, 50 )
		surface.DrawOutlinedRect( 0, 0, self:GetWide( ), self:GetTall( )  )
		
		surface.DrawLine( 0, self:GetTall( ) - 320, self:GetWide( ), self:GetTall( ) - 320 )
		
		surface.DrawLine( 0, self:GetTall( ) - 25, self:GetWide( ), self:GetTall( ) - 25 )
		
		surface.SetDrawColor( 0, 0, 0, 215 )
		surface.DrawRect( 1, 25, self:GetWide( ) - 2, self:GetTall( ) - 381 )
		
		surface.SetFont( "HUDNumber" )
		local w, h = surface.GetTextSize( "MINIGAMES" )
		draw.SimpleText( "MINIGAMES", "varsity", (self:GetWide( ) / 2) , self:GetTall( ) - 440, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( "A gamemode by AC2 and massi-gear", "HudHintTextLarge", (self:GetWide( ) / 2), self:GetTall( ) - 410, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( "Playing on "..MAP.Name.."  with "..tostring( #player.GetAll( ) ).." players", "HudHintTextSmall", (self:GetWide( ) / 2), self:GetTall( ) - 390, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetTexture( info )
		surface.DrawTexturedRect( 1, self:GetTall( ) - 319, self:GetWide( ) / 2 - 1, 20 )
		surface.DrawTexturedRect( self:GetWide( ) / 2, self:GetTall( ) - 319, self:GetWide( ) / 2 - 1, 20 )
		
		if TEAM_BASED_MAP then
			surface.SetDrawColor( 255, 255, 255, 50 )
			surface.DrawLine( self:GetWide( ) / 2, self:GetTall( ) - 319, self:GetWide( ) / 2, self:GetTall( ) - 25 )
		end
		
		// Red side
		draw.SimpleText( "Name/Title", "Default", 40, self:GetTall( ) - 310, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText( "Score", "Default", SCROLLBAR_SIZE_RED - 65, self:GetTall( ) - 310, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		draw.SimpleText( "Ping", "Default", SCROLLBAR_SIZE_RED - 25, self:GetTall( ) - 310, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		// Blue side
		if TEAM_BASED_MAP then
			draw.SimpleText( "Name/Title", "Default", (self:GetWide( ) / 2) + 40, self:GetTall( ) - 310, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
			draw.SimpleText( "Score", "Default", red:GetPos( ) + SCROLLBAR_SIZE_BLUE - 65, self:GetTall( ) - 310, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			draw.SimpleText( "Ping", "Default", red:GetPos( ) + SCROLLBAR_SIZE_BLUE - 25, self:GetTall( ) - 310, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
		
		local s = "Spectators: "
		
		for k, v in pairs( team.GetPlayers( TEAM_SPEC ) ) do
			s = s..v:Name( )..", "
		end
		
		if #team.GetPlayers( TEAM_SPEC ) <= 0 then s = "Spectators: None" end
		
		draw.SimpleText( s, "HudHintTextLarge", 10, self:GetTall( ) - 12.5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	end
end

function GM:ScoreboardShow()
	if not pScoreboard then
		GAMEMODE:CreateScoreboard( )
		pScoreboard = true
	end
	
	gui.EnableScreenClicker(true)
end

function GM:ScoreboardHide()
	if pScoreboard then
		pboard:Remove( )
		pScoreboard = false
	end
	
	gui.EnableScreenClicker(false)
end
