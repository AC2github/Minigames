local maps = {}usermessage.Hook( "maps_reset", function( um )	maps = {}end)usermessage.Hook( "maps", function( um )	table.insert( maps, um:ReadString( ) )end)local function CreateNominate( )	if #maps == 0 then return end		local frame = vgui.Create( "DFrame" )	frame:SetSize( ScrW( ) / 2 - 100, ScrH( ) / 2 + 100 )	frame:Center( )	frame:SetTitle( "" )	frame:ShowCloseButton( false )	frame:SetDraggable( false )	frame:MakePopup( )		frame.Paint = function( self )		surface.SetDrawColor( 255, 255, 255, 255 )		surface.DrawOutlinedRect( 0, 0, self:GetWide( ), self:GetTall( ) )				surface.SetDrawColor( 0, 0, 0, 180 )		surface.DrawRect( 0, 0, self:GetWide( ), self:GetTall( ) )	end		local panel = vgui.Create( "DPanelList", frame )	panel:SetPos( 5, 15 )	panel:SetSize( frame:GetWide( ) - 10, frame:GetTall( ) - 20 )		panel.Paint = function( ) end		panel:EnableVerticalScrollbar( true )	panel:SetPadding( 15 )	panel:SetSpacing( 15 )		local button = {}		for k, v in pairs( maps ) do		button[k] = vgui.Create( "DButton" )		button[k]:SetSize( panel:GetWide( ) - 5, 30 )		button[k]:SetText( v )				button[k].DoClick = function( )			RunConsoleCommand( "mg_nominate", v )			frame:Close( )		end				panel:AddItem( button[k] )	end	endusermessage.Hook( "maps_menu", CreateNominate )