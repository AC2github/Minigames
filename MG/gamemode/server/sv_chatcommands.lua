if not SERVER then return end

local table = table
local string = string
local hook = hook

module "chatcommand"

-- Settings
Blocking		= false
PrefixPrivate	= "/"
PrefixPublic	= "!"

local _commands = {}

function Add( name, func )
	_commands[name:lower()] = func
end

function Remove( name )
	_commands[name:lower()] = nil
end

function Run( player, command, arguments )
	if not command then return false end
	local func = _commands[command:lower()]
	
	if not func then
		if player:IsValid() and Blocking == true then
			player:ChatPrint( "Unknown command: '" .. command .. "'\n" )
		end
		return false
	end
	func( player, command, arguments )

	return true
end

local function ParseChat( player, text, team )
	local txt = text
	txt = txt:sub( 1 )

	local cmd = txt:match( "^(%S+)" )
	txt = txt:gsub( "^(%S+)", "",10 )

	local quote = txt:sub( 1, 1 ) ~= '"'
	local ret = {}
	for chunk in txt:gmatch( '[^"]+' ) do
		quote = not quote
		if quote then
			table.insert( ret, chunk )
		else
			for chunk in chunk:gmatch( "%S+" ) do
				table.insert( ret, chunk )
			end
		end
	end
	
	Run( player, cmd, ret )
	
	return (text) 
end
hook.Add( "PlayerSay", "ChatCommand.ParseChat", ParseChat )