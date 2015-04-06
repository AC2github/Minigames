local PANEL = {}

function PANEL:Init( )
	self:ShowCloseButton( false )
	self:SetDraggable( false )
	self:SetTitle("")
	self:MakePopup( )
end

function PANEL:Paint( )
	draw.RoundedBox( 6, 0, 0, self:GetWide( ), self:GetTall( ), Color( 175, 175, 175, 255 ) )
	draw.RoundedBox( 6, 5, 5, self:GetWide( ) - 10, self:GetTall( ) - 9, Color( 100, 100, 100, 255 ) )
end

vgui.Register( "DMGMenu", PANEL, "DFrame" )