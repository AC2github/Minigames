
function DATABASE:LoadPlayer( pl )
	if not IsValid( pl ) then return end
	local name = DATABASE:Escape( pl:Name( ) )
	
	DATABASE:Query( "SELECT * FROM player_data WHERE steamid = '"..pl:SteamID( ).."'", function( result )
		timer.Simple( 1, function( )
			if result == nil or result[1] == nil then
				DATABASE:NewPlayer( pl )
				return
			end
		end)
	end)
	
	timer.Simple( 3, function( )
		if not IsValid( pl ) then return end
		pl.PlayerData = {}
	
		DATABASE:Query( "SELECT * FROM player_data WHERE steamid = '"..pl:SteamID( ).."'", function( result )
			timer.Simple( 1, function( )
				if result and result[1] then
					pl.PlayerData["name"] = result[1][1]
					pl.PlayerData["steamid"] = result[1][2]
					pl.PlayerData["ip"] = result[1][3]
					pl.PlayerData["time"] = result[1][4]
					pl.PlayerData["points"] = result[1][5] or 0
				end
			end)
		end)
		
		DATABASE:Query( "SELECT * FROM player_stats WHERE steamid = '"..pl:SteamID( ).."'", function( result )
			timer.Simple( 1, function( )
				if result and result[1] then
					pl.PlayerData["money"] = result[1][3]
					pl.PlayerData["tokens"] = result[1][4]
					pl.PlayerData["model"] = result[1][5]
					pl.PlayerData["trail"] = result[1][6]
					pl.PlayerData["hat"] = result[1][7]
					pl.PlayerData["title"] = result[1][8]
					pl.PlayerData["titlecolor"] = result[1][9]
					pl.PlayerData["aura"] = result[1][10]
					pl.PlayerData["tag"] = result[1][11]
				
					if pl.PlayerData["title"] == "NULL" then
						pl:SetNWString( "title", "" )
					else
						pl:SetNWString( "title", pl.PlayerData["title"] )
					end

					pl:SetNWString( "titlecolor", pl.PlayerData["titlecolor"] )
				end
			end)
		end)
		
		DATABASE:Query( "SELECT * FROM player_shop WHERE steamid = '"..pl:SteamID( ).."'", function( result )
			timer.Simple( 1, function( )
				if result and result[1] then
					pl.PlayerData["items"] = glon.decode( result[1][2] ) or {}
				end
			end)
		end)
		
		DATABASE:Query( "SELECT * FROM player_achievements WHERE steamid = '"..pl:SteamID( ).."'", function( result )
			timer.Simple( 1, function( )
				if result and result[1] then
					pl.PlayerData["achievements"] = glon.decode( result[1][2] ) or {}
				end
			end)
		end)
		
		DATABASE:Query( "SELECT * FROM player_access WHERE steamid = '"..pl:SteamID( ).."'", function( result )
		timer.Simple( 1, function( )
				if result and result[1] then
					pl.PlayerData["access"] = result[1][3]
				else
					DATABASE:Query( "INSERT INTO player_access ( name, steamid, access ) VALUES( '"..name.."', '"..pl:SteamID().."', '1')")
				end
			end)
		end)
		
		timer.Simple( 3, function( )
			if pl.PlayerData then
				DATABASE:GetDonatorInfo( pl )
				SHOP:GetTitleCards( pl )
				
				if pl:IsDonator( ) then
					pl:SetNWBool( "discount", true )
					pl:ChatPrint( "Welcome back, <color=red>donator</color>", "gui/silkicons/emoticon_smile" )
				end
				
				SHOP:UnlockAchievement( pl, "hello_achv" )
				
				if (AC_IS_HERE == true) then
					SHOP:UnlockAchievement( pl, "ac_achv" )
				end
				
				SHOP:SendData( pl, pl )
				SHOP:SendDataToPlayers( pl )
			end
		end)
		
	end)
end

function DATABASE:NewPlayer( pl )
	if not IsValid( pl ) then return end
	local name = DATABASE:Escape( pl:Name( ) )
	
	DATABASE:Query( "INSERT INTO player_data ( name, steamid, ip, time, points ) VALUES ( '"..name.."', '"..pl:SteamID( ).."', '"..pl:IPAddress( ).."', '0', '0')")
	DATABASE:Query( "INSERT INTO player_shop ( steamid ) VALUES( '"..pl:SteamID( ).."')")
	DATABASE:Query( "INSERT INTO player_stats ( name, steamid, money, tokens, model ) VALUES ('" ..name.. "', '" ..pl:SteamID().. "', '1', '0', 'models/player/Group01/male_01.mdl' )")
	DATABASE:Query( "INSERT INTO player_achievements ( steamid ) VALUES( '"..pl:SteamID( ).."' )")
	DATABASE:Query( "INSERT INTO player_access ( name, steamid, access ) VALUES( '"..name.."', '"..pl:SteamID().."', '1')")
	
	GAMEMODE:WriteToLog( "accounts", "New account for "..pl:Name( ) )
	
	timer.Simple( 5, function( )
		if not IsValid( pl ) then return end
		DATABASE:LoadPlayer( pl )
	end)
end

function DATABASE:SavePlayer( pl )
	if not IsValid( pl ) then return end
	
	local name = DATABASE:Escape( pl:Name( ) )
	local connected_time = (pl.PlayerData["time"] + math.Round(pl:TimeConnected())) or 0
	local ip = pl:IPAddress( ) or "loopback"
	local access = pl.PlayerData["access"] or 1
	
	local money = pl.PlayerData["money"] or 0
	local trail = pl.PlayerData["trail"] or ""
	local hat = pl.PlayerData["hat"] or ""
	local title = DATABASE:Escape( pl.PlayerData["title"] ) or ""
	local model = pl.PlayerData["model"] or "models/player/Group01/male_01.mdl"
	local titlecolor = pl.PlayerData["titlecolor"] or "NULL"
	local tokens = pl.PlayerData["tokens"] or 0
	local points = pl.PlayerData["points"] or 0
	
	DATABASE:Query("UPDATE player_data SET name = '"..name.."' WHERE steamid = '"..pl:SteamID( ).."'")
	DATABASE:Query("UPDATE player_data SET time = '"..connected_time.."' WHERE steamid = '"..pl:SteamID( ).."'")
	DATABASE:Query("UPDATE player_data SET ip = '"..ip.."' WHERE steamid = '"..pl:SteamID( ).."'")
	DATABASE:Query("UPDATE player_data SET access = '"..access.."' WHERE steamid = '"..pl:SteamID().."'")
	DATABASE:Query("UPDATE player_stats SET money = '"..money.."' WHERE steamid = '"..pl:SteamID( ).."'")
	DATABASE:Query("UPDATE player_stats SET tokens = '"..tokens.."' WHERE steamid = '"..pl:SteamID( ).."'")
	DATABASE:Query("UPDATE player_stats SET trail = '"..trail.."' WHERE steamid = '"..pl:SteamID( ).."'")
	DATABASE:Query("UPDATE player_stats SET hat = '"..hat.."' WHERE steamid = '"..pl:SteamID( ).."'")
	DATABASE:Query("UPDATE player_stats SET title = '"..title.."' WHERE steamid = '"..pl:SteamID( ).."'")
	DATABASE:Query("UPDATE player_stats SET titlecolor = '"..titlecolor.."' WHERE steamid = '"..pl:SteamID( ).."'")
	DATABASE:Query("UPDATE player_stats SET model = '"..model.."' WHERE steamid = '"..pl:SteamID( ).."'")
	DATABASE:Query("UPDATE player_data SET points = '"..points.."' WHERE steamid = '"..pl:SteamID( ).."'")
	
	local items = glon.encode( pl.PlayerData["items"] )
	local achievements = glon.encode( pl.PlayerData["achievements"] ) 
	
	DATABASE:Query( "UPDATE player_shop SET items = '"..items.."' WHERE steamid = '"..pl:SteamID( ).."'")
	DATABASE:Query( "UPDATE player_achievements SET achievements = '"..achievements.."' WHERE steamid = '"..pl:SteamID( ).."'")
end
