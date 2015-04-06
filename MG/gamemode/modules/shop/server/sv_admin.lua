if not SHOP.License then return end

function SHOP:FindPlayer( id )
	if not id then return end
	
	for k, v in pairs( player.GetAll( ) ) do
		if v:UserID( ) == tonumber( id ) then
			return v
		end
	end
	
	return nil
end

local function AdminGive( pl, cmd, args )
	if not pl:IsSuperAdmin( ) then return end
	if not args[1] then return end
	
	local target = SHOP:FindPlayer( tonumber( args[1] ) )
	if target == nil then return end
	
	target:AddMoney( tonumber( args[2] ) or 0 )
end
concommand.Add( "shop_give", AdminGive )

local function AdminTake( pl, cmd, args )
	if not pl:IsSuperAdmin( ) then return end
	if not args[1] then return end
	
	local target = SHOP:FindPlayer( tonumber( args[1] ) )
	if target == nil then return end
	
	target:TakeMoney( tonumber( args[2] ) or 0 )
end
concommand.Add( "shop_take", AdminTake )

local function AdminTitle( pl, cmd, args )
	if not args[1] then return end
	if not pl:HasDiscount( ) then return end
	
	local target = pl
	if target == nil then return end
	
	target:SetTitle( tostring( args[1] ) or "" )
end
concommand.Add( "shop_title", AdminTitle )

local function AdminTitleColor( pl, cmd, args )
	if not args[1] then return end
	if not pl:HasDiscount( ) then return end
	
	local target = pl
	if target == nil then return end
	
	target:SetTitleColor( tostring( args[1] ) or "" )
end
concommand.Add( "shop_title_color", AdminTitleColor )
	