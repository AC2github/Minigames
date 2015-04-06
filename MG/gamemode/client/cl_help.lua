function MakeHelp( help )

	local w = ScrW( )
	local h = ScrH( )
	local labels = {}
	
	local function AddText( P, x, y, Text, Font, Color )
        local label = vgui.Create("DLabel", P )
        label:SetPos( x, y )
        label:SetText( Text )
        label:SetFont( Font )
        label:SetTextColor( Color )
        label:SizeToContents()
		table.insert( labels, label )
    end
	
	local Frame = vgui.Create( "DFrame" )
	Frame:SetSize( w / 2 + 200, h / 2 + 300 )
	Frame:Center()
	Frame:SetTitle( "" )
	Frame:SetDraggable( false )
	Frame:ShowCloseButton( false )
	Frame:MakePopup( )
	
	Frame.Paint = function( )
		Derma_DrawBackgroundBlur( Frame, 1 )
		
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.DrawLine( 15, Frame:GetTall( ) - 100, Frame:GetWide( ) - 15, Frame:GetTall( ) - 100 )
		
		draw.SimpleText( "Made by AC2", "Trebuchet24", 15, Frame:GetTall( ) - 95, color_white )
	end
	
	local close = vgui.Create( "Shop_Button", Frame )
	close:SetPos( Frame:GetWide( ) - 150,  Frame:GetTall( ) - 100 )
	close:SetSize( 150, 75 )
	close:Text( "Close" )
	close.DoClick = function( )
		Frame:Close( )
	end
	
	local info = vgui.Create( "Shop_Button", Frame )
	info:SetPos( 5, 10 )
	info:SetSize( 155, 80 )
	info:Text( "INFO" )
	
	local x, y = info:GetPos( )
	
	local donate = vgui.Create( "Shop_Button", Frame )
	donate:SetPos( x + 155, 10 )
	donate:SetSize( 155, 80 )
	donate:Text( "DONATE" )
	
	local x, y = donate:GetPos( )
	
	local about = vgui.Create( "Shop_Button", Frame )
	about:SetPos( x + 155, 10 )
	about:SetSize( 155, 80 )
	about:Text( "RULES" )
	
	local x, y = about:GetPos( )
	
	local credits = vgui.Create( "Shop_Button", Frame )
	credits:SetPos( x + 155, 10 )
	credits:SetSize( 155, 80 )
	credits:Text( "CREDITS" )
	
	local list = vgui.Create( "DPanelList", Frame )
	list:SetPos( 5, 105 )
	list:SetSize( Frame:GetWide( ) - 5, Frame:GetTall( ) - 215 )
	
	list:EnableVerticalScrollbar( true ) 
    list:EnableHorizontal( true ) 
    list:SetPadding( 10 )
    list:SetSpacing( 10 )
	
	list.Paint = function( ) end
	
	local function CreateText( TABLE )
		for k, v in pairs( labels ) do
			v:Remove( )
		end
		
		for k, v in pairs( TABLE ) do
			if string.Left( TABLE[k], 2 ) == "^r" then
				AddText( list, 5, ( k * 15 ) + 20, string.Right( TABLE[k], string.len( TABLE[k] ) - 3 ) , "ChatFont", Color( 255, 0, 0, 255 ) )
			elseif string.Left( TABLE[k], 2 ) == "^b" then
				AddText( list, 5, ( k * 15 ) + 20, string.Right( TABLE[k], string.len( TABLE[k] ) - 3 ) , "ChatFont", Color( 0, 0, 255, 255 ) )
			else
				AddText( list, 5, ( k * 15 ) + 20, v, "ChatFont", Color( 255, 255, 255, 255 ) )
			end
		end
		
		if donatehtml then
			donatehtml:Remove( )
		end
		
		if background1 then
			background2:Remove( )
			background1:Remove( )
		end
		
		if TABLE == DONATE_TEXT then
			local x, y = labels[#labels]:GetPos( )
			
			background1 = vgui.Create( "DPanel", list )
			background1:SetSize( 300, 215 )
			background1:SetPos( (Frame:GetWide( ) / 2) - 350, y + 40 )
			background1.Paint = function( self )
				draw.RoundedBox( 6, 0, 0, self:GetWide( ), self:GetTall( ), Color( 0, 0, 0, 180 ) )
			end
			
			for k, v in pairs( DONATE_TEXT_PREMIUM ) do
				if string.Left( DONATE_TEXT_PREMIUM [k], 2 ) == "^r" then
					AddText( background1, 5, ( k * 19 ), string.Right( DONATE_TEXT_PREMIUM[k], string.len( DONATE_TEXT_PREMIUM[k] ) - 3 ) , "ChatFont", Color( 255, 0, 0, 255 ) )
				else
					AddText( background1, 5, ( k * 19 ), v, "ChatFont", Color( 255, 255, 255, 255 ) )
				end
			end
			
			background2 = vgui.Create( "DPanel", list )
			background2:SetSize( 300, 215 )
			background2:SetPos( (Frame:GetWide( ) / 2) + 50, y + 40 )
			background2.Paint = function( self )
				draw.RoundedBox( 6, 0, 0, self:GetWide( ), self:GetTall( ), Color( 0, 0, 0, 180 ) )
			end
			
			for k, v in pairs( DONATE_TEXT_PLATINUM ) do
				if string.Left( DONATE_TEXT_PLATINUM [k], 2 ) == "^r" then
					AddText( background2, 5, ( k * 19 ), string.Right( DONATE_TEXT_PLATINUM[k], string.len( DONATE_TEXT_PLATINUM[k] ) - 3 ) , "ChatFont", Color( 255, 0, 0, 255 ) )
				else
					AddText( background2, 5, ( k * 19 ), v, "ChatFont", Color( 255, 255, 255, 255 ) )
				end
			end
			
			local x, y = background2:GetPos( )
			
			AddText( Frame, 9, Frame:GetTall( ) - 225, "HOW TO DONATE", "ChatFont", Color( 255, 0, 0, 255 ) )
			AddText( Frame, 9, Frame:GetTall( ) - 200, "Press the button below to donate.", "ChatFont", Color( 255, 255, 255, 255 ) )
			AddText( Frame, 9, Frame:GetTall( ) - 185, "Donations are done manual so it might take some time.", "ChatFont", Color( 255, 255, 255, 255 ) )
		
			donatehtml = vgui.Create( "DButton", Frame )
			donatehtml:SetSize( 120, 30 )
			donatehtml:SetPos( 9, Frame:GetTall( ) - 150  )
			donatehtml:SetText( "Click here to donate!" )
			donatehtml.OnMousePressed = function( )
				local donatepage = vgui.Create( "DFrame" )
				donatepage:SetSize( ScrW( ) - 100, ScrH( ) - 100 )
				donatepage:Center( )
				donatepage:SetTitle( "" )
				donatepage:ShowCloseButton( false )
				donatepage:MakePopup( )
				
				donatepage.Paint = function( )
					surface.SetDrawColor( 255, 255, 255, 255 )
					surface.DrawOutlinedRect( 0, 0, donatepage:GetWide( ), donatepage:GetTall( ) )
					
					surface.SetDrawColor( 0, 0, 0, 180 )
					surface.DrawRect( 0, 0, donatepage:GetWide( ), donatepage:GetTall( ) )
					
					draw.SimpleText( "LOADING PAGE", "HUDNumber5", donatepage:GetWide( ) / 2, donatepage:GetTall( ) / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
				end
			
				local close = vgui.Create( "DButton", donatepage )
				close:SetSize( 100, 30 )
				close:SetPos( donatepage:GetWide( ) / 2 - 50, donatepage:GetTall( ) - 40 )
				close:SetText( "Close" )
				close.DoClick = function( )
					donatepage:Close( )
				end
				
				local html = vgui.Create( "HTML", donatepage )
				html:SetPos( 5, 5 )
				html:SetSize( donatepage:GetWide( ) - 7, donatepage:GetTall( ) - 50 )
				html:OpenURL( "http://ni23743_1.vweb05.nitrado.net/e/donate.php" )
				
				Frame:Close( )
			end
		end
	end
	
	CreateText( help or INFO_TEXT )

	info.DoClick = function( )
		CreateText( INFO_TEXT )
	end
	
	donate.DoClick = function( )
		CreateText( DONATE_TEXT )
	end
	
	about.DoClick = function( )
		CreateText( ABOUT_TEXT )
	end
	
	credits.DoClick = function( )
		CreateText( CREDITS_TEXT )
	end
	
end
concommand.Add( "makehelp", MakeHelp)