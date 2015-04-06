
function CreateAdverts( )
	adverts = {}
	adverts = { 
	"Press F1 for help.",
	"Press F3 to view your achievements.",
	"Press F4 to open the shop.",
	"Type rtv to start a mapvote.",
	"Type rtd to roll the dice.",
	"Press F2 for the jukebox.",
	"Type <color=red>!donate</color> for more info about donating.",
}
end

CreateAdverts( )

local function PrintAdverts( )
	PrintAll( "ADMIN", adverts[math.random( 1, #adverts )] )
	DATABASE:GetServers( )
end
timer.Create( "adverts", ADVERT_TIMER, 0, PrintAdverts )