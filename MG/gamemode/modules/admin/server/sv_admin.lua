function FindPlayersByName( name )
	if not name then return end
	local results = {}
	
	local target = FindPlayerByID( tonumber( name ) )
	
	if target then
		table.insert( results, target )
	end
	
	for k, v in pairs( player.GetAll( ) ) do
		if IsValid( v ) then
			if string.find( string.lower( v:Name( ) ), string.lower( name ) ) then
				table.insert( results, v )
			end
		end
	end
	
	if #results == 0 then return end
	return results 
end

function FindPlayerByName( name )
	if not name then return end
	local results = {}
	local result = nil
	
	local target = FindPlayerByID( tonumber( name ) )
	
	if target then
		table.insert( results, target )
	end
	
	for k, v in pairs( player.GetAll( ) ) do
		if IsValid( v ) then
			if string.find( string.lower( v:Name( ) ), string.lower( name ) ) then
				table.insert( results, v )
			end
		end
	end
	
	if #results < 0 then return nil end
	if #results > 1 then return nil end
	if results[1] == nil then return nil end
	
	result = results[1]
	return result or nil
end

function FindPlayerByID( id )
	if not id then return end
	
	for k, v in pairs( player.GetAll() ) do
		if v:UserID( ) == tonumber(id) then
			return v 
		end
	end
	return nil
end

function FindPlayer( input )
	if not input then return nil end
	local player = nil
	
	local target = FindPlayerByName( tostring( input ) )
	
	if target then
		player = target
	end
	
	local target = FindPlayerByID( tonumber( input ) )
	
	if target then
		player = target
	end
	
	return player
end
				
function PlayerList( tbl )
	local firstword = ""
	local lastword = "<color=white>and</color>"
	
	if not type( tbl ) == "table" then
		firstword = tbl:Name( )
		return firstword
	end
	
	if #tbl == 1 then
		firstword = tbl[1]:Name( ) or "Someone"
	elseif #tbl == player.GetAll( )  then
		firstword = "everyone"
	else
		for i = 1, #tbl do
			if ( i == #tbl ) then firstword = firstword .. " " .. lastword .. " " .. tbl[i]:Nick() elseif ( i == 1 ) then firstword = tbl[i]:Nick() else firstword = firstword .. ", " .. tbl[i]:Nick() end
		end
	end
	
	if firstword == nil then return end
	return firstword
end