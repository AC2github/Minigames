
local banned = {
	"admin",
	"owner", 
	"moderator",
	"penis",
	"vagina", 
	"massi-gear",
	"asshole",
	"dick",
	"nigger",
}
	
function SHOP:GetTitleCards( pl )
	if not pl.PlayerData then return end
	
	DATABASE:Query( "SELECT * FROM player_cards WHERE steamid = '"..pl:SteamID( ).."'", function( result )
		if result and result[1] then
			pl.PlayerData["titlecards"] = result[1][2]
		end
	end)
end

function SHOP:SetPlayerTitle( by, player, title )
	if not player then return end
	if not title then return end
	
	local target = FindPlayerByID( player )
	if not target then return end
	
	if IsValid( target ) then
		target:SetTitle( tostring( title ) or "NO FUCKING TITLE WAS GIVEN" )
	end
	
	if not (by == player) then
		PrintAll( "ADMIN", "Player <color=red>"..target:Name( ).."</color> title was changed by <color=red>"..by:Name( ).."</color>.", "gui/silkicons/wrench" )
	end
end

function SHOP.UseTitleCard( pl, cmd, args )
	if not pl then return end
	if not args[1] then return end
	if not args[2] then return end
	
	if not (pl.PlayerData["titlecards"]) then return end
	
	if pl.PlayerData["titlecards"] == 0 then
		pl:ChatPrint( "You don't have any titlecards!" )
		return
	end

	local title = table.concat( args, " ", 2 )
	
	if string.len( title ) >= 20 then
		pl:ChatPrint( "This title is too long", "gui/silkicons/check_off" )
		return
	end
	
	for k, v in pairs( banned ) do
		if string.find( string.lower( title ), string.lower( v ) ) then
			pl:ChatPrint( "This title is inappropriate.", "gui/silkicons/check_off" )
			return
		end
	end

	pl.PlayerData["titlecards"] = pl.PlayerData["titlecards"] - 1
	DATABASE:Query("UPDATE player_cards SET cards = '"..(pl.PlayerData["titlecards"] - 1).."' WHERE steamid = '"..pl:SteamID( ).."'")
	
	SHOP:SetPlayerTitle( pl, args[1], args[2] )
end
concommand.Add( "shop_usecard", SHOP.UseTitleCard )
