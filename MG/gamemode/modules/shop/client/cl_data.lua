
hook.Add( "Think", "ClientIsValid", function( )
	if LocalPlayer( ):IsValid( ) then
		RunConsoleCommand( "shop_clientready" )
		LocalPlayer( ).PlayerData = {}
		LocalPlayer( ).PlayerData["items"] = {}
		LocalPlayer( ).PlayerData["achievements"] = {}
		LocalPlayer( ).Ranks = {}
		LocalPlayer( ).Ranks["money"] = {}
		LocalPlayer( ).Ranks["points"] = {}
		hook.Remove( "Think", "ClientIsValid" )
	end
end)

usermessage.Hook( "player_data", function( um )	
	local pl = um:ReadEntity( )
	
	pl.PlayerData = {}

	pl.PlayerData["money"] = um:ReadLong( )
	pl.PlayerData["trail"] = um:ReadString( )
	pl.PlayerData["access"] = um:ReadString( )
	pl.PlayerData["tag"] = um:ReadString( ) or nil
	pl.PlayerData["aura"] = um:ReadString( )
	
	if pl.PlayerData["tag"] == "" or pl.PlayerData["tag"] == " " then
		pl.PlayerData["tag"] = nil
	end
end)

usermessage.Hook( "player_shop", function( um )
	local pl = um:ReadEntity( )
	
	if not pl.PlayerData["items"] then
		pl.PlayerData["items"] = {}
	end
	
	table.insert( pl.PlayerData["items"], um:ReadString( ) )
end)

usermessage.Hook( "player_achievement", function( um ) 
	local pl = um:ReadEntity( )
	
	if not pl.PlayerData["achievements"] then
		pl.PlayerData["achievements"] = {}
	end
	
	table.insert( pl.PlayerData["achievements"], um:ReadString( ) )
end)

usermessage.Hook( "player_reset", function( um )
	local pl = um:ReadEntity( )
	
	pl.PlayerData["items"] = {}
	pl.PlayerData["achievements"] = {}
end)

usermessage.Hook( "player_ranks_money", function( um )
	table.insert( LocalPlayer( ).Ranks["money"], glon.decode(um:ReadString( )) )
end)

usermessage.Hook( "player_ranks_points", function( um )
	table.insert( LocalPlayer( ).Ranks["points"], glon.decode(um:ReadString( )) )
end)