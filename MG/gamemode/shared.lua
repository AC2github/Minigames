
GM.Name 	= "Mini-Games"
GM.Author 	= "AC"
GM.Email 	= "N/A"
GM.Website 	= "N/A"

function GM:Initialize()
	self.BaseClass.Initialize( self )
	GAMEMODE.TeamBased = true
end

function GM:CreateTeams()
	TEAM_SPEC = 1
	team.SetUp( TEAM_SPEC, "Dead", Color( 75, 75, 75, 255 ) )

	TEAM_BLUE = 2
	team.SetUp( TEAM_BLUE, "Blue", Color( 0, 0, 200, 255 ) )
	team.SetSpawnPoint( TEAM_BLUE, "info_player_counterterrorist", "info_player_start" )

	TEAM_RED = 3
	team.SetUp( TEAM_RED, "Red", Color( 200, 0, 0, 255 ) )
	team.SetSpawnPoint( TEAM_RED, "info_player_terrorist" )
end







