
function SHOP:GetAchievement( achv )
	if not achv then return end
	
	for k, v in pairs( achievementsData ) do
		if tostring(achv) == achievementsData[k].achv then
			return v
		end
	end
	
	return nil
end

function SHOP:UnlockAchievement( pl, ach )
	if not ach then return end
	if not pl.PlayerData then return end
	if not pl.PlayerData["achievements"] then return end
	
	if #player.GetAll( ) < 5 then return end
	
	local achievement = SHOP:GetAchievement( ach )
	if not achievement then return end
	
	if achievement == nil then return end
	if achievement.achv == nil then return end
	
	if table.HasValue( pl.PlayerData["achievements"], achievement.achv ) then
		return
	end
	
	table.insert( pl.PlayerData["achievements"], achievement.achv )
	
	--if achievement.Show then
	PrintAll( "ADMIN",  "Player <color=yellow>"..pl:Name( ).."</color> earned the achievement <color=yellow>"..achievement.Name.."</color>." )
	--end
	
	pl:AddMoney( tonumber(achievement.Reward) )
	
	SHOP:SendData( pl, pl )

	local achievements = glon.encode( pl.PlayerData["achievements"] ) 
	DATABASE:Query( "UPDATE player_achievements SET achievements = '"..achievements.."' WHERE steamid = '"..pl:SteamID( ).."'")

	pl:SendLua("SHOP:UnlockEffect(\"" .. achievement.Name .. "\")" )
end

chatcommand.Add( "PewDiePie", function( pl )
	SHOP:UnlockAchievement( pl, "sentence" )
end)