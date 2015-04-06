local PANEL = {}

function PANEL:Init( )
	self:SetWide( 10 )
	self:SetTall( 10 )
	self.help = ""
end

function PANEL:SetIcon( icon )
	self.PanelIcon = icon
end

function PANEL:SetHelp( help )
	self:SetToolTip( help )
end


function PANEL:Paint( )
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.SetTexture( surface.GetTextureID( self.PanelIcon ) )
	surface.DrawTexturedRect( 0, 0, 17, 17 )
end

vgui.Register("ScoreboardButton", PANEL )