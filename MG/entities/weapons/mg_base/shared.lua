
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false
end

if CLIENT then
	SWEP.DrawAmmo			= true
	SWEP.DrawCrosshair		= false
	SWEP.ViewModelFOV		= 75
	SWEP.ViewModelFlip		= true
	SWEP.CSMuzzleFlashes	= true

	SWEP.SelectFont = "CSSelectIcons"
	SWEP.IconLetter = "p"
	
	surface.CreateFont("csd", ScreenScale(30), 500, true, true, "CSKillIcons")
	surface.CreateFont("csd", ScreenScale(60), 500, true, true, "CSSelectIcons")
end

SWEP.Author			= "AC2"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Primary.Sound			= Sound("Weapon_AK47.Single")
SWEP.Primary.Recoil			= 3
SWEP.Primary.Damage			= 40
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.005
SWEP.Primary.ConeMoving		= 0.01
SWEP.Primary.ConeCrouching	= 0.002
SWEP.Primary.Delay			= 0.8

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "CombineCannon"

SWEP.Tracer 				= "AR2Tracer"

SWEP.IronSightMultiplier    = 0.5

SWEP.IronSightsPos = Vector(0,0,0)
SWEP.IronSightsAng = Vector(0,0,0)

SWEP.MuzzleAttachment		= "1" -- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment	= "2" -- Should be "2" for CSS models or "1" for hl2 models
SWEP.MuzzleEffect			= "none" -- This is an extra muzzleflash effect
-- Available muzzle effects: rg_muzzle_grenade, rg_muzzle_highcal, rg_muzzle_hmg, rg_muzzle_pistol, rg_muzzle_rifle, rg_muzzle_silenced, none
SWEP.ShellEffect			= "none" -- This is a shell ejection effect
-- Available shell eject effects: rg_shelleject, rg_shelleject_rifle, rg_shelleject_shotgun, none
SWEP.EjectDelay 			= 0.01

function SWEP:Deploy()
	DrawCrHair = true

	self.Weapon:SendWeaponAnim(ACT_VM_DRAW) 
	if SERVER then
		self.Owner:DrawWorldModel(true)
		self.Owner:DrawViewModel(true)
	end
	
	self:SetIronsights(false)
	return true
end

function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)
	self.dt.ironsights = false
end

function SWEP:SetupDataTables()
	self:DTVar( "Bool", 0, "ironsights" )
end

function SWEP:Reload()
	self:SetIronsights(false)
	
	if SERVER and self.Owner:GetFOV() ~= 75 then
		self.Owner:SetFOV(75,.3)
	end
	
	self.Weapon:DefaultReload(ACT_VM_RELOAD)
end

function SWEP:Think()	
end

function SWEP:Holster()
	self:SetIronsights(false)
	return true
end

function SWEP:PrimaryAttack()
	self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	if not self:CanPrimaryAttack() then return end

	self.Weapon:EmitSound(self.Primary.Sound)
	
	self:TakePrimaryAmmo(1)
	self:FireBullet()

	self.Owner:ViewPunch(Angle(math.Rand(-0.2,-0.1) * self.Primary.Recoil, math.Rand(-0.1,0.1) *self.Primary.Recoil, 0))

	if CLIENT then
		self.Weapon:SetNetworkedFloat("LastShootTime", CurTime())
	end
end

function SWEP:FireBullet()

	local multiply = 1
	
	if (self.dt.ironsights) then
		multiply = self.IronSightMultiplier
	else
		multiply = 1
	end
	
	if self.Owner:GetVelocity():Length() > 30 then
		self:ShootBullet(self.Primary.Damage, self.Primary.NumShots, self.Primary.ConeMoving*multiply)
	else
		if self.Owner:Crouching() then
			self:ShootBullet(self.Primary.Damage, self.Primary.NumShots, self.Primary.ConeCrouching*multiply)
		else
			self:ShootBullet(self.Primary.Damage, self.Primary.NumShots, self.Primary.Cone*multiply)
		end
	end
	
end

function SWEP:SecondaryAttack()
end

function SWEP:ShootBullet(dmg, numbul, cone)
	local bullet = {}
	bullet.Num = numbul
	bullet.Src = self.Owner:GetShootPos()
	bullet.Dir = self.Owner:GetAimVector()
	bullet.Spread = Vector(cone, cone, 0)
	bullet.Tracer = 1
	bullet.Force = dmg * 0.5
	bullet.Damage = dmg
	bullet.TracerName = self.Tracer

	self.Owner:FireBullets(bullet)
	self:ShootEffects()
end

function SWEP:ShootEffects()

	local PlayerPos = self.Owner:GetShootPos()
	local PlayerAim = self.Owner:GetAimVector()

	self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK) 		-- View model animation
	self.Owner:MuzzleFlash()								-- Crappy muzzle light
	self.Owner:SetAnimation(PLAYER_ATTACK1)					-- 3rd Person Animation
end

function SWEP:TakePrimaryAmmo( num )
 
	if ( self.Weapon:Clip1() <= 0 ) then
		if ( self:Ammo1() <= 0 ) then return end
		self.Owner:RemoveAmmo( num, self.Weapon:GetPrimaryAmmoType() )
	return end

	self.Weapon:SetClip1( self.Weapon:Clip1() - num )
 
end 

if CLIENT then
	function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )
		draw.SimpleText( self.IconLetter, self.SelectFont, x + wide/2, y + tall*0.3, Color( 255, 210, 0, 255 ), TEXT_ALIGN_CENTER )
		// Draw weapon info box
		self:PrintWeaponInfo( x + wide + 20, y + tall * 0.95, alpha )
	end

	function SWEP:PrintWeaponInfo( x, y, alpha )

		if ( self.DrawWeaponInfoBox == false ) then return end
		if ( self.Instructions == "" ) then return end
		
		if (self.InfoMarkup == nil ) then
			local str
			local title_color = "<color=230,230,230,255>"
			local text_color = "<color=150,150,150,255>"
			
			str = "<font=HudSelectionText>"
			str = str .. title_color .. "Instructions:</color>\n"..text_color..self.Instructions.."</color>\n"
			str = str .. "</font>"
			
			self.InfoMarkup = markup.Parse( str, 250 )
		end
		
		surface.SetDrawColor( 60, 60, 60, alpha )
		surface.SetTexture( self.SpeechBubbleLid )
		
		surface.DrawTexturedRect( x, y - 64 - 5, 128, 64 ) 
		draw.RoundedBox( 8, x - 5, y - 6, 260, self.InfoMarkup:GetHeight() + 18, Color( 60, 60, 60, alpha ) )
		
		self.InfoMarkup:Draw( x+5, y+5, nil, nil, alpha )
		
	end
end

function SWEP:CanPrimaryAttack()
	if self.Weapon:Clip1() <= 0 then
		self.Weapon:EmitSound("Weapon_Pistol.Empty")
		self.Weapon:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
		return false
	end
	return true
end

function SWEP:DrawHUD( )
	surface.SetDrawColor( 255, 255, 255, 255 )
	
	surface.DrawLine( (ScrW( ) / 2) - 25, ScrH( ) / 2, (ScrW( ) / 2) - 15, ScrH( ) / 2 )
	surface.DrawLine( (ScrW( ) / 2) + 15, ScrH( ) / 2, (ScrW( ) / 2) + 25, ScrH( ) / 2 )
	
	surface.DrawLine( ScrW( ) / 2 , (ScrH( ) / 2) - 25, ScrW( ) / 2, (ScrH( ) / 2) - 15 )
	surface.DrawLine( ScrW( ) / 2 , (ScrH( ) / 2) + 15, ScrW( ) / 2, (ScrH( ) / 2) + 25 )
end


local IRONSIGHT_TIME = 0.25

function SWEP:GetViewModelPosition(pos, ang)

	if (not self.IronSightsPos) then return pos, ang end

	local bIron = self.dt.ironsights

	if (bIron != self.bLastIron) then
		self.bLastIron = bIron
		self.fIronTime = CurTime()

		if (bIron) then
			self.SwayScale 	= 0.3
			self.BobScale 	= 0.1
		else
			self.SwayScale 	= 1.0
			self.BobScale 	= 1.0
		end
	end

	local fIronTime = self.fIronTime or 0

	if (not bIron and fIronTime < CurTime() - IRONSIGHT_TIME) then
		return pos, ang
	end

	local Mul = 1.0

	if (fIronTime > CurTime() - IRONSIGHT_TIME) then
		Mul = math.Clamp((CurTime() - fIronTime) / IRONSIGHT_TIME, 0, 1)

		if not bIron then Mul = 1 - Mul end
	end

	local Offset	= self.IronSightsPos

	if (self.IronSightsAng) then
		ang = ang * 1
		ang:RotateAroundAxis(ang:Right(), 		self.IronSightsAng.x * Mul)
		ang:RotateAroundAxis(ang:Up(), 		self.IronSightsAng.y * Mul)
		ang:RotateAroundAxis(ang:Forward(), 	self.IronSightsAng.z * Mul)
	end

	local Right 	= ang:Right()
	local Up 		= ang:Up()
	local Forward 	= ang:Forward()

	pos = pos + Offset.x * Right * Mul
	pos = pos + Offset.y * Forward * Mul
	pos = pos + Offset.z * Up * Mul

	return pos, ang
end

function SWEP:SetIronsights( b )
	self.dt.ironsights = b
end

function SWEP:GetIronsights()
	return self.dt.ironsights
end

function SWEP:OnRestore()
	self.NextSecondaryAttack = 0
	self:SetIronsights( false )
end
