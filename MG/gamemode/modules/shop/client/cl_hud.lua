
local Cache = {}
local Time = 0
local Alpha = 255
local starttime

function SHOP:UnlockEffect( str )
	if not str then return end
	
	table.insert( Cache, str )
end

hook.Add( "HUDPaint", "SHOP:Achievements", function( )
	if not starttime then starttime = CurTime( ) end
	
	local Cal = (CurTime() - starttime) / 7
	
	for k, v in pairs( Cache ) do
		if v[1] then
			draw.SimpleText( "ACHIEVEMENT UNLOCKED!", "HUDNumber", ScrW( ) / 2, ScrH( ) / 2 - 300, Color( 255, 255, 255, (255 - Cal * 255) ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
			draw.SimpleTextOutlined( Cache[1], "Trebuchet24", ScrW( ) / 2, ScrH( ) / 2 - 265, Color( 255, 255, 255, (255 - Cal * 255) ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color( 0, 0, 0, (255 - Cal * 255) ) )
		end
	end
	
	if Time + 7 <  CurTime() then
		table.remove( Cache, 1 )
		Time = CurTime( )
		starttime = CurTime( )
	end
end)

usermessage.Hook( "achv_effect", function( um )
	table.insert( Cache, um:ReadString( ) )
	surface.PlaySound( "weapons/physcannon/energy_disintegrate5.wav" )
end)
	