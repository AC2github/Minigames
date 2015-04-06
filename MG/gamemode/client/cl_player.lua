local meta = FindMetaTable( "Player" )
if not meta then return end

function meta:ChatPrint( str )
	Chatbox.AddChatLine( LocalPlayer( ), "<font=ChatFont>"..str.."</font>", "gui/silkicons/world", nil )
end

function meta:TraceLine( distance, direction )
	local dir
	if direction then
		dir = direction:GetNormal()
	else
		dir = self:GetAimVector()
	end
	local start = self:GetShootPos()
	local trace = {}
	trace.start = start
	trace.endpos = start + dir * distance
	trace.filter = self
	return util.TraceLine(trace)
end

function meta:IsPremium(  )
	if not self.PlayerData then return false end
	if not self.PlayerData["access"] then return false end
	if self.PlayerData["access"] >= "2" then return true end
	return false
end

function meta:IsPlatinum( )
	if not self.PlayerData then return false end
	if not self.PlayerData["access"] then return false end
	if self.PlayerData["access"] >= "3" then return true end
	return false
end

function meta:IsModerator( )
	if not self.PlayerData then return false end
	if not self.PlayerData["access"] then return false end
	if self.PlayerData["access"] >= "4" then return true end
	return false
end

function meta:IsAdmin( )
	if not self.PlayerData then return false end
	if not self.PlayerData["access"] then return false end
	if self.PlayerData["access"] >= "5" then return true end
	return false
end

function meta:IsSuperAdmin( )
	if not self.PlayerData then return false end
	if not self.PlayerData["access"] then return false end
	if self.PlayerData["access"] >= "6" then return true end
	return false
end

function meta:IsOwner( )
	if not self.PlayerData then return false end
	if not self.PlayerData["access"] then return false end
	if self.PlayerData["access"] >= "7" then return true end
	return false
end