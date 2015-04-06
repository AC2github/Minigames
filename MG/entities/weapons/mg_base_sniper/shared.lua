
if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false
end

SWEP.Base				= "mg_base"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/v_snip_scout.mdl"
SWEP.WorldModel			= "models/weapons/w_snip_scout.mdl"

SWEP.Weight				= 6
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.HoldType = "ar2"

SWEP.Primary.Sound			= Sound("Weapon_Scout.Single")
SWEP.Primary.Recoil			= 3.0
SWEP.Primary.Damage			= 45
SWEP.Primary.NumShots		= 1
SWEP.Primary.ClipSize		= 6
SWEP.Primary.Delay			= 1.8
SWEP.Primary.DefaultClip	= 18
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "XBowBolt"
SWEP.Primary.ReloadDelay	= 1.5
SWEP.Primary.Cone			= 0.12
SWEP.Primary.ConeMoving		= 0.19
SWEP.Primary.ConeCrouching	= 0.09
SWEP.Primary.OrigCone		= 0.12
SWEP.Primary.OrigConeMoving	= 0.19
SWEP.Primary.OrigConeCrouching	= 0.09
SWEP.Primary.ZoomedCone		= 0.01
SWEP.Primary.ZoomedConeMoving = 0.06
SWEP.Primary.ZoomedConeCrouching = 0

SWEP.WalkSpeed = 185

SWEP.MaxAmmo			    = 40

SWEP.Secondary.Delay = 0.5

SWEP.NextReload = 0

SWEP.ZoomSound = Sound("weapons/sniper/sniper_zoomin.wav")
SWEP.DeZoomSound = Sound("weapons/sniper/sniper_zoomout.wav")
SWEP.ZoomFOV = 35

SWEP.IronSightsPos 			= Vector (4.9906, -9.5434, 2.5078)
SWEP.IronSightsAng 			= Vector (0, 0, 0)

function SWEP:Precache()
	util.PrecacheSound(self.ZoomSound)
	util.PrecacheSound(self.DeZoomSound)
	util.PrecacheSound(self.Primary.Sound)
	util.PrecacheModel(self.ViewModel)
end

function SWEP:Reload()
	self.Weapon:DefaultReload(ACT_VM_RELOAD)
	self:SetZoom(false)
end

function SWEP:SecondaryAttack()
	self.Weapon.NextZoom = self.Weapon.NextZoom or CurTime()
	if CurTime() < self.Weapon.NextZoom then return end
	self.Weapon.NextZoom = CurTime() + self.Secondary.Delay

	local zoomed = !(self.Weapon:GetNetworkedBool("Zoomed", false))
	
	self:SetZoom(zoomed)
end

function SWEP:SetZoom( b )

	if ( self.Weapon:GetNetworkedBool( "Zoomed" ) == b ) then return end
	
	if (b == false) then
		if SERVER then
			self.Owner:SetFOV(75, 0.5)
			self.Weapon:EmitSound(self.DeZoomSound, 50, 100)
			self.Owner:DrawViewModel(true)
		else
			self.FadeAlpha = 255
			self.Scoped = false
			DrawCrHair = true
			surface.PlaySound(self.DeZoomSound)
		end
		self.Primary.Cone			= self.Primary.OrigCone
		self.Primary.ConeMoving		= self.Primary.OrigConeMoving
		self.Primary.ConeCrouching	= self.Primary.OrigConeCrouching
		
		self:SetIronsights(false)
	else
		if SERVER then
			self.Owner:SetFOV(self.ZoomFOV, 0.5)
			self.Weapon:EmitSound(self.ZoomSound, 50, 100)
			timer.Simple(0.45,function()
				if !ValidEntity(self.Owner) or not self.Owner:Alive() then return end
				self.Owner:DrawViewModel(false)
			end)
		else
			timer.Simple(0.5,function()
				if !ValidEntity(self.Owner) or not self.Owner:Alive() then return end
				self.Scoped = true
			end)
			DrawCrHair = false
			surface.PlaySound(self.ZoomSound)
		end
		self.Primary.Cone			= self.Primary.ZoomedCone
		self.Primary.ConeMoving		= self.Primary.ZoomedConeMoving
		self.Primary.ConeCrouching	= self.Primary.ZoomedConeCrouching
		
		self:SetIronsights(true)
	end
	
	self.Weapon:SetNetworkedBool("Zoomed", b)
end

function SWEP:SetIronsights ( bIron )
	if self:GetIronsights() == bIron then return end
	
	local Owner = self.Owner
	if not ValidEntity ( Owner ) then return end
	
	self.IronSight = bIron
	

	if CLIENT then 
		if self:GetIronsights() == true then
			self.PlayerFOV = self.ZoomFOV 
		else 
			self.PlayerFOV = 75 
		end 
		
		Owner:SetFOV ( self.PlayerFOV )
	end
	
end

function SWEP:Holster()
	self:SetZoom(false)
	return true
end

//Override this too
SWEP.PrimaryFire = 0
function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	if not self:CanPrimaryAttack() then return end
	
	//Get owner
	local Owner = self.Owner

	//Ironsight precision
	local iIronsightMul
	if self:GetIronsights() then iIronsightMul = self.IronSightMultiplier else iIronsightMul = 2 end
	
	local WeaponType = 1
	
	//Fire sound
	self:EmitSound ( self.Primary.Sound )
	
	local fRunCone, fCrouchCone, fCone, fDamage, iNumShots = 1.7, 0.8, 1.3, self.Primary.Damage, self.Primary.NumShots
	
	local multiply = 1
	
	if self:GetIronsights() then
		multiply = 0.5
	else
		multiply = 1.1
	end
	
	if self.Owner:GetVelocity():Length() > 25 then
		self:ShootBullet(fDamage, iNumShots, self.Primary.ConeMoving*multiply)
	else
		if self.Owner:Crouching() then
			self:ShootBullet(fDamage, iNumShots, self.Primary.ConeCrouching*multiply)
		else
			self:ShootBullet(fDamage, iNumShots, self.Primary.Cone*multiply)
		end
	end
	
	//Leech ammunition
	self:TakePrimaryAmmo( 1 )
		
end
