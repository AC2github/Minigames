
function SHOP:CanCraft( pl, your_items, tocraft )
	local items = your_items
	
	local item = SHOP:GetCraftingItem( tocraft )
	
	if item == nil then return end
	if item.result == nil then return end
	
	local myitems = items 
	local craftitem = { item }
	
	if table.HasValues( myitems, craftitem[1].ingredients ) then
		return true
	end

	return false
end

function SHOP:GetItemFromTable( tbl )
	for k, v in pairs( craftData ) do
		for i, j in pairs( tbl ) do
			if table.HasValues( craftData[k].ingredients, tbl ) then
				return v
			end
		end
	end
	return nil
end

function SHOP.Craft( pl, handler, id, encoded, decode  )
	local tocraft = SHOP:GetItemFromTable( decode[1] )
	
	if tocraft == nil then
		return 
	end
	
	if SHOP:CanCraft( pl, decode[1], tocraft.result ) == false then
		return 
	end
	
	if not tocraft then return end
	
	local toremove = nil
	
	local item = SHOP:GetItem( tocraft.result ).item
	if table.HasValue( pl.PlayerData["items"], item ) then
		return 
	end	
	
	--for i = 1, #tocraft.ingredients do
	--	local p = SHOP:GetItem(tocraft.ingredients[i]).item 
		
	--	for k,v in pairs( pl.PlayerData["items"] ) do
	--		if pl.PlayerData["items"][k] == p then
	--			pl.PlayerData["items"][k] = nil
	--		end
	--	end
	--end
	
	--table.insert( pl.PlayerData["items"], item )
	--SHOP:SavePlayer( pl )
	--SHOP:SendData( pl, pl )
	
	--local itemcrafted = SHOP:GetItem( tocraft.result ).Name
	--DEVASION:Notify( color_white, "Player ", Color( 255, 200, 0 ), pl:Name( ), color_white, " has crafted item ", Color( 255, 200, 0 ), tostring(itemcrafted) or "Something special", color_white, "." )
	
	pl:ChatPrint( "Crafting is disabled." )
end
datastream.Hook( "Shop_Craft", SHOP.Craft)
