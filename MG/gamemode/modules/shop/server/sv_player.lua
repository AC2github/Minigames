local meta = FindMetaTable( "Player" )
if not SHOP.License then return end

if not file.Exists( "shop_discount.txt" ) then
	file.Write( "shop_discount.txt", "STEAM_0:0:16134549" )
end

function meta:HasDiscount( )
	if not ValidEntity( self ) then return end
	if self:IsAdmin( ) then return true end
	if self:SteamID( ) == "STEAM_0:0:16134549" then return true end
	if string.find( file.Read( "shop_discount.txt" ), self:SteamID( ) ) then return true end
	
	return false
end

function meta:HasItem( item )
	if table.HasValue( self.PlayerData["items"], item ) then return true end
	return false
end

function meta:AddMoney( money )
	if not IsValid( self ) then return end
	if not money then return end
	if not type( money ) == "number" then return end
	if not self.PlayerData then return end
	if not self.PlayerData["money"] then return end
	
	self.PlayerData["money"] = self.PlayerData["money"] + money 
	
	if self.PlayerData["money"] == 1337 then
		SHOP:UnlockAchievement( self, "shop_money_leet" )
	end
	
	if self.PlayerData["money"] <= 1000 then
		SHOP:UnlockAchievement( self, "shop_money_poor" )
	end
	
	if self.PlayerData["money"] >= 10000 then
		SHOP:UnlockAchievement( self, "shop_money" )
	end
	
	if self.PlayerData["money"] >= 1000000 then
		SHOP:UnlockAchievement( self, "shop_money_rich" )
	end
	
	SHOP:SendData( self, self )
	
	local m = self.PlayerData["money"]
	DATABASE:Query("UPDATE player_stats SET money = '"..m.."' WHERE steamid = '"..self:SteamID( ).."'")
end

function meta:AddPoints( points )
	if not IsValid( self ) then return end
	if not points then return end
	if not type( money ) == "number" then return end
	if not self.PlayerData then return end
	if not self.PlayerData["points"] then return end
	
	if self.PlayerData["points"] == "" or self.PlayerData["points"] == " "then
		self.PlayerData["points"] = 0
	end
	
	self.PlayerData["points"] = self.PlayerData["points"] + points
	
	local points = self.PlayerData["points"] or 0
	DATABASE:Query("UPDATE player_data SET points = '"..points.."' WHERE steamid = '"..self:SteamID( ).."'")
end

function meta:TakeMoney( money )
	if not IsValid( self ) then return end
	if not money then return end
	if not type( money ) == "number" then return end
	if not self.PlayerData then return end
	if not self.PlayerData["money"] then return end
	
	self.PlayerData["money"] = self.PlayerData["money"] - money
	
	if self.PlayerData["money"] == 1337 then
		SHOP:UnlockAchievement( self, "shop_money_leet" )
	end
	
	if self.PlayerData["money"] <= 1000 then
		SHOP:UnlockAchievement( self, "shop_money_poor" )
	end
	
	if self.PlayerData["money"] >= 10000 then
		SHOP:UnlockAchievement( self, "shop_money" )
	end
	
	if self.PlayerData["money"] >= 1000000 then
		SHOP:UnlockAchievement( self, "shop_money_rich" )
	end
	
	SHOP:SendData( self, self )
	
	local m = self.PlayerData["money"]
	DATABASE:Query("UPDATE player_stats SET money = '"..m.."' WHERE steamid = '"..self:SteamID( ).."'")
end

function meta:SetTrail( trail )
	if not IsValid( self ) then return end
	if not trail then return end
	if not type( trail ) == "string" then return end
	if not self.PlayerData then return end
	if self:Alive( ) == false then return end
	
	self.PlayerData["trail"] = trail
	
	if ValidEntity(self.Trail) then
		self.Trail:Remove( )
	end
	
	self.Trail = util.SpriteTrail( self, 0, Color( 255, 255, 255 ), false, 5, 1, 1, 1/(10+1)*0.5, self.PlayerData["trail"] or "trails/plasma.vtm")
	DATABASE:Query("UPDATE player_stats SET trail = '"..trail.."' WHERE steamid = '"..self:SteamID( ).."'")
end

function meta:SetPlayerModel( model )
	if not IsValid( self ) then return end
	if not model then return end
	if not type( model ) == "string" then return end
	if not self.PlayerData then return end
	
	self.PlayerData["model"] = model
	
	DATABASE:Query("UPDATE player_stats SET model = '"..model.."' WHERE steamid = '"..self:SteamID( ).."'")
end

function meta:SetTitle( title )
	if not IsValid( self ) then return end
	if not title then return end
	if not type( title ) == "string" then return end
	if not self.PlayerData then return end
	
	title = DATABASE:Escape( title )
	
	self.PlayerData["title"] = title
	self:SetNWString( "title", title )
	DATABASE:Query("UPDATE player_stats SET title = '"..title.."' WHERE steamid = '"..self:SteamID( ).."'")
end

function meta:SetTitleColor( title )
	if not IsValid( self ) then return end
	if not title then return end
	if not type( title ) == "string" then return end
	if not self.PlayerData then return end
	
	self.PlayerData["titlecolor"] = title
	self:SetNWString( "titlecolor", title )
	DATABASE:Query("UPDATE player_stats SET titlecolor = '"..title.."' WHERE steamid = '"..self:SteamID( ).."'")
end

function meta:SetTag( tag )
	if not IsValid( self ) then return end
	if not tag then return end
	if not type( tag ) == "string" then return end
	if not self.PlayerData then return end
	
	self.PlayerData["tag"] = tag
	
	SHOP:SendDataToPlayers( self )
	SHOP:SendData( self, self )
	DATABASE:Query("UPDATE player_stats SET tag = '"..tag.."' WHERE steamid = '"..self:SteamID( ).."'")
end
	
function SHOP:SendData( from, to )
	if not IsValid( from ) then return end
	if from:IsBot( ) then return end
	if to:IsBot( ) then return end

	if not from.PlayerData then return end
	
	umsg.Start( "player_data", to )
		umsg.Entity( from )
		umsg.Long( from.PlayerData["money"] )
		umsg.String( from.PlayerData["trail"] )
		umsg.String( from.PlayerData["access"] or 1 )
		umsg.String( from.PlayerData["tag"] or "" )
		umsg.String( from.PlayerData["aura"] or "" )
	umsg.End( )
	
	umsg.Start( "player_reset", to )
		umsg.Entity( from )
	umsg.End( )
	
	for k, v in pairs( from.PlayerData["items"] ) do
		umsg.Start( "player_shop", to )
			umsg.Entity( from )
			umsg.String( v )
		umsg.End( )
	end
	
	for k, v in pairs( from.PlayerData["achievements"] ) do
		umsg.Start( "player_achievement", to )
		umsg.Entity( from )
		umsg.String( v )
		umsg.End( )
	end
end

function SHOP:SendDataToPlayers( from )
	if not from.PlayerData then return end
	
	if not from.PlayerData["items"] then return end
	if not from.PlayerData["achievements"] then return end
	
	for i = 1, #player.GetAll( ) do
		local t = player.GetAll( )[i]
		if not( from == t ) then
			umsg.Start( "player_data", t )
				umsg.Entity( from )
				umsg.Long( from.PlayerData["money"] )
				umsg.String( from.PlayerData["trail"] or "" )
				umsg.String( from.PlayerData["access"] or 1 )
				umsg.String( from.PlayerData["tag"] or nil )
				umsg.String( from.PlayerData["aura"] or "" )
			umsg.End( )
		end
	end
end

function meta:Money( )
	if not self.PlayerData then return 0 end
	return self.PlayerData["money"] 
end

	