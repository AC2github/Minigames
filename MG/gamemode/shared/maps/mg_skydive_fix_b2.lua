
local MAP = {}

MAP.Key = 14
MAP.Map = "mg_skydive_fix_b2"
MAP.Name = "SkyDive"
MAP.Desc = "Very fun map."
MAP.TeamBased = false
MAP.RoundBased = false
MAP.Red = { "" }
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

MAP.OnMapRestart = function( )
	game.ConsoleCommand( "sv_airaccelerate 10" )
	
	for k, v in pairs( player.GetAll( ) ) do
		if ValidEntity( v.Trail ) then
			v.Trail:Remove( )
		end
	end
	
	for k, v in pairs(ents.FindByClass("func_door")) do
		timer.Simple(3, function()
			v:Remove()
		end)
	end
end

RegisterMap( MAP )