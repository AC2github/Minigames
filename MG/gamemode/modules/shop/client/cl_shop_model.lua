local PANEL = {}

AccessorFunc(PANEL, "InfoHeight", "InfoHeight")

local icon = surface.GetTextureID("gui/silkicons/shield")

function PANEL:Init()
	self:SetCamPos(Vector(30, 30, 30))
	self:SetLookAt(Vector(50, 50, 50))
	
	self.Info = ""
	self.InfoHeight = 14
end

function PANEL:SetSkin(id)
	self.Entity:SetSkin(id)
end

function PANEL:SetData(data)
	self.Data = data
	self.Info = data.Name
	self:SetModel(data.Preview)
	
	self.BarCode = Color( 255, 255, 255, 255 )
	
	self.dir = 200
	if math.random(0, 10) > 5 then self.dir = -self.dir end
	
	local PrevMins, PrevMaxs = self.Entity:GetRenderBounds()
    self:SetCamPos(PrevMins:Distance(PrevMaxs) * Vector(0.75, 0.75, 0.5))
    self:SetLookAt((PrevMaxs + PrevMins) / 2)
end

function PANEL:OnCursorEntered()
end

function PANEL:OnCursorExited()
end

function PANEL:Paint()
    local x, y = self:LocalToScreen( 0, 0 )
    local w, h = self:GetSize()
     
    local sl, st, sr, sb = x, y, x + w, y + h
     
    local p = self
    while p:GetParent() do
        p = p:GetParent()
        local pl, pt = p:LocalToScreen( 0, 0 )
        local pr, pb = pl + p:GetWide(), pt + p:GetTall()
        sl = sl < pl and pl or sl
        st = st < pt and pt or st
        sr = sr > pr and pr or sr
        sb = sb > pb and pb or sb
    end
     
	render.SetScissorRect( sl, st, sr, sb, true )
        self.BaseClass.Paint( self )
	render.SetScissorRect( 0, 0, 0, 0, false )
end

vgui.Register("DModel", PANEL, "DModelPanel")