/*---------------------------------------------------------
   Name: Initialize
---------------------------------------------------------*/
function ENT:Initialize()
end

/*---------------------------------------------------------
   Name: DrawPre
---------------------------------------------------------*/
function ENT:DrawTranslucent( ) 
	local ang = LocalPlayer( ):EyeAngles( )
	local pos = self.Entity:GetPos() + Vector( 0, 0, 5 ) + ang:Up()
	
	ang:RotateAroundAxis( ang:Forward(), 90 )
	ang:RotateAroundAxis( ang:Right(), 90 )
	
	--cam.Start3D2D( self.Entity:GetPos( ), self.Entity:GetAngles( ), 0.25 )
		draw.SimpleText( "SPRAY HERE", "HUDNumber", 2, 25, color_white, TEXT_ALIGN_CENTER )
	--camd.End3D2D( )
end