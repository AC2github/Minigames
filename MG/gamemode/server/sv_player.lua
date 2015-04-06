local meta = FindMetaTable( "Player" )
if not meta then return end

local Player = meta
meta.oldkick = meta.Kick

function meta:Kick( reason )
	self:oldkick( reason or "Kicked by Admin" )
	GAMEMODE:CheckGame( )
end

meta.oldban = meta.Ban
function meta:Ban( reason, time, who )
	reason = reason or "No reason was given"
	time = time or 0
	who = who or "CONSOLE"
	
	local name = DATABASE:Escape( self:Name( ) )
	
	DATABASE:Query( "INSERT INTO player_bans ( name, steamid, time, reason, admin ) VALUES( '"..name.."', '"..self:SteamID( ).."', '"..time.."', '"..reason.."', '"..who.."' )" ) 
	GAMEMODE:WriteToLog( "bans", tostring( self:SteamID( ) ))
	
	DATABASE:GetBans( )
	self:oldban( reason, 1 )
end

function GM:UnBan( steamid )
	DATABASE:Query( "DELETE FROM player_bans WHERE steamid = '"..steamid.."'", function( result )
		if result then
			GAMEMODE:WriteToLog( "Admin", "CONSOLE unbanned steamid <"..steamid..">.")
			DATABASE:GetBans( )
		end
	end)
end

function meta:Slay( )
	self:Kill( )
end

function meta:Slap( )
	self:TakeDamage( 10 )
	self:SetVelocity( Vector( math.random( 0, 100 ), math.random( 0, 100 ), math.random( 0, 100 ) ) )
	self:EmitSound( "physics/body/body_medium_impact_hard"..math.random( 1, 6 )..".wav" )
end
	
function meta:ChatPrint( str, tag )
	umsg.Start( "chatbox_print", self )
		umsg.String( str )
		umsg.String( tag or "gui/silkicons/world" )
	umsg.End( )
end

function meta:IsSpec( )
	if self:Team( ) == TEAM_SPEC then
		return true
	end
	
	return false
end

function meta:IsPremium( )
	if not self.PlayerData then return false end
	
	if self.PlayerData["access"] >= "2" then
		return true
	end
	
	return false
end

function meta:IsPlatinum( )
	if not self.PlayerData then return false end
	if not self.PlayerData["access"] then return false end
	
	if self.PlayerData["access"] >= "3" then
		return true
	end
	
	return false
end

function meta:IsModerator( )
	if not self.PlayerData then return false end
	if not self.PlayerData["access"] then return false end
	
	if self.PlayerData["access"] >= "4" then
		return true
	end
	
	if self:IsAdmin( ) then
		return true
	end
	
	return false
end

meta.OldIsAdmin = meta.IsAdmin
function meta:IsAdmin( )
	if not self.PlayerData then return meta.OldIsAdmin end 
	if not self.PlayerData["access"] then return false end
	
	if self.PlayerData["access"] >= "5" then
		return true
	end
	
	if self:IsSuperAdmin( ) then
		return true
	end
	
	return false
end

meta.OldIsSuperAdmin = meta.IsSuperAdmin
function meta:IsSuperAdmin( )
	if not self.PlayerData then return meta.OldIsSuperAdmin end 
	if not self.PlayerData["access"] then return false end
	
	if self.PlayerData["access"] >= "6" then
		return true
	end
	
	if self:IsOwner( ) then
		return true
	end
	
	return false
end

function meta:IsOwner( )
	if not self.PlayerData then return end
	if not self.PlayerData["access"] then return false end
	
	if self.PlayerData["access"] >= "7" then
		return true
	end
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

function meta:EyeTraceLine( distance )
	local start = self:EyePos()
	local trace = {}
	trace.start = start
	trace.endpos = start + self:GetAimVector() * distance
	trace.filter = self
	return util.TraceLine(trace)
end