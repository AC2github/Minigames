
print( "Devasion by AC2 loaded." )

function DEVASION:Setup( )
	sql.Query( "CREATE TABLE IF NOT EXISTS devasion_groups ( id, name, plugins )" )
end

DEVASION:Setup( )

function DEVASION:NewGroup( id, name, plugins )
	if not id then return end
	if not name then return end
	if not plugins then return end
	
	local id = sql.Query( "SELECT * FROM devasion_groups WHERE id = '"..id.."'" )
	local name = sql.Query( "SELECT * FROM devasion_groups WHERE name = '"..name.."'" )
	
	if id then
		DEVASION:Print( "There's already a group with that name!" )
		return
	end
	
	if name then
		DEVASION:Print( "There's already a group with that name!" )
		return
	end

	sql.Query( "INSERT INTO devasion_groups ( '"..id.."', '"..name.."', '"..glon.encode(plugins).."' )" )
	DEVASION:Print( "Created group "..name.."!" )
end
	

