
concommand.Add("mg_give", function( pl, cmd, args )
	if !IsValid( pl ) or args[1] == nil then return end
	local money = tonumber(args[2])
	
	if not money then return end
	if not type(money) == "number" then pl:ChatPrint("Invalid amount!") return end
	if tonumber(money) > tonumber(pl:Money( )) then pl:ChatPrint("You don't have that much money!") return end
	if tonumber(money) < 0 then pl:ChatPrint("Invalid amount!") return end
	
	local Target = FindPlayerByID( tonumber( args[1] ) )
	if not Target then pl:ChatPrint("Player was not found.") return end
	if Target:UserID( ) == pl:UserID( ) then return end
	   
	Target:AddMoney( money )
	Target:ChatPrint(pl:Name( ).." gave you "..money.." coins.")
	pl:TakeMoney( money )
	pl:ChatPrint( "You gave "..Target:Name( )..", "..money.." coins.")
end)

concommand.Add("mg_pm", function( pl, cmd, args )
	if !IsValid( pl ) or args[1] == nil then return end
	local pm = table.concat( args , " ", 2 )
	
	local Target = FindPlayerByID( tonumber( args[1] ) )
	if not Target then pl:ChatPrint("Player was not found.") return end
	if Target:UserID( ) == pl:UserID( ) then pl:ChatPrint("Why would you send a pm to yourself?") return end
	Target:ChatPrint("(" ..pl:Name( ).. " - You): "..pm )
	pl:ChatPrint( "You - "..Target:Name( )..": "..pm )
	
	if ADMIN_READ_PM == true then
		for k, admins in pairs( player.GetAll( ) ) do
			if admins:IsAdmin( ) then
				admins:ChatPrint( pl:Name( ).." - "..Target:Name( )..": "..pm )
			end
		end
	end
end)

concommand.Add("mg_pm_admin", function( pl, cmd, args )
	if !IsValid( pl ) or args[1] == nil then return end
	local pm = table.concat( args , "", 1 )

	for k, v in pairs( player.GetAll( ) ) do
		if v:IsAdmin( ) and v:IsValid( ) then
			v:ChatPrint(pl:Name( ).. " - ADMINS: "..pm )
		end
	end
end)

concommand.Add("mg_admin_print_center", function( pl, cmd, args )
	if not IsValid( pl ) or args[1] == nil then return end
	if not pl:IsAdmin( ) then return end
	for k, v in pairs( player.GetAll( ) ) do
		v:PrintMessage( HUD_PRINTCENTER, table.concat( args, " ", 1 ) )
	end
end)

chatcommand.Add("@", function( pl, cmd, args )
	if not IsValid( pl ) or args[1] == nil then return end
	if pl:IsAdmin( ) then return end
	for k, v in pairs( player.GetAll( ) ) do
		v:PrintMessage( HUD_PRINTCENTER, table.concat( args, " ", 1 ) )
	end
end)

chatcommand.Add( "!thirdperson", function( pl, cmd, args )
	umsg.Start( "thirdperson", pl )
		umsg.Bool( true )
	umsg.End( )
end)

chatcommand.Add( "!firstperson", function( pl, cmd, args )
	umsg.Start( "thirdperson", pl )
		umsg.Bool( false )
	umsg.End( )
end)