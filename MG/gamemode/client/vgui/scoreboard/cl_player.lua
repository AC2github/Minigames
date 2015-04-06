local PANEL = {}

function PANEL:Init( )
	self:SetWide( 300 )
	self:SetTall( 20 )
end

local SCROLLBAR_SIZE = 0

function PANEL:SetPlayer( ply )
	if not ValidEntity( ply ) then return end
	self.Player = ply 
	
	self.Avatar = vgui.Create( "AvatarImage", self )
	self.Avatar:SetPos( 5, (self:GetTall( ) / 2) - 16 )
	self.Avatar:SetSize( 32, 32 )
	self.Avatar:SetPlayer( self.Player, 32 )
	
	self.PM = vgui.Create( "ScoreboardButton", self )
	self.PM:SetSize( 17, 17 )
	self.PM:SetPos( self:GetWide( ) - 200 - SCROLLBAR_SIZE, (self:GetTall( ) / 2) - ( 17 / 2 ) )
	self.PM:SetIcon( "gui/silkicons/user" )
	self.PM:SetHelp( "PM" )
	self.PM.OnMousePressed = function( )
		if not ValidEntity( self.Player ) then return end
		MakePlayerMenu( "pm", self.Player:UserID( ) )
	end
	
	self.Give = vgui.Create( "ScoreboardButton", self )
	self.Give:SetSize( 17, 17 )
	self.Give:SetPos( self:GetWide( ) - 180 - SCROLLBAR_SIZE, (self:GetTall( ) / 2) - ( 17 / 2 ) )
	self.Give:SetIcon( "gui/silkicons/add" )
	self.Give:SetHelp( "Give" )
	self.Give.OnMousePressed = function( )
		if not ValidEntity( self.Player ) then return end
		MakePlayerMenu( "give", self.Player:UserID( ) )
	end
	
	self.Title = vgui.Create( "ScoreboardButton", self )
	self.Title:SetSize( 17, 17 )
	self.Title:SetPos( self:GetWide( ) - 160 - SCROLLBAR_SIZE, (self:GetTall( ) / 2) - ( 17 / 2 ) )
	self.Title:SetIcon( "gui/silkicons/wrench" )
	self.Title:SetHelp( "Change Title" )
	self.Title.OnMousePressed = function( )
		if not ValidEntity( self.Player ) then return end
		Derma_StringRequest("Title card", "Change the title of "..self.Player:Name( ), "", function(text) RunConsoleCommand("shop_usecard", self.Player:UserID( ), text) end)
	end
	
	self.start_box_x, start_box_y = self.PM:GetPos( )
	self.end_box_x, end_box_y = self.Title:GetPos( )
	
	if LocalPlayer( ):IsAdmin( ) then
		if not ValidEntity( self.Player ) then return end
		self.Admin = vgui.Create( "ScoreboardButton", self )
		self.Admin:SetSize( 17, 17 )
		self.Admin:SetPos( self:GetWide( ) - 140 - SCROLLBAR_SIZE, (self:GetTall( ) / 2) - ( 17 / 2 ) )
		self.Admin:SetIcon( "gui/silkicons/shield" )
		self.Admin:SetHelp( "Admin" )
		self.Admin.OnMousePressed = function( )
			if not ValidEntity( self.Player ) then return end
			local Admin = DermaMenu( )
			Admin:AddOption("Kick", function( ) RunConsoleCommand("devasion_kick", ply:UserID( ) ) end )
			Admin:AddOption("Ban", function( ) RunConsoleCommand("devasion_ban", ply:UserID( ) ) end )
			Admin:AddOption("Slay", function( ) RunConsoleCommand("devasion_slay", ply:UserID( ) ) end )
			Admin:AddOption("Slap", function( ) RunConsoleCommand("devasion_slap", ply:UserID( ) ) end )
			Admin:AddOption("Spawn", function( ) RunConsoleCommand("devasion_spawn", ply:UserID( ) )  end )
			local Teleport = Admin:AddSubMenu("Teleport")
			Teleport:AddOption("Bring", function( ) RunConsoleCommand("devasion_teleport", "bring", ply:UserID( ) ) end )
			Teleport:AddOption("Goto", function( ) RunConsoleCommand("devasion_teleport", "goto", ply:UserID( ) ) end )
			local Mute = Admin:AddSubMenu("Mute")
			local Text = Mute:AddSubMenu("Text")
			local Voice = Mute:AddSubMenu("Voice")	
			Text:AddOption("On", function( ) RunConsoleCommand("da_mute", ply:UserID( ), "1" ) end )
			Text:AddOption("Off", function( ) RunConsoleCommand("da_mute", ply:UserID( ), "0" ) end )
			Voice:AddOption("On", function( ) RunConsoleCommand("da_voicemute", ply:UserID( ), "1" ) end )
			Voice:AddOption("Off", function( ) RunConsoleCommand("da_voicemute", ply:UserID( ), "0" ) end )
			Admin:Open( )
		end
		self.end_box_x, end_box_y = self.Admin:GetPos( )
	end
end

function PANEL:Paint( )
	if not ValidEntity( self.Player ) then return end
	
	local name = self.Player:Name( )
	local r, g, b = team.GetColor( self.Player:Team( ) )["r"], team.GetColor( self.Player:Team( ) )["g"], team.GetColor( self.Player:Team( ) )["b"]
	
	surface.SetDrawColor( r, g, b, 150 )
	surface.DrawRect( 0, 0, self:GetWide( ), self:GetTall( ) )
	
	if LocalPlayer( ):IsAdmin( ) then
		draw.RoundedBox( 6, self.start_box_x - 5, (self:GetTall( ) / 2) - 13, (self.start_box_x - self.end_box_x) + 147, 25, Color( 0, 0, 0, 180 ) )
	else
		draw.RoundedBox( 6, self.start_box_x - 5, (self:GetTall( ) / 2) - 13, (self.start_box_x - self.end_box_x) + 107, 25, Color( 0, 0, 0, 180 ) )
	end
	
	if string.len( name ) >= 22 then
		name = string.Left( name, 22 ).."..."
	end
	
	draw.SimpleText( name, "Arial", 40, self:GetTall( ) / 2 - 9, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	draw.SimpleText( self.Player:GetNWString( "title" ) or "", "UiBold", 40, self:GetTall( ) / 2 + 6, TitleColors[self.Player:GetNWString( "titlecolor" )] or color_white , TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
	
	surface.SetDrawColor( 0, 0, 0, 150 )
	surface.DrawRect( self:GetWide( ) - 85, 0, 40, self:GetTall( ) )
	
	draw.SimpleText( self.Player:Frags( ), "ChatFont", self:GetWide( ) - 65, 20, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	
	if self.Player:Ping( ) >= 200 then
		draw.SimpleText( self.Player:Ping( ), "ChatFont", self:GetWide( ) - 25, 20, Color( 255, 0, 0, 200 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	elseif self.Player:Ping( ) >= 100 then
		draw.SimpleText( self.Player:Ping( ), "ChatFont", self:GetWide( ) - 25, 20, Color( 255, 255, 255, 200 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	else
		draw.SimpleText( self.Player:Ping( ), "ChatFont", self:GetWide( ) - 25, 20, Color( 0, 255, 0, 200 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
end

vgui.Register( "scoreboard_player", PANEL )