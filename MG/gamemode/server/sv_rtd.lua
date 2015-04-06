
local function PrintAllD( msg )
    for k, v in pairs( player.GetAll( ) ) do
        v:ChatPrint( msg )
    end
end

local amountwin = math.random( 1, 500 )
local amountlose = math.random( 100, 600 )
local DiceTable = {}
DiceTable[1] = function( ply ) ply:SetHealth( 100 ) PrintAllD("WIN: " ..ply:Name( ).. " received a health boost!") end
DiceTable[2] = function( ply ) ply:SetHealth( 1 ) PrintAllD("LOSE: " ..ply:Name( ).. " was raped in the ass!") end
DiceTable[3] = function( ply ) ply:Ignite( 2 ) PrintAllD("LOSE: " ..ply:Name( ).." was put on fire!") end
DiceTable[4] = function( ply ) ply:TakeDamage( math.random( 1, 25 ) ) ply:SetVelocity( Vector( math.random( 1, 300 ) , math.random( 1, 300 ), math.random( 1, 300 ) ) ) PrintAllD("LOSE: " ..ply:Name( ).." was bitch slapped!") end
DiceTable[5] = function( ply ) ply:SetArmor( 50 ) PrintAllD("WIN: " ..ply:Name( ).. " received an armor boost!") end
DiceTable[6] = function( ply ) ply:SetWalkSpeed( ply:GetWalkSpeed( ) + math.random( 1, 200 ) ) PrintAllD("WIN: " ..ply:Name( ).. " received a speed boost!") end
DiceTable[7] = function( ply ) ply:AddMoney(amountwin) PrintAllD("WIN: " ..ply:Name( ).. " won "..amountwin.."!") end
DiceTable[8] = function( ply ) ply:TakeMoney(amountlose) PrintAllD("LOSE: "..ply:Name( ).." lost "..amountlose.."!") end 
DiceTable[9] = function( ply ) ply:SetFrags( ply:Frags( ) + 2 ) PrintAllD("WIN: "..ply:Name( ).. " won 2 frags!") end
DiceTable[10] = function( ply )
    local Pos = ply:GetPos( )
    local Boom = EffectData()
    Boom:SetStart( Pos )
    Boom:SetOrigin( Pos)
    Boom:SetScale( 1 )
    util.Effect( "HelicopterMegaBomb", Boom )
    ply:Kill( )
    PrintAllD( "LOSE: " ..ply:Name( ).. " was blown up!")
end

local function RollTheDice( ply )
        local random = math.random( 1, table.Count( DiceTable ) )
		
		if ply:Team( ) == TEAM_SPEC then 
			ply:ChatPrint( "Can't roll the dice when you're dead." )
			return
		end
		
		if !IsValid( ply ) or !ply:Alive( ) then return end
    
        if ply.Roll >= CurTime() then
            ply:ChatPrint("You have to wait " ..math.floor( (ply.Roll - CurTime()) ).. " seconds before you can roll again!")
            return
        end
    
        ply.Roll = CurTime() + RTD_TIME
        DiceTable[random]( ply )
		SHOP:UnlockAchievement( ply, "rtd" )
end
concommand.Add("mg_rtd", RollTheDice )
chatcommand.Add("rtd", function( pl ) RollTheDice( pl ) end )
