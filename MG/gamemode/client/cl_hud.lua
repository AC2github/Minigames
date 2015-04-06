
local HUD_RED = surface.GetTextureID( "freeskill/hud/hud_red" )
local HUD_RED_AMMO = surface.GetTextureID( "freeskill/hud/hud_red_ammo" )

local HUD_BLUE = surface.GetTextureID( "freeskill/hud/hud_blue" )
local HUD_BLUE_AMMO = surface.GetTextureID( "freeskill/hud/hud_blue_ammo" )

local HUD_COINS = surface.GetTextureID( "freeskill/hud/coins" )

local alpha = 255

local adverts = {
	"Press F1 for help.",
	"Press F3 to view your achievements.",
	"Press F4 to open the shop.",
	"Type rtv to start a mapvote.",
	"Type rtd to roll the dice.",
	"Type !donate if you wish to donate.",
	"Type !rules to view the rules.",
	"Type !help if you need help.",
	"Press left click to switch between players when spectating.",
	"Press right click to enter free spectator when spectating.",
	"Press the Q button to toggle thirdperson.",
	"Join our steamcommunity group: http://steamcommunity.com/groups/freeskill-gaming",
	"Type nominate to nominate a map.",
}

local text = "Welcome to Minigames"

timer.Create( "adverttimer", 35, 0, function( )
	text = table.Random( adverts )
end)

function GM:HUDWeaponPickedUp( )
end

function GM:HUDAmmoPickedUp( )
end

usermessage.Hook( "thirdperson", function( um )
	THIRDPERSON = um:ReadBool( ) or false 
end)
 
local view = {}
THIRDPERSON = false

hook.Add( "CalcView", "ThirdPersonView", function( ply, origin, angles, fov )
    if THIRDPERSON == false then return end
	if ply:Team( ) == TEAM_SPEC then return end
 
    view.origin = origin - (angles:Forward() * 100)
    view.angles = angles
    view.fov = fov
 
    return view
end )
 
hook.Add( "ShouldDrawLocalPlayer", "DrawPlayer", function()
    return THIRDPERSON
end )

// Code from sass :O
function SetPlayerColor(ply, alpha)
	local r, g, b, a = ply:GetColor()
	ply:SetColor(r, g, b, alpha)
	
	if ply:GetActiveWeapon( ):IsValid( ) then
		local weapon = ply:GetActiveWeapon( )
		weapon:SetColor( r, g, b, alpha )
	end
	
	for k, v in pairs( ents.GetAll( ) ) do
		if ValidEntity( v) then
			if v:GetClass( ) == "sent_hat" then
				if not (v:GetOwner( ) == pl ) then
					v:SetColor( 255, 255, 255, alpha )
				end
			end
		end
	end
	
	for k, v in pairs( ents.GetAll( ) ) do
		if ValidEntity( v ) then
			if v:GetClass( ) == "sent_aura" then
				if not (v:GetOwner( ) == pl ) then
					v:SetColor( 255, 255, 255, alpha )
				end
			end
		end
	end
end

local Changed = false
local HideDistance = 256

function GM:DistanceCloaking()

	if(LocalPlayer():Team( ) == TEAM_SPEC) then
		if (Changed) then
			Changed = false
			for k,v in pairs(player.GetAll()) do
				if (v.AlphaChanged) then
					v.AlphaChanged = false
					SetPlayerColor(v, 255)
				end
			end
		end
		return
	end
	
	Changed = true
	
	local Pos = LocalPlayer():GetPos()
	for k,v in pairs(player.GetAll()) do
		if ( v != LocalPlayer() ) then
			local Distance = Pos:Distance(v:GetPos())
			if (Distance < HideDistance) and ( LocalPlayer( ):Team( ) == v:Team( ) ) then
				v.AlphaChanged = true
				SetPlayerColor(v, ((Distance <= 32) and 0) or math.Clamp(((255 / HideDistance) * Distance) - 32, 0, 255))
			elseif(v.AlphaChanged) then
				v.AlphaChanged = false
				SetPlayerColor(v, 255)
			end
		end
	end
end

function GM:HUDPaint( )

	GAMEMODE:DistanceCloaking()

	if PREROUND then
		draw.SimpleText( "WAITING FOR PLAYERS TO SPAWN", "HUDNumber", ScrW( ) / 2, ScrH( ) - 200, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		
		if not (math.Round(PREROUND_TIME - (CurTime( ))) <= 0) then
			draw.SimpleText( "( "..math.Round(PREROUND_TIME - (CurTime( ))).." ) ", "HUDNumber", ScrW( ) / 2, ScrH( ) - 150, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
		end
	end
	
	local coins_pos = ScrH( ) - 185
	
	if (LocalPlayer( ):Team( ) == TEAM_BLUE) or (LocalPlayer( ):Team( ) == TEAM_RED) then
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetTexture( HUD_COINS )
		surface.DrawTexturedRect( 5, ScrH( ) - 185, 250, 200 )
		coins_pos = ScrH( ) - 145
	end
	
	if LocalPlayer( ):Team( ) == TEAM_SPEC then
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetTexture( HUD_COINS )
		surface.DrawTexturedRect( 5, ScrH( ) - 100, 250, 200 )
		coins_pos = ScrH( ) - 57
	end
	
	if LocalPlayer( ).PlayerData then
		draw.SimpleText( LocalPlayer( ).PlayerData["money"] or "0", "colleged_small", 215, coins_pos, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_RIGHT )
	end
	
	surface.SetFont( "ChatFont" )
	
	if not (LocalPlayer( ):GetObserverTarget() == nil) and (LocalPlayer( ):Team( ) == TEAM_SPEC) and (LocalPlayer( ):GetObserverTarget():IsPlayer()) then
		local w, h = surface.GetTextSize( tostring( "Spectating "..LocalPlayer( ):GetObserverTarget( ):Name( ) ) or "" )
		draw.RoundedBox( 6, (ScrW( ) / 2) - (w / 2) - 10, ScrH( ) - 100, w + 20, 30, Color( 0, 0, 0, 180 ) )
		draw.SimpleText( "Spectating "..LocalPlayer( ):GetObserverTarget( ):Name( ), "ChatFont", ScrW( ) / 2, ScrH( ) - 85, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
		
	local w, h = surface.GetTextSize( text )
	
	draw.RoundedBox( 6, (ScrW( ) / 2) - (w / 2) - 10, ScrH( ) - 65, w + 20, 30, Color( 0, 0, 0, 180 ) )
	draw.SimpleText( text, "ChatFont", ScrW( ) / 2, ScrH( ) - 50, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	
	if LocalPlayer( ):Team( ) == TEAM_SPEC then return end

	surface.SetDrawColor( 255, 255, 255, 255 )
	
	if LocalPlayer( ):Team( ) == TEAM_RED then
		surface.SetTexture( HUD_RED )
	else
		surface.SetTexture( HUD_BLUE )
	end
	
	surface.DrawTexturedRect( 5, ScrH( ) - 185, 250, 200 )
	
	--draw.RoundedBox( 6, 25, ScrH( ) - 55, 210, 30, Color( 0, 0, 0, 200 ) )
	--draw.RoundedBox( 0, 30, ScrH( ) - 50, 200, 20, Color( 0, 0, 0, 200 ) ) 
	--draw.RoundedBox( 0, 30, ScrH( ) - 50, math.min( LocalPlayer( ):Health( ) / 100, 1 ) * 200, 20, team.GetColor( LocalPlayer( ):Team( ) ) )
	draw.SimpleText( LocalPlayer( ):Health( ), "colleged_big", 225, ScrH( ) - 45, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
	
	if LocalPlayer( ).PlayerData then
		--draw.RoundedBox( 6,  25, ScrH( ) - 85, 210, 20, Color( 0, 0, 0, 200 ) )
		--draw.SimpleText( (LocalPlayer( ).PlayerData["money"] or 1000), "colleged_small", 225, ScrH( ) - 125, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
	end
	
	local clip_left = 0
	local clip_left_pos = 210
	local clip_reserve = 0
	local clip_left_max = 0
	local clip_reserve_pos = 50
	local swep_pos_x = 225
	local swep_pos_y = 90
	
	if (LocalPlayer( ):GetActiveWeapon():IsValid()) then
		clip_left = LocalPlayer( ):GetActiveWeapon():Clip1() or 0
		clip_reserve = LocalPlayer( ):GetAmmoCount(LocalPlayer( ):GetActiveWeapon():GetPrimaryAmmoType()) or 0
	end
	
	if clip_left ~= -1 and not( LocalPlayer( ):GetActiveWeapon():IsValid( ) == false ) then
	--	draw.RoundedBox( 6, ScrW( ) - 230, ScrH( ) - 55, 210, 30, Color( 0, 0, 0, 200 ) )
		--draw.RoundedBox( 0, ScrW( ) - 225, ScrH( ) - 50, 200, 20, Color( 0, 0, 0, 200 ) ) 
		
		clip_left_max = LocalPlayer( ):GetActiveWeapon( ).Primary.ClipSize or 0
		
		if clip_left_max and LocalPlayer( ):GetActiveWeapon( ).Primary then
	--		draw.RoundedBox( 0, ScrW( ) - 225, ScrH( ) - 50, math.min( clip_left / clip_left_max ,1) * 200, 20, team.GetColor( LocalPlayer( ):Team( ) ) )
		end
		
		if clip_left >= 10 then
		--	clip_left_pos = 200
		end
		
		if clip_reserve <= 9 then
			clip_reserve_pos = 60
		elseif clip_reserve >= 100 then
			clip_reserve_pos = 50
		else
			clip_reserve_pos = 40
		end
	
		surface.SetDrawColor( 255, 255, 255, 255 )
		
		if LocalPlayer( ):Team( ) == TEAM_RED then
			surface.SetTexture( HUD_RED_AMMO )
		else
			surface.SetTexture( HUD_BLUE_AMMO )
		end
		surface.DrawTexturedRect( ScrW( ) - 255, ScrH( ) - 185, 250, 200 )
		
		draw.SimpleText( clip_left, "colleged_big", ScrW( ) - clip_left_pos - 10, ScrH( ) - 45, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER )
		draw.SimpleText( clip_reserve, "colleged_small", ScrW( ) - clip_reserve_pos - 35, ScrH( ) - 45, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER )
		--draw.SimpleText( LocalPlayer( ):GetActiveWeapon( ).IconLetter, "CSKillIcons", ScrW( ) - swep_pos_x, ScrH( ) - swep_pos_y, Color(255, 80, 0, 255 ) )
	end
end

--timer.Create( "Colors", 5, 0, function( )
	--local col = team.GetColor( LocalPlayer( ):Team( ) )

function GM:PostPlayerDraw( )
	for k, v in pairs( player.GetAll( ) ) do
		if not ( v:Team( ) == TEAM_SPEC ) and not (LocalPlayer( ) == v) then
			if v:GetPos( ):Distance( LocalPlayer( ):GetPos( ) ) <= 1024 then			
				local offset = Vector( 0, 0, 85 )
				local ang = LocalPlayer():EyeAngles()
				local pos = v:GetPos() + offset + ang:Up()
 
				ang:RotateAroundAxis( ang:Forward(), 90 )
				ang:RotateAroundAxis( ang:Right(), 90 )
 
				cam.Start3D2D( pos, Angle( 0, ang.y, 90 ), 0.25 )
					draw.DrawText( v:GetName(), "HUDNumber", 2, 25, team.GetColor( v:Team( ) ), TEXT_ALIGN_CENTER )
					draw.DrawText( v:GetNWString( "title" ) or "", "Trebuchet24", 2, 0, TitleColors[v:GetNWString( "titlecolor" )], TEXT_ALIGN_CENTER )
				cam.End3D2D()
			end
		end
	end
end

local hide = { 
	"CHudHealth",
	"CHudBattery",
	"CHudAmmo",
	"CHudSecondaryAmmo"
}

function GM:HUDShouldDraw( name )
	if table.HasValue( hide, name ) then return false end
	return true
end