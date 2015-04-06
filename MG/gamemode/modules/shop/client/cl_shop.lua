
local banned = {
	"admin", 
	"owner",
	"moderator",
	"server"
}

local function ConvertNameToID( name )
	for k, v in pairs( player.GetAll( ) ) do
		if v:Name( ) == tostring( name ) then
			return v:UserID( )
		end
		
		return nil
	end
end

function MakeShop( )
	if not LocalPlayer( ).PlayerData then return end
	if not LocalPlayer( ).PlayerData["money"] then return end
	if not LocalPlayer( ).PlayerData["items"] then return end

	local w = ScrW( )
	local h = ScrH( )
	local mode = "HAT"
	local defaultcolor = "NULL"
	local TradePlayer = nil
	local TempItems = {}
	
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
		
		if mode == "OPTIONS" then
			surface.SetDrawColor( 255, 255, 255, 255 )
			
			surface.DrawLine( 15, 150, Frame:GetWide( ) - 350, 150 )
			draw.SimpleTextOutlined( "EDIT TITLE", "Trebuchet24", 15, 125, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, 2, Color( 0, 0, 0, 255 ) )
			
			surface.DrawLine( 15, 250, Frame:GetWide( ) - 350, 250 )
			draw.SimpleTextOutlined( "EDIT TITLE COLOR", "Trebuchet24", 15, 225, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, 2, Color( 0, 0, 0, 255 ) )
		elseif mode == "CRAFTING" then
			surface.SetDrawColor( 255, 255, 255, 255 )
			surface.DrawLine( 15, 165, Frame:GetWide( ) - 385, 165 )
			draw.SimpleTextOutlined( "YOUR ITEMS - HATS ONLY", "HUDNumber", 15, 125, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, 2, Color( 0, 0, 0, 255 ) )
			surface.DrawLine( Frame:GetWide( ) - 325, 165, Frame:GetWide( ) - 35, 165 )
			draw.SimpleTextOutlined( "CRAFTING AREA", "HUDNumber", Frame:GetWide( ) - 300, 125, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT, 2, Color( 0, 0, 0, 255 ) )
		end
	end
	
	local close = vgui.Create( "Shop_Button", Frame )
	close:SetPos( Frame:GetWide( ) - 150,  Frame:GetTall( ) - 100 )
	close:SetSize( 150, 75 )
	close:Text( "Close" )
	close.DoClick = function( )
		Frame:Close( )
	end
	
	local hats = vgui.Create( "Shop_Button", Frame )
	hats:SetPos( 5, 10 )
	hats:SetSize( 125, 75 )
	hats:Text( "HATS" )
	
	local x, y = hats:GetPos( )
	
	local trails = vgui.Create( "Shop_Button", Frame )
	trails:SetPos( x + 125, 10 )
	trails:SetSize( 125, 75 )
	trails:Text( "TRAILS" )
	
	local x, y = trails:GetPos( )
	
	local models = vgui.Create( "Shop_Button", Frame )
	models:SetPos( x + 125, 10 )
	models:SetSize( 125, 75 )
	models:Text( "MODELS" )
	
	local x, y = models:GetPos( )
	
	local aura = vgui.Create( "Shop_Button", Frame )
	aura:SetPos( x + 125, 10 )
	aura:SetSize( 125, 75 )
	aura:Text( "AURA" )
	
	local x, y = aura:GetPos( )
	
	local titles = vgui.Create( "Shop_Button", Frame )
	titles:SetPos( x + 125, 10 )
	titles:SetSize( 125, 75 )
	titles:Text( "TITLES" )
	
	local x, y = titles:GetPos( )
	
	local tags = vgui.Create( "Shop_Button", Frame )
	tags:SetPos( x + 125, 10 )
	tags:SetSize( 125, 75 )
	tags:Text( "TAGS" )
	
	local TradeButton = vgui.Create( "Shop_Button", Frame )
	TradeButton:SetPos( 5, Frame:GetTall( ) - 100 )
	TradeButton:SetSize( 150, 75 )
	TradeButton:Text( "Trade" )
	TradeButton:SetDisabled( true )
	
	local CraftButton = vgui.Create( "Shop_Button", Frame )
	CraftButton:SetPos( 155, Frame:GetTall( ) - 100 )
	CraftButton:SetSize( 150, 75 )
	CraftButton:Text( "Craft" )
	CraftButton:SetDisabled( true )
	
	local x, y = CraftButton:GetPos( )
	
	local OptionsButton = vgui.Create( "Shop_Button", Frame )
	OptionsButton:SetPos( x + 150, Frame:GetTall( ) - 100 )
	OptionsButton:SetSize( 150, 75 )
	OptionsButton:Text( "Options" )
	OptionsButton:SetVisible( false )
	
	if (LocalPlayer( ):IsPlatinum( )) then
		OptionsButton:SetVisible( true )
	end
	
	local editor = vgui.Create( "DTextEntry", Frame )
	editor:SetSize( 300, 20 )
	editor:SetPos( 15, 170 )
	
	local warning = vgui.Create( "DLabel", Frame )
	warning:SetText( "" )
	warning:SetPos( 15, 200 )
	warning:SetFont( "ChatFont" )
	warning:SizeToContents( )
	
	local editorbutton = vgui.Create( "Shop_Button", Frame )
	editorbutton:SetSize( 150, 30 )
	editorbutton:SetPos( 330, 165 )
	editorbutton:Text( "submit" )
	
	editorbutton.DoClick = function( )
	
		if string.len( editor:GetValue( ) ) >= 20 and not LocalPlayer( ):IsSuperAdmin( ) then
			warning:SetText( "Title is too long." )
			warning:SizeToContents( )
			
			timer.Simple( 3, function( )
				warning:SetText( "" )
			end)
			
			return
		end
		
		for k, v in pairs( banned ) do
			if string.find( string.lower( editor:GetValue( ) ), string.lower( v ) ) and not LocalPlayer( ):IsSuperAdmin( ) then
				warning:SetText( "Title contains illegal words." )
				warning:SizeToContents( )
			
				timer.Simple( 3, function( )
					warning:SetText( "" )
				end)
				
				return
			end
		end
		
		RunConsoleCommand( "shop_title", editor:GetValue( ) )
		Frame:Close( )
	end
	
	local list = vgui.Create( "DMultiChoice", Frame )
	list:SetPos( 15, 270 )
	list:SetSize( 300, 20 )
	
	local BlockColors = {
		"NULL"
	}
	
	for k, v in pairs( TitleColors ) do
		if not table.HasValue( BlockColors, k ) then
			list:AddChoice( string.upper( k:Left( 1 ) )..string.sub( k, 2 ) )
		end
	end
	
	function list:OnSelect(index,value,data)
		defaultcolor = string.lower( value )
	end
	
	local listbutton = vgui.Create( "Shop_Button", Frame )
	listbutton:SetSize( 150, 30 )
	listbutton:SetPos( 330, 265 )
	listbutton:Text( "submit" )
	
	listbutton.DoClick = function( )
		Frame:Close( )
		RunConsoleCommand( "shop_title_color", defaultcolor )
	end
	
	local CraftList = vgui.Create( "DPanelList", Frame )
	CraftList:SetPos( 15, 170 )
	CraftList:SetSize( Frame:GetWide( ) - 365, Frame:GetTall( ) - 300 )
	
	CraftList:EnableVerticalScrollbar( true ) 
    CraftList:EnableHorizontal( true ) 
	CraftList:SetPadding( 4 )
	CraftList:SetSpacing( 10 )
	CraftList:SetNoSizing( false )
	
	CraftList.Paint = function( ) end
	
	local CraftArea = vgui.Create( "DPanelList", Frame )
	CraftArea:SetPos( Frame:GetWide( ) - 295, 170 )
	CraftArea:SetSize( Frame:GetWide( ) - 550, Frame:GetTall( ) - 300 )
	
	CraftArea:EnableVerticalScrollbar( true ) 
    CraftArea:EnableHorizontal( true ) 
	CraftArea:SetPadding( 4 )
	CraftArea:SetSpacing( 10 )
	CraftArea:SetNoSizing( false )
	
	CraftArea.Paint = function( ) end
	
	local CraftListItems = {}
	local CraftAreaItems = {}
	local TempCraftItems = {}
	
	local function UpdateCraft( )
		local inventory = {}
		CraftList:Clear( )
		CraftArea:Clear( )
		for k, v in pairs( shopData ) do
			if table.HasValue( LocalPlayer( ).PlayerData["items"], shopData[k].item ) and shopData[k].Type == "HAT" then
				inventory[k] = vgui.Create( "Shop_Item", CraftList )
				inventory[k]:SetSize( 100, 100 )
				inventory[k]:SetItems( shopData[k] )
				inventory[k].Place = "AREA"
				
				inventory[k].DoClick  = function( )
					local count = CraftArea:GetItems( )
					if #count > 5 then return end
					
					if inventory[k].Place == "AREA" then
						CraftArea:AddItem( inventory[k] )
						table.insert( TempCraftItems, shopData[k].item )
						inventory[k].Place = "LIST"
					end
				end
	
				CraftList:AddItem( inventory[k] )
			end
		end
	end
	
	UpdateCraft( )
	
	local Craft = vgui.Create( "Shop_Button", Frame )
	Craft:SetSize( 150, 75 )
	Craft:SetPos( Frame:GetWide( ) - 250, Frame:GetTall( ) - 185 )
	Craft:Text( "CRAFT" )
	Craft.DoClick = function( )
		Frame:Close( )
		datastream.StreamToServer("Shop_Craft", {TempCraftItems} )
	end
	
	local itemlist = vgui.Create( "DPanelList", Frame )
	itemlist:SetPos( 5, 105 )
	itemlist:SetSize( Frame:GetWide( ) - 5, Frame:GetTall( ) - 215 )
	
	itemlist:EnableVerticalScrollbar( true ) 
    itemlist:EnableHorizontal( true ) 
    itemlist:SetPadding( 10 )
    itemlist:SetSpacing( 10 )
	
	itemlist.Paint = function( ) end
	
	local LINE = {}
    local function CreateLine( tab, type )
		mode = "HAT"
		editor:SetVisible( false )
		list:SetVisible( false )
		editorbutton:SetVisible( false )
		listbutton:SetVisible( false )
		CraftList:SetVisible( false )
		CraftArea:SetVisible( false )
		Craft:SetVisible( false )
		
		itemlist:SetVisible( true )
		itemlist:Clear( )
		itemlist.VBar:SetScroll( 1 )
			for k, v in pairs( shopData ) do
				if shopData[k].Type == type and not table.HasValue( shopData.BannedItems, shopData[k].item ) then
					LINE[k] = vgui.Create("DPanel", tab )
					LINE[k]:SetSize( itemlist:GetWide( ) - 35, 65 )
					LINE[k].Paint = function( )
						surface.SetDrawColor( COLOR_WHITE )
						surface.DrawOutlinedRect( 0, 0, LINE[k]:GetWide(), LINE[k]:GetTall() )
					
						draw.RoundedBox( 0, 0, 0, LINE[k]:GetWide( ), LINE[k]:GetTall( ), Color( 52, 52, 52, 200 ) )
					end
				
					local cost = shopData[k].Cost
				
					if LocalPlayer( ):IsPlatinum( ) then
						cost = math.Round( shopData[k].Cost / 2 )
					elseif LocalPlayer( ):IsPremium( ) then
						cost = cost - math.Round( shopData[k].Cost / 4 )
					end
				
					local Icon = vgui.Create("SpawnIcon", LINE[k] )
					Icon:SetIconSize( 55 )
					Icon:SetPos( 3, 5 )
				
					if shopData[k].Type == "TRAIL" then 
						Icon:SetVisible( false )
						local Sprite = vgui.Create( "DSprite", LINE[k] )
						Sprite:SetSize( 55, 55 )
						Sprite:SetPos( 30, 32 )
						Sprite:SetMaterial( Material( shopData[k].Preview ) )
					elseif shopData[k].Type == "TITLE" then
						Icon:SetModel( "models/extras/info_speech.mdl" )
					elseif shopData[k].Type == "AURA" then
						Icon:SetModel( "models/props_lab/jar01a.mdl" )
					elseif shopData[k].Type == "TAG" then
						Icon:SetVisible( false )
						local Sprite = vgui.Create( "DSprite", LINE[k] )
						Sprite:SetSize( 55, 55 )
						Sprite:SetPos( 30, 32 )
						Sprite:SetMaterial( Material( shopData[k].Preview ) )
					else
						Icon:SetModel(shopData[k].Preview or "models/props_lab/jar01a.mdl")
					end
				
					Icon:SetToolTip(nil)
				
					local color = COLOR_CANBUY
				
					local buy = vgui.Create( "Shop_Button", LINE[k] )
					buy:SetPos( itemlist:GetWide( ) - 115, 5 )
					buy:SetSize( 80, 30 )
					buy:Text( "BUY" )
					buy:SmallFont( true )
					buy.DoClick = function( )
						RunConsoleCommand( "shop_buy", shopData[k].item )
						Frame:Close( )
					end	
				
					local equip = vgui.Create( "Shop_Button", LINE[k] )
					equip:SetPos( itemlist:GetWide( ) - 115, 35 )
					equip:SetSize( 80, 30 )
					equip:Text( "EQUIP" )
					equip:SmallFont( true )
					equip:SetDisabled( true )
					equip.DoClick = function( )
						RunConsoleCommand( "shop_equip", shopData[k].item )
						Frame:Close( )
					end
			
					if LocalPlayer( ).PlayerData["money"] < cost then
						color = COLOR_CANNOTBUY
						buy:SetDisabled( true )
						buy:Text( "Too poor" )
						equip:SetDisabled( not table.HasValue( LocalPlayer( ).PlayerData["items"], shopData[k].item ) )
					elseif shopData[k].DonatorOnly and not LocalPlayer( ):IsPlatinum( ) then
						color = COLOR_CANNOTBUY
						buy:SetDisabled( true )
						buy:Text( "VIP only" )
						equip:SetDisabled( not table.HasValue( LocalPlayer( ).PlayerData["items"], shopData[k].item ) )
					elseif table.HasValue( LocalPlayer( ).PlayerData["items"], shopData[k].item ) then
						color = COLOR_CANBUY
						buy:SetDisabled( true )
						buy:Text( "Bought" )
						equip:SetDisabled( false )
					else
						color = COLOR_CANBUY
						buy:SetDisabled( false )
						buy:Text( "Buy" )
						equip:SetDisabled( false )
					end
				
					AddText( LINE[k], 65, 5, shopData[k].Name.." - "..cost, "ScoreboardText", color )
					AddText( LINE[k], 65, 22, shopData[k].Desc, "ScoreboardText", COLOR_WHITE )
				
					if LocalPlayer( ):IsPlatinum( ) then
						AddText( LINE[k], 65, 40, "You have 50% discount on this item!", "ScoreboardText", COLOR_DISCOUNT )
					elseif LocalPlayer( ):IsPremium( ) then
						AddText( LINE[k], 64, 40, "You have 25% discount on this item", "ScoreboardText", COLOR_DISCOUNT )
					else
						AddText( LINE[k], 65, 40, "Donate for 50% discount!", "ScoreboardText", COLOR_DISCOUNT )
					end
				
				tab:AddItem( LINE[k] )
			end	
		end
    end
	
	hats.DoClick = function( )
		CreateLine( itemlist, "HAT" )
		mode = "HAT"
	end
	
	trails.DoClick = function( )
		CreateLine( itemlist, "TRAIL" )
		mode = "TRAIL"
	end
	
	models.DoClick = function( )
		CreateLine( itemlist, "MODEL" )
		mode = "MODEL"
	end
	
	aura.DoClick = function( )
		CreateLine( itemlist, "AURA" )
		mode = "AURA"
	end
	
	titles.DoClick = function( )
		CreateLine( itemlist, "TITLE" )
		mode = "TITLE"
	end
	
	tags.DoClick = function( )
		CreateLine( itemlist, "TAG" )
		model = "TAG" 
	end
	
	TradeButton.DoClick = function( )
		itemlist:SetVisible( false )
		editor:SetVisible( false )
		editorbutton:SetVisible( false )
		list:SetVisible( false )
		listbutton:SetVisible( false )
		CraftList:SetVisible( false )
		CraftArea:SetVisible( false )
		Craft:SetVisible( false )
		
		mode = "TRADE"
	end
	
	OptionsButton.DoClick = function( )
		itemlist:SetVisible( false )
		CraftList:SetVisible( false )
		CraftArea:SetVisible( false )
		Craft:SetVisible( false )
		
		list:SetVisible( true )
		listbutton:SetVisible( true )
		editorbutton:SetVisible( true )
		editor:SetVisible( true )
		mode = "OPTIONS"
	end
	
	CraftButton.DoClick = function( )
		itemlist:SetVisible( false )
		
		list:SetVisible( false )
		listbutton:SetVisible( false )
		editorbutton:SetVisible( false )
		editor:SetVisible( false )
		
		CraftList:SetVisible( true )
		CraftArea:SetVisible( true )
		Craft:SetVisible( true )
		mode = "CRAFTING"
		UpdateCraft( )
	end
	
	CreateLine( itemlist, "HAT" )
	
end
concommand.Add( "makeshop", CreateShop )