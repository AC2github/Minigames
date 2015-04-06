local PANEL = {}

function PANEL:Init( )

	self:SetSize( 100, 100 )
	self:SetText( "" )
	self.text = ""
	
	self.texture = surface.GetTextureID( "freeskill/shop/button" )
	
	self.Model = vgui.Create( "DModel", self )
	self.Model:SetSize( 65, 65  )
	self.Model:SetPos( 20, 15 )
	self.Model:SetData( shopData[2] )
end

function PANEL:OnCursorEntered()
	self.texture = surface.GetTextureID( "freeskill/shop/button_hover" )
end

function PANEL:SetItems( shit )
	self.Model:SetData( shit )
end

function PANEL:SetName( text )
	self.text = text or ""
end

function PANEL:OnCursorExited()
	self.texture = surface.GetTextureID( "freeskill/shop/button" )
end

function PANEL:Paint( )
	surface.SetTexture( self.texture )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect( 0, 0, self:GetWide( ), self:GetTall( ) )
end

vgui.Register("Shop_Item", PANEL, "DButton" )