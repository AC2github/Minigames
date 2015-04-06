
function MakeAchievements( )
	if not LocalPlayer( ).PlayerData then return end
	if not LocalPlayer( ).PlayerData["money"] then return end
	if not LocalPlayer( ).PlayerData["achievements"] then return end

	local w = ScrW( )
	local h = ScrH( )
	
	local function AddText( P, x, y, Text, Font, Color )
        local label = vgui.Create("DLabel", P )
        label:SetPos( x, y )
        label:SetText( Text )
        label:SetFont( Font )
        label:SetTextColor( Color )
        label:SizeToContents()
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
		--surface.DrawLine( 15, 100, Frame:GetWide( ) - 15, 100 )
		surface.DrawLine( 15, Frame:GetTall( ) - 100, Frame:GetWide( ) - 15, Frame:GetTall( ) - 100 )
		
		draw.SimpleText( "Achievements are disabled with 5 or less people playing.", "Trebuchet24", 15, Frame:GetTall( ) - 95, color_white )
	end
	
	local close = vgui.Create( "Shop_Button", Frame )
	close:SetPos( Frame:GetWide( ) - 150,  Frame:GetTall( ) - 100 )
	close:SetSize( 150, 75 )
	close:Text( "Close" )
	close.DoClick = function( )
		Frame:Close( )
	end
	
	local achievements = vgui.Create( "Shop_Button", Frame )
	achievements:SetPos( 5, 10 )
	achievements:SetSize( 155, 80 )
	achievements:Text( "Achievements" )

	local x, y = achievements:GetPos( )
	
	local score = vgui.Create( "Shop_Button", Frame )
	score:SetPos( x + 155, 10 )
	score:SetSize( 155, 80 )
	score:Text( "Progress" )
	
	local x, y = score:GetPos( )
	
	local ranks = vgui.Create( "Shop_Button", Frame )
	ranks:SetPos( x + 155, 10 )
	ranks:SetSize( 155, 80 )
	ranks:Text( "Ranks" )
	
	local list = vgui.Create( "DPanelList", Frame )
	list:SetPos( 5, 105 )
	list:SetSize( Frame:GetWide( ) - 5, Frame:GetTall( ) - 215 )
	
	list:EnableVerticalScrollbar( true ) 
    list:EnableHorizontal( true ) 
    list:SetPadding( 10 )
    list:SetSpacing( 10 )
	
	list.Paint = function( ) end
	
	local progress = vgui.Create( "DPanel", Frame )
	progress:SetPos( 5, 105 )
	progress:SetSize( Frame:GetWide( ) - 5, Frame:GetTall( ) - 215 )
	
	progress:SetVisible( false )
	
	progress.Paint = function( ) end
	
	AddText( progress, 15, 15, "Progress", "Trebuchet24", COLOR_WHITE )
	
	AddText( progress, 15, 45, "Money:", "ChatFont", COLOR_WHITE )
	
	if LocalPlayer( ).PlayerData["money"] then
		AddText( progress, progress:GetWide( ) - 100, 45, LocalPlayer().PlayerData["money"] or "0", "ChatFont", COLOR_WHITE )
	end
	
	AddText( progress, 15, 65, "Items bought:", "ChatFont", COLOR_WHITE )
	
	if LocalPlayer( ).PlayerData["items"] then
		AddText( progress, progress:GetWide( ) - 100, 65, table.Count( LocalPlayer().PlayerData["items"] ) or "0", "ChatFont", COLOR_WHITE )
	end
	
	AddText( progress, 15, 85, "Achievements unlocked:", "ChatFont", COLOR_WHITE )
	
	if LocalPlayer( ).PlayerData["achievements"] then
		AddText( progress, progress:GetWide( ) - 100, 85, table.Count( LocalPlayer().PlayerData["achievements"] ).." / "..tostring(#achievementsData), "ChatFont", COLOR_WHITE )
	end
	
	AddText( progress, 15, 115, "Shop", "Trebuchet24", COLOR_WHITE )
	
	AddText( progress, 15, 145, "Crates opened:", "ChatFont", COLOR_WHITE )
	AddText( progress, progress:GetWide( ) - 100, 145, "0", "ChatFont", COLOR_WHITE )
	
	AddText( progress, 15, 165, "Rare hats found:", "ChatFont", COLOR_WHITE )
	AddText( progress, progress:GetWide( ) - 100, 165, "0", "ChatFont", COLOR_WHITE )
	
	AddText( progress, 15, 185, "Items crafted:", "ChatFont", COLOR_WHITE )
	AddText( progress, progress:GetWide( ) - 100, 185, "0", "ChatFont", COLOR_WHITE )
	
	local ranklist = vgui.Create( "DPanel", Frame )
	ranklist:SetPos( 5, 105 )
	ranklist:SetSize( Frame:GetWide( ) - 5, Frame:GetTall( ) - 215 )
	
	ranklist:SetVisible( false )
	
	ranklist.Paint = function( ) end
	
	AddText( ranklist, 15, 15, "TOP 5 - MOST MONEY", "Trebuchet24", COLOR_WHITE )
	
	for k, v in pairs( LocalPlayer( ).Ranks["money"] ) do
		AddText( ranklist, 15, ( k * 30 ) + 20, LocalPlayer( ).Ranks["money"][k].Name, "ChatFont", COLOR_WHITE )
	end
	
	for k, v in pairs( LocalPlayer( ).Ranks["money"] ) do
		AddText( ranklist, ranklist:GetWide( ) - 100, ( k * 30 ) + 20, LocalPlayer( ).Ranks["money"][k].Money, "ChatFont", COLOR_WHITE )
	end
	
	AddText( ranklist, 15, 210, "TOP 5 - MOST POINTS", "Trebuchet24", COLOR_WHITE )
	
	for k, v in pairs( LocalPlayer( ).Ranks["points"] ) do
		AddText( ranklist, 15, ( k * 30 ) + 215, LocalPlayer( ).Ranks["points"][k].Name, "ChatFont", COLOR_WHITE )
	end
	
	for k, v in pairs( LocalPlayer( ).Ranks["points"] ) do
		AddText( ranklist, ranklist:GetWide( ) - 100, ( k * 30 ) + 215, LocalPlayer( ).Ranks["points"][k].Points, "ChatFont", COLOR_WHITE )
	end
	
	local function CreateAchievements( )
	list:Clear( )
	local achv = {}
		for k, v in pairs( achievementsData ) do
			achv[k] = vgui.Create( "DPanel" )
			achv[k]:SetSize( list:GetWide( ) - 35, 55 )
			achv[k].Paint = function( )
				surface.SetDrawColor( COLOR_WHITE )
				surface.DrawOutlinedRect( 0, 0, achv[k]:GetWide(), achv[k]:GetTall() )
					
				draw.RoundedBox( 0, 0, 0, achv[k]:GetWide( ), achv[k]:GetTall( ), Color( 52, 52, 52, 200 ) )
			end
			
			if table.HasValue( LocalPlayer( ).PlayerData["achievements"], achievementsData[k].achv ) then
				AddText( achv[k], 10, 5, achievementsData[k].Name, "ScoreboardText", COLOR_CANBUY )
				AddText( achv[k], achv[k]:GetWide( ) - 115, 15, "UNLOCKED", "Trebuchet24", COLOR_CANBUY )
			else
				AddText( achv[k], 10, 5, achievementsData[k].Name, "ScoreboardText", COLOR_CANNOTBUY )
				AddText( achv[k], achv[k]:GetWide( ) - 100, 15, "LOCKED", "Trebuchet24", COLOR_CANNOTBUY )
			end
			
			AddText( achv[k], 10, 20, achievementsData[k].Desc, "ScoreboardText", COLOR_WHITE )
			AddText( achv[k], 10, 35, "Reward: "..achievementsData[k].Reward.." coins.", "ScoreboardText", COLOR_DISCOUNT )
			
			list:AddItem( achv[k] )
		end
	end
	
	CreateAchievements( )
	
	achievements.DoClick = function( )
		list:SetVisible( true )
		progress:SetVisible( false )
		ranklist:SetVisible( false )
		CreateAchievements( )
	end
	
	score.DoClick = function( )
		list:SetVisible( false )
		ranklist:SetVisible( false )
		progress:SetVisible( true )
	end
	
	ranks.DoClick = function( )
		list:SetVisible( false )
		progress:SetVisible( false )
		ranklist:SetVisible( true )
	end
	
end
concommand.Add( "makeachievements", MakeAchievements )