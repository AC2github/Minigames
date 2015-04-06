if SERVER then
	AddCSLuaFile("shared.lua")
	SWEP.HoldType = "ar2"
end

if CLIENT then
	SWEP.PrintName = "AWP"
	SWEP.Slot = 4
	SWEP.SlotPos = 4
	SWEP.ViewModelFOV = 70
	SWEP.ViewModelFlip = true
	
	SWEP.IconLetter = "r"
	killicon.AddFont("weapon_mg_awp", "CSKillIcons", SWEP.IconLetter, Color(255, 80, 0, 255 ))
end

SWEP.Base				= "mg_base_sniper"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/weapons/v_snip_awp.mdl"
SWEP.WorldModel			= "models/weapons/w_snip_awp.mdl"

SWEP.Weight				= 6
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("Weapon_AWP.Single")
SWEP.Primary.Recoil			= 20
SWEP.Primary.Damage			= 75
SWEP.Primary.NumShots		= 1
SWEP.Primary.ClipSize		= 4
SWEP.Primary.Delay			= 1.8
SWEP.Primary.DefaultClip	= 15
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "XBowBolt"
SWEP.Primary.ReloadDelay	= 2
SWEP.Primary.Cone			= 0.12
SWEP.Primary.ConeMoving		= 0.18
SWEP.Primary.ConeCrouching	= 0.09
SWEP.Primary.OrigCone		= 0.12
SWEP.Primary.OrigConeMoving	= 0.18
SWEP.Primary.OrigConeCrouching	= 0.09
SWEP.Primary.ZoomedCone		= 0.012
SWEP.Primary.ZoomedConeMoving = 0.07
SWEP.Primary.ZoomedConeCrouching = 0.002

SWEP.IronSightsPos 			= Vector (5.6111, -3, 2.092)
SWEP.IronSightsAng 			= Vector (0, 0, 0)
SWEP.ZoomFOV = 45

SWEP.MaxAmmo			    = 40
