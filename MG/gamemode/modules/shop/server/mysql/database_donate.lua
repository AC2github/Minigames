
function DATABASE:GetDonatorInfo( pl )
	if not IsValid( pl ) then return end
	
	DATABASE:Query( "SELECT * FROM player_donate WHERE steamid = '"..pl:SteamID( ).."'", function( result )
		if result and result[1] then
			if result[1][3] == "NULL" then
				pl:ChatPrint( "We found a record of your donation, but it is invalid.", "gui/silkicons/page" )
			else
				pl:ChatPrint( "Thank you for donating <color=red>"..pl:Name( ).."</color>.", "gui/silkicons/heart" )
				DATABASE:Query( "DELETE FROM player_donate WHERE steamid = '"..pl:SteamID( ).."'" )
		
				if tonumber(result[1][3]) == PREMIUM_REQUIRED then
					DATABASE:Query( "UPDATE player_access SET access = '2' WHERE steamid = '"..pl:SteamID( ).."'" )
					
					DATABASE:Query( "SELECT * FROM player_cards WHERE steamid = '"..pl:SteamID( ).."'", function( result )
						if result and result[1] then
							DATABASE:Query( "UPDATE player_cards SET cards = '"..(result[1][2] + TITLE_CARDS_PREMIUM).."' WHERE steamid = '"..pl:SteamID( ).."'" )
						else
							DATABASE:Query( "INSERT INTO player_cards ( steamid, cards ) VALUES( '"..pl:SteamID( ).."', '"..TITLE_CARDS_PREMIUM.."' )" )
						end
					end)
					
					pl:ChatPrint( "You have donated for <color=red>premium</color> membership." )
					pl:AddMoney( 5000 )
					return
				elseif tonumber(result[1][3]) == PLATINUM_REQUIRED then
					DATABASE:Query( "UPDATE player_access SET access = '3' WHERE steamid = '"..pl:SteamID( ).."'" )
					
					DATABASE:Query( "SELECT * FROM player_cards WHERE steamid = '"..pl:SteamID( ).."'", function( result )
						if result and result[1] then
							DATABASE:Query( "UPDATE player_cards SET cards = '"..(result[1][2] + TITLE_CARDS_PREMIUM).."' WHERE steamid = '"..pl:SteamID( ).."'" )
						else
							DATABASE:Query( "INSERT INTO player_cards ( steamid, cards ) VALUES( '"..pl:SteamID( ).."', '"..TITLE_CARDS_PREMIUM.."' )" )
						end
					end)
					
					pl:ChatPrint( "You have donated for <color=red>platinum</color> membership." )
					pl:AddMoney( 12000 )
					return
				else
					pl:AddMoney( math.Round( tonumber(result[1][3]) * COINS_PER_DONATION ) )
					pl:ChatPrint( "You have donated for <color=red>coins</color>." )
				end
			end
		end
	end)
end