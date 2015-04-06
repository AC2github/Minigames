if not SHOP.License then return end

print( "Shop by AC2 loaded." )

function SHOP:SavePlayer( pl )
	DATABASE:SavePlayer( pl )
end

function SHOP:LoadPlayer( pl )
	DATABASE:LoadPlayer( pl )
end

concommand.Add( "shop_clientready", function( pl, cmd, args )
	pl.ClientReady = true
	
	if (pl.ClientReady == true) then
		SHOP:LoadPlayer( pl )
		
		DATABASE:GetTopPoints( pl )
		DATABASE:GetTopMoney( pl )
		
		GAMEMODE:SendMaps( pl )

		pl.ClientReady = false
	end
end)