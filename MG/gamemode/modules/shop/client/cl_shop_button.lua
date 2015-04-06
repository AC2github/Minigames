local PANEL = {}

function PANEL:Text( text )
	self.text = text
end

function PANEL:GetText( )
	return self.text 
end

function PANEL:Init( )
	self.texture = surface.GetTextureID( "freeskill/shop/button" )
	self:SetText( "" )
	self.font = "Trebuchet24"
	self.pressed = false
	self.drawinfo = false
end

function PANEL:SetPressed( bool )
	self.pressed = bool
	self.texture = surface.GetTextureID( "freeskill/shop/button" )
	
	if bool then
		self.texture = surface.GetTextureID( "freeskill/shop/button_hover" )
	end
end

function PANEL:SetDrawInfo( text )
	self.drawtext = text
end

function PANEL:OnCursorEntered()
	if self.pressed == true then return end
	self.texture = surface.GetTextureID( "freeskill/shop/button_hover" )
end

function PANEL:OnCursorExited()
	if self.pressed == true then return end
	self.texture = surface.GetTextureID( "freeskill/shop/button" )
end

function PANEL:SmallFont( bool )
	if bool then
		self.font = "ChatFont"
	end
end

function PANEL:Paint( )
	surface.SetTexture( self.texture )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( 0, 0, self:GetWide( ), self:GetTall( ) )
	
	draw.SimpleTextOutlined( self.text or "", self.font, self:GetWide( ) / 2, self:GetTall( )  / 2, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 2, Color( 0, 0, 0, 255 ) )
end

vgui.Register("Shop_Button", PANEL, "DButton" )