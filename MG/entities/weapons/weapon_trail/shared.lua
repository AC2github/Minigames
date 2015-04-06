if (SERVER) then

	AddCSLuaFile( "shared.lua" )
	SWEP.Weight			= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false
	SWEP.HoldType			= "pistol"

end

if ( CLIENT ) then
	SWEP.PrintName			= "Trail-Gun"	
	SWEP.Author			= "Jo The Shmo"
	SWEP.DrawAmmo 		= false
	SWEP.DrawCrosshair 		= false
	SWEP.ViewModelFOV		= 65
	SWEP.ViewModelFlip		= false
	SWEP.CSMuzzleFlashes		= false
	
	SWEP.Slot				= 1
	SWEP.SlotPos			= 1
	
	SWEP.IconLetter			= "j"

end

SWEP.Instructions 			= "Left click to shoot a trail! Right click to taunt."
SWEP.Purpose				= "Trails!"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.ViewModel 				= "models/weapons/v_pistol.mdl"
SWEP.WorldModel 			= "models/weapons/w_pistol.mdl" 

SWEP.Weight				= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Primary.ClipSize			= -1
SWEP.Primary.Damage			= 0
SWEP.Primary.DefaultClip		= 1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "xbowbolt"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip		= 1
SWEP.Secondary.Damage		=  0
SWEP.Secondary.Automatic		= false
SWEP.Secondary.Ammo			= "xbowbolt"




/*---------------------------------------------------------
SecondaryAttack
---------------------------------------------------------*/

function SWEP:Initialize()
	timer.Simple(.1, function()
		if self.Weapon!= nil then
			self.Weapon:SendWeaponAnim( ACT_VM_HOLSTER )
		end
	end)
end

function SWEP:PrimaryAttack()
	
	if self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0 then return end
	if self.Owner:Team( ) == 1 then return end

	self.Weapon:EmitSound("weapons/iceaxe/iceaxe_swing1.wav")
	self.Weapon:SetNextPrimaryFire(CurTime() + 2)
	if timer.IsTimer("holstertimer"..self.Owner:Nick()) then
		timer.Destroy("holstertimer"..self.Owner:Nick())
	end
	self.Weapon:SendWeaponAnim( ACT_VM_RECOIL3 )
	timer.Create("holstertimer"..self.Owner:Nick(),5, 1, function()
		if self.Weapon!=nil and self.Owner:GetActiveWeapon() == self.Weapon then
			self.Weapon:SendWeaponAnim( ACT_VM_HOLSTER )
		end
	end)
	self.Owner:RemoveAmmo(1 ,self.Primary.Ammo)

	if SERVER then
		local knife = ents.Create("ent_trails")
		knife:SetAngles(self.Owner:EyeAngles())

		if (self:GetIronsights() == false) then
			local v = self.Owner:GetShootPos()
				v = v + self.Owner:GetForward() * 5
				v = v + self.Owner:GetRight() * 9
				v = v + self.Owner:GetUp() * -5
			knife:SetPos( v )
		else
			knife:SetPos (self.Owner:EyePos() + (self.Owner:GetAimVector()))
		end

		knife:SetOwner(self.Owner)
		knife:SetPhysicsAttacker(self.Owner)
		knife:Spawn()
		knife:Activate()
		
		self.Owner:SetAnimation( PLAYER_ATTACK1 )

		local phys = knife:GetPhysicsObject()
		phys:SetVelocity(self.Owner:GetAimVector() * 1500)
		phys:AddAngleVelocity(Vector(0, 500, 0))
	end
end

function SWEP:SecondaryAttack()

	if self.Owner:GetAmmoCount(self.Secondary.Ammo) <= 0 then return end
	if self.Owner:Team( ) == 1 then return end

	if timer.IsTimer("holstertimer"..self.Owner:Nick()) then
		timer.Destroy("holstertimer"..self.Owner:Nick())
	end
	self.Weapon:SendWeaponAnim( ACT_VM_IDLE_LOWERED )
	timer.Create("holstertimer"..self.Owner:Nick(),2, 1, function()
		if self.Weapon!=nil and self.Owner:GetActiveWeapon() == self.Weapon then
			self.Weapon:SendWeaponAnim( ACT_VM_HOLSTER )
		end
	end)
	
	
	WorldSound( self.Owner:Taunt( ), self.Owner:GetPos(), 100, 100 )
	self.Weapon:SetNextSecondaryFire(CurTime() + 15)
	self.Owner:RemoveAmmo(1 ,self.Secondary.Ammo)
	
	if SERVER and self.Owner:Taunt( ) != "" then
		local knife2 = ents.Create("ent_taunt")
		local pos = self.Owner:GetPos()
		knife2:SetPos( Vector(pos.x, pos.y, pos.z + 100 ) )
		knife2:SetOwner(self.Owner)
		knife2:Spawn()
		knife2:Activate()
	end
	
end

/*---------------------------------------------------------
Reload
---------------------------------------------------------*/
function SWEP:Reload()

	return false
end

/*---------------------------------------------------------
OnRemove
---------------------------------------------------------*/
function SWEP:OnRemove()

return true
end

/*---------------------------------------------------------
Holster
---------------------------------------------------------*/
function SWEP:Holster()

	return true
end

/*---------------------------------------------------------
ShootEffects
---------------------------------------------------------*/
function SWEP:ShootEffects()

end

local IRONSIGHT_TIME = 0.15

/*---------------------------------------------------------
GetViewModelPosition
---------------------------------------------------------*/
function SWEP:GetViewModelPosition(pos, ang)
	if (not self.IronSightsPos) then return pos, ang end

	local bIron = self.Weapon:GetNWBool("Ironsights")

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


/*---------------------------------------------------------
SetIronsights
---------------------------------------------------------*/
function SWEP:SetIronsights(b)

	self.Weapon:SetNetworkedBool("Ironsights", b)
end

function SWEP:GetIronsights()

	return self.Weapon:GetNWBool("Ironsights")
end

SWEP.NextSecondaryAttack = 0

/*---------------------------------------------------------
DrawWeaponSelection
---------------------------------------------------------*/
function SWEP:DrawWeaponSelection(x, y, wide, tall, alpha)



	draw.SimpleText(self.IconLetter, "CSSelectIcons", x + wide / 2, y + tall * 0.2, Color(255, 210, 0, 255), TEXT_ALIGN_CENTER)
	-- Draw a CS:S select icon

	self:PrintWeaponInfo(x + wide + 20, y + tall * 0.95, alpha)
	-- Print weapon information
end