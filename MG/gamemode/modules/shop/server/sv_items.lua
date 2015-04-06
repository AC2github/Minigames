if not SHOP.License then return end

function SHOP:BuyItem( pl, item )
	if not item then return end
	if not pl.PlayerData then return end
	
	local item = SHOP:GetItem( item )
	
	if not item then return end
	
	local cost = item.Cost
	
	if pl:IsPlatinum( ) then
		cost = math.Round( cost / 2 )
	elseif pl:IsPremium( ) then
		cost = cost - math.Round( cost / 4 )
	else
		cost = item.Cost
	end
	
	if item.item == nil then
		pl:ChatPrint( "Invalid item." )
		return 
	end
	
	if pl:HasItem( item.item ) then 
		pl:ChatPrint( "You already have that item." )
		return 
	end
	
	if tonumber(pl:Money( )) <  tonumber(cost) then
		pl:ChatPrint( "You can't afford that" )
		return
	end
	
	if (item.DonatorOnly == true) and not pl:Platinum( ) then
		pl:ChatPrint( "You are not a platinum member." )
		return 
	end
	
	pl:TakeMoney( cost )
	table.insert( pl.PlayerData["items"], item.item )
	SHOP:SendData( pl, pl )
	
	local items = glon.encode( pl.PlayerData["items"] )
	DATABASE:Query( "UPDATE player_shop SET items = '"..items.."' WHERE steamid = '"..pl:SteamID( ).."'")
	
	PrintAll( "ADMIN", "Player <color=yellow>"..pl:Name( ).."</color> has bought the item <color=yellow>"..item.Name.."</color>." )
end

function SHOP:EquipItem( pl, item )
	if not item then return end
	if not pl.PlayerData then return end
	
	local item = SHOP:GetItem( item )
	
	if item == nil then 
		pl:ChatPrint( "Invalid item." )
		return
	end
	
	if item.item == nil then
		pl:ChatPrint( "Invalid item." )
		return 
	end
	
	if not pl:HasItem( item.item ) then 
		pl:ChatPrint( "You don't have that item." )
		return 
	end
	
	if item.Type == "HAT" then
		if pl:IsSpec( ) then return end
		SHOP:SpawnHat( pl, item.Preview )
	elseif item.Type == "MODEL" then
		pl:SetPlayerModel( item.Preview )
	elseif item.Type == "TRAIL" then
		if pl:IsSpec( ) then return end
		pl:SetTrail( item.Preview )
	elseif item.Type == "WEAPON" then
		if pl:IsSpec( ) then return end
		pl:Give( item.Weapon )
	elseif item.Type == "TITLE" then
		pl:SetTitle( item.Preview )
	elseif item.Type == "AURA"  then
		SHOP:SpawnAura( pl, item.Preview )
	elseif item.Type == "TAG" then
		pl:SetTag( item.Preview )
	end
	
	pl:ChatPrint( "Your item has changed." )
end

concommand.Add( "shop_trade", function( pl, cmd, args )
	if not args[1] or not args[2] then return end
	pl:ChatPrint( "Trade has been disabled for now" )
end)
	
concommand.Add( "shop_buy", function( pl, cmd, args )
	if not args[1] then return end
	SHOP:BuyItem( pl, args[1] )
	SHOP:EquipItem( pl, args[1] )
end)

concommand.Add( "shop_equip", function( pl, cmd, args )
	if not args[1] then return end
	SHOP:EquipItem( pl, args[1] )
end)

concommand.Add( "shop_sell", function( pl, cmd, args )
	if not args[1] then return end
	pl:ChatPrint( "Sell has been disabled for now" )
end)

hook.Add( "ShowSpare2", "ShopShow", function( pl )
	pl:SendLua( "MakeShop( )" )
end)

hook.Add( "ShowSpare1", "AchievementsShow", function( pl )
	pl:SendLua( "MakeAchievements( )" )
end)