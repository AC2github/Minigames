DEBUG = {}

function DEBUG.Msg( str )
	if not str then return end
	MsgN("[DEBUG]: ".. str )
end

function DEBUG.Log( str )
	if not str then return end
	
	if not file.Exists( "MG/debug.txt" ) then
		file.Write( "MG/debug.txt", "" )
	end
	
	file.Write( "MG/debug.txt", file.Read("MG/debug.txt")..os.date( ).." - "..str.."\n" )
	DEBUG.Msg( os.date( ).." Writing to MG/debug!")
end

function GM:WriteLog( pl, log )
	if not log then return end
	
	if not file.Exists( "MG/logs.txt" ) then
		file.Write( "MG/logs.txt", "" )
	end
	
	file.Write( "MG/logs.txt", file.Read("MG/logs.txt")..os.date( ).." Player: "..pl:Name( )..": "..log.."\n" )
end

function GM:WriteToLog( l, text )
	if not l then return end
	if not text then return end
	
	if not file.Exists( "MG/"..l..".txt" ) then
		file.Write( "MG/"..l..".txt", "" )
	end
	
	file.Write( "MG/"..l..".txt", file.Read("MG/" ..l..".txt" )..os.date( ).." "..text.."\n" )
end

function DEBUG.AdminMessage( )
	for k, v in pairs( player.GetAll( ) ) do
		if v:IsValid( ) and v:IsAdmin( ) then
			DEBUG.Msg("Server made an error; report this to your developer.")
		end
	end
end
