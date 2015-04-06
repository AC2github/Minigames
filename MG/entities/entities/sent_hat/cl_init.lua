include("shared.lua")

local TModels = {
	"models/player/arctic.mdl",
	"models/player/leet.mdl",
	"models/player/guerilla.mdl",
	"models/player/phoenix.mdl"
}

local CTModels = {
	"models/player/gasmask.mdl",
	"models/player/riot.mdl",
	"models/player/swat.mdl",
	"models/player/urban.mdl"
}

function ENT:Initialize()
	self:DrawShadow(false)
	self:SetRenderBounds(Vector(-40, -40, -18), Vector(40, 40, 90))
end

function ENT:GetHat( )
	self.Hat = nil
	for k, v in pairs( HatPos )  do
		if (string.lower(self.Entity:GetModel( )) == string.lower(HatPos[k].Model)) then
			self.Hat = v.Model
		end
	end
	return self.Hat
end

function ENT:DrawTranslucent()
	local owner = self.Entity:GetOwner( )
	MySelf = LocalPlayer( )
	
	self.AddX = 0
	self.AddY = 0
	
	local Model = self.Entity:GetHat( )
	if not Model then return end

	if MySelf and owner == MySelf then
		MySelf.Hat = self.Entity
	end
	
	if not owner:Alive( ) then return end
	if (owner == MySelf) and (THIRDPERSON == false) then return end
	
	self.RelPos = HatPos[Model].Pos
	self.RelAng = HatPos[Model].Ang
	
	if not self.RelPos then
		self.RelPos = Vector( 0, 0, 0 )
	end
	
	if not self.RelAng then
		self.RelAng = Vector( 0, 0, 0 )
	end
	
	if table.HasValue( TModels, string.lower(owner:GetModel( )) ) then
		self.AddX = 3.2
		if owner:GetModel() == "models/player/leet.mdl" then
			self.AddX = 2.5
			self.AddY = 1.5
		end
	end
	
	if self.Scale == nil then
		if HatPos[Model].ScaleVector then
			self.Scale = HatPos[Model].ScaleVector
		end
	end
	
	local boneindex
    local Bone = "ValveBiped.Bip01_Head1"        
    boneindex = owner:LookupBone( Bone )
	
	if boneindex then
		local pos, ang = owner:GetBonePosition(boneindex)
		if pos and pos ~= owner:GetPos() then
			self:SetPos(pos + (ang:Forward() * (self.RelPos.x + self.AddX) + (ang:Right() * (self.RelPos.y + self.AddY)) + (ang:Up() * self.RelPos.z)))
			ang:RotateAroundAxis(ang:Forward(), self.RelAng.p)
			ang:RotateAroundAxis(ang:Up(), self.RelAng.y)
			ang:RotateAroundAxis(ang:Right(), self.RelAng.r)
			self:SetAngles(ang)
			
			self:DrawModel()
			
			if HatPos[Model].ScaleVector then
				self:SetModelScale ( self.Scale )
			end
		end
	end

end

function ENT:Draw()
	self:DrawTranslucent()
end


