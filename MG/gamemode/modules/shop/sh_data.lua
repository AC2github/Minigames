
DEFAULT_CRAFT_DESC = "Required for crafting."

shopData = {}
shopData.BannedItems = {}
achievementsData = {}
craftData = {}
AuraPos = {}

function AddShopItem( item, name, desc, price, type, preview, weapon, donator, visible )
	table.insert( shopData, { item = item, Name = name, Desc = desc, Cost = price, Type = type, Preview = preview or "models/extras/info_speech.mdl", Weapon = weapon or nil, DonatorOnly = donator or false } )
end


function AddAchievement( achv, name, desc, reward, show)
	table.insert( achievementsData, { achv = achv, Name = name, Desc = desc, Reward = reward or 0, Show = show or false } )
end


function AddCraftableItem( item, ingredients )
	table.insert( craftData, { result = item, ingredients = ingredients } )
end

AddShopItem( "hattoken", "Hat Token", DEFAULT_CRAFT_DESC, "JUNK", "models/props_mining/elevator_winch_cog.mdl" )
AddShopItem( "iron_pipe", "Iron Pipe", DEFAULT_CRAFT_DESC, "JUNK", "" )

// Hats
AddShopItem( "bucket", "Bucket", "Makes you look silly", 10000, "HAT", "models/props_junk/MetalBucket01a.mdl" )
AddShopItem( "egg", "Egg", "Breakfast in-game", 10000, "HAT", "models/props_phx/misc/egg.mdl" )
AddShopItem( "barrelhat", "Barrel Hat", "A barrel", 10000, "HAT", "models/props_c17/oildrum001_explosive.mdl" )
AddShopItem( "sodahat", "Soda Hat", "A soda can", 10000, "HAT", "models/props_junk/PopCan01a.mdl" )
AddShopItem( "traffichat", "Traffic Cone", "Usefull in traffic", 50000, "HAT", "models/props_junk/TrafficCone001a.mdl" )
AddShopItem( "sombrero", "Sombrero", "Chuck Norris has one", 50000, "HAT", "models/props_junk/sawblade001a.mdl" )
AddShopItem( "headcrab", "Headcrab", "Might turn you into a zombie", 20000, "HAT", "models/Nova/w_headcrab.mdl" )
AddShopItem( "baseball", "Baseball Cap", "Time to hit a homerun", 30000, "HAT", "models/props/cs_office/Snowman_hat.mdl" )
AddShopItem( "microwave", "Microwave Head", "Make sure traitors don't heal", 30000, "HAT", "models/props/cs_office/microwave.mdl" )
AddShopItem( "combine", "Combine Mask", "Buy this in the name of the law", 30000, "HAT", "models/Nova/w_headgear.mdl" )
AddShopItem( "bomb", "Bomb Head", "Don't blow up", 30000, "HAT", "models/Combine_Helicopter/helicopter_bomb01.mdl" )
AddShopItem( "Snowman", "Snowman Mask", "Merry Christmas", 40000, "HAT", "models/props/cs_office/Snowman_face.mdl" )
AddShopItem( "Skull", "Skull Mask", "Are you dead?", 30000, "HAT", "models/Gibs/HGIBS.mdl" )
AddShopItem( "melonhead", "Melon", "Some people will try to eat it", 50000, "HAT", "models/props_junk/watermelon01.mdl" )
AddShopItem( "phxhat", "PHX Prop", "I have no words for this", 20000, "HAT", "models/props_phx/construct/metal_plate1.mdl" )
AddShopItem( "terracote", "Flower Pot", "Put flowers in it", 15000, "HAT", "models/props_junk/terracotta01.mdl" )
AddShopItem( "roboteye", "Robot Eye", "It's a robot eye damnit", 40000, "HAT", "models/props/cs_office/projector.mdl" )
AddShopItem( "lamphat", "Lamp", "Doesn't make any light", 20000, "HAT", "models/props_c17/lampShade001a.mdl" )
AddShopItem( "Antlion", "Antlion Mask", "Be the beast", 30000, "HAT", "models/Gibs/Antlion_gib_Large_2.mdl" )

// Models
AddShopItem( "barney", "Barney", "About that beer...", 10000, "MODEL", "models/player/barney.mdl" )
AddShopItem( "kleiner", "Kleiner", "Mingebag model", 10000, "MODEL", "models/player/kleiner.mdl" )
AddShopItem( "monk", "Priest", "Gah, don't ever buy this",  200, "MODEL", "models/player/monk.mdl" )
AddShopItem( "eli", "Eli", "Extra leg not included", 5000, "MODEL", "models/player/eli.mdl" )
AddShopItem( "Citizen1", "Citizen", "yup", 5000, "MODEL", "models/player/Group01/male_02.mdl" )
AddShopItem( "Citizen2", "Citizen2", "yup", 5000, "MODEL", "models/player/Group01/male_07.mdl" )
AddShopItem( "combine_model", "Combine", "He's sexy and you know it", 15000, "MODEL", "models/player/Combine_Soldier.mdl" ) 
AddShopItem( "combinesuper", "Super Combine", "Sexier", "MODEL", 20000, "models/player/Combine_Super_Soldier.mdl" )
AddShopItem( "Alyx", "Alyx", "yup", 50000, "MODEL", "models/player/alyx.mdl" )
AddShopItem( "zombiemodel", "Zombie", "Brains", 50000, "MODEL", "models/player/classic.mdl" )
AddShopItem( "fastzombie", "Fast Zombie", "Faster brains", 10000, "MODEL", "models/player/zombiefast.mdl" )
AddShopItem( "gman", "Gman", "Will unlock @ Episode 3", 20000, "MODEL", "models/player/gman_high.mdl" )
AddShopItem( "corpse", "Corpse", "It sells", 10000, "MODEL", "models/player/Charple01.mdl" )
AddShopItem( "hostage", "Hostage", "Some CSS model", 2000, "MODEL", "models/player/hostage/hostage_01.mdl" )
AddShopItem( "wootsmodel", "Leet", "For pros", 40000, "MODEL", "models/player/leet.mdl" )
AddShopItem( "breen", "Breen", "Welcome to City FreeSkill..", 50000, "MODEL", "models/player/breen.mdl" )

// Trails
AddShopItem( "plasma", "Plasma", "Default trail", 1000, "TRAIL", "trails/plasma.vmt" )
AddShopItem( "laser", "Laser", "Laser trail", 5000, "TRAIL", "trails/laser.vmt" )
AddShopItem( "lol", "Lol", "Lol laser", 5000, "TRAIL", "trails/lol.vmt" )
AddShopItem( "smoke", "Smoke", "Smoke laser", 7000, "TRAIL", "trails/smoke.vmt" )
AddShopItem( "love", "Love", "Love trail", 8000, "TRAIL", "trails/love.vmt" )
AddShopItem( "physbeam", "Physbeam", "Physbeam traim", 10000, "TRAIL", "trails/physbeam.vmt" ) 
AddShopItem( "tube", "Tube", "Tube trail", 12000, "TRAIL", "trails/tube.vmt" )

// Titles
AddShopItem( "fag", "FAG", "This title would be perfect for you", 10000, "TITLE", "FAG" )
AddShopItem( "awesome", "Awesome", "You are awesome.", 20000, "TITLE", "Awesome" )
AddShopItem( "vip", "VIP", "Special title for VIPs", 0, "TITLE", "VIP", nil, true )
AddShopItem( "theking", "The King", "Hail to the king", 40000, "TITLE", "The King" )
AddShopItem( "slut", "Slut", "Female title", 10000, "TITLE", "Slut" )
AddShopItem( "pro", "Pro", "L33T Hax0r player", 50000, "TITLE", "Pro" )
AddShopItem( "bitch", "AC's bitch", "Hehe", 1, "TITLE", "AC's bitch" )
AddShopItem( "omgwtfbbq", "OMGWTFBBQ", "Oh My God What The Fuck Barbeque", 20000, "TITLE", "OMGWTFBBQ" )
AddShopItem( "trololo", "Trolololo", "U troll?", 20000, "TITLE", "Trolololo" )
AddShopItem( "ragetitle", "RAGE", "RAGEEEEEEEEEE", 30000, "TITLE", "RAGE" )
AddShopItem( "captain", "Captain", "Captain of the failboat", 20000, "TITLE", "Captain" )
AddShopItem( "sexyandiknowit", "I'm sexy and I know it", "Sexy and I know it", 40000, "TITLE", "I'm sexy and I know it" )
AddShopItem( "problem", "Problem?", "Do you have a problem?", 10000, "TITLE", "Problem?" )

// Aura
AddShopItem( "angle_aura", "Angle", "Makes a ball of light float above your head", 30000, "AURA", "angle" )
AddShopItem( "hands_aura", "Hands", "Makes both your hands glow", 60000, "AURA", "hands" )
AddShopItem( "angle_hands_aura", "Hands of light", "Makes both your hands glow, but rotates", 80000, "AURA", "angle_hands" )

// Tags
AddShopItem( "tag_blue", "Blue", "If you love the blue team so much..", 10000, "TAG", "tags/mgblutag002.vtf" )
AddShopItem( "tag_red", "Red", "If you love the red team so much..", 10000, "TAG", "tags/mgredtag001.vtf" )
AddShopItem( "tag_ninja", "Ninja", "Silent hunter", 20000, "TAG", "tags/mgninjatag001.vtf" )
AddShopItem( "tag_win", "Win", "For the win", 35000, "TAG", "tags/mgwintag001.vtf" )
AddShopItem( "tag_gay", "Gay", "It's fine, you can come out of the closet", 12000, "TAG", "tags/mggaytag001.vtf" )
AddShopItem( "tag_epic", "Epic", "Epic tag is epic", 50000, "TAG", "tags/mgepictag001.vtf" )
AddShopItem( "tag_girl", "Girl", "Girls in gmod, yea sure", 30000, "TAG", "tags/mggirltag001.vtf" )
AddShopItem( "tag_sexy", "Sexy", "Sexy and I know it", 20000, "TAG", "tags/mgsexytag001.vtf" )
AddShopItem( "tag_vip", "Donator", "Special tag for donators", 0, "TAG", "tags/mgdonatortag001.vtf", nil, true )
AddShopItem( "tag_weed", "Weed", "Smoke weed every day", 10000, "TAG", "tags/mgweedtag001.vtf" )
AddShopItem( "tag_boss", "Boss", "Like a boss", 20000, "TAG", "tags/mgbosstag001.vtf" )
AddShopItem( "tag_hot", "Hot", "Hot stuff here", 40000, "TAG", "tags/mghottag001.vtf" )
AddShopItem( "tag_cool", "Cool", "Cold player", 40000, "TAG", "tags/mgcooltag002.vtf" )
AddShopItem( "tag_furry", "Furry", "We allow furries on this server ;ohgod;", 10000, "TAG", "tags/mgfurrytag001.vtf" )
AddShopItem( "tag_fail", "Fail", "Why would you even buy this?", 10000, "TAG", "tags/mgfailtag001.vtf" )
AddShopItem( "tag_hacker", "Hacker", "My l33t hax0r skills", 40000, "TAG", "tags/mghackertag001.vtf" )
AddShopItem( "tag_awesome", "Awesome", "I'm awesome", 40000, "TAG", "tags/mgawesometag001.vtf" )
AddShopItem( "tag_shoop", "Shoop da woop", "BLAAAAAAAH", 20000, "TAG", "tags/mgshooptag001.vtf" )

HatPos = {}
HatPos["models/props_junk/MetalBucket01a.mdl"] = { Pos = Vector(5.2,-2,0), Ang = Angle(0,20,90), Model = "models/props_junk/MetalBucket01a.mdl" }
HatPos["models/props_phx/misc/egg.mdl"] = { Pos = Vector(-3,1.5,0), Ang = Angle(0,-180,90), ScaleVector = Vector (3.3,3.3,3.3), Model = "models/props_phx/misc/egg.mdl" }
HatPos["models/props_c17/oildrum001_explosive.mdl"] = { Pos = Vector(-3.5,0.5,0.8), Ang = Angle(90,180,90), ScaleVector = Vector (0.5,0.5,0.5), Model = "models/props_c17/oildrum001_explosive.mdl" }
HatPos["models/props_junk/PopCan01a.mdl"] = { Pos = Vector(5.2,0.5,0.8), Ang = Angle(90,180,90), ScaleVector = Vector (3,3,3), Model = "models/props_junk/PopCan01a.mdl" }
HatPos["models/props_junk/TrafficCone001a.mdl"] = { Pos = Vector(18,0,0), Ang = Angle(0,0,-90), ScaleVector = Vector (1,1,1), Model = "models/props_junk/TrafficCone001a.mdl" }
HatPos["models/props_junk/sawblade001a.mdl"] = { Pos = Vector(4.6,0.5,0), Ang = Angle(-90,0,-75), Model = "models/props_junk/sawblade001a.mdl" }
HatPos["models/Nova/w_headcrab.mdl"] = { Pos = Vector(-2.5,0,0), Ang = Angle(0,-90,90), ScaleVector = Vector (1.1,1.1,1.1), Model = "models/Nova/w_headcrab.mdl" }
HatPos["models/props/cs_office/Snowman_hat.mdl"] = { Pos = Vector(3.5,-2.3,0), Ang = Angle(0,50,-90), Model = "models/props/cs_office/Snowman_hat.mdl" }
HatPos["models/props/cs_office/microwave.mdl"] = { Pos = Vector( 0, 1, 0 ), Ang = Angle( 0, 180, 90 ), ScaleVector = Vector( 0.75, 0.75,0.75 ), Model = "models/props/cs_office/microwave.mdl" }
HatPos["models/Nova/w_headgear.mdl"] = { Pos = Vector( 0, 0, 0 ), Ang = Angle( -90, 270, 0 ), Model = "models/Nova/w_headgear.mdl" }
HatPos["models/Combine_Helicopter/helicopter_bomb01.mdl"] = { Pos = Vector( 2, 0, 0 ), Ang = Angle( 0, 0, 0 ), ScaleVector = Vector( 0.5, 0.5, 0.5 ), Model = "models/Combine_Helicopter/helicopter_bomb01.mdl" }
HatPos["models/props/cs_office/Snowman_face.mdl"] = { Pos = Vector( 3, 0, 0 ), Ang = Angle( 0.5, 180, 90 ), ScaleVector = Vector( 1.2, 1.2, 1.2 ), Model = "models/props/cs_office/Snowman_face.mdl" }
HatPos["models/Gibs/HGIBS.mdl"] = { Pos = Vector( 5, 2, 0 ), Ang = Angle( 90, 180, 90 ), ScaleVector = Vector( 1.6, 1.6, 1.6 ), Model = "models/Gibs/HGIBS.mdl" }
HatPos["models/props_junk/watermelon01.mdl"] = { Pos = Vector(4.1,0.5,0), Ang = Angle(0,0,0), Model = "models/props_junk/watermelon01.mdl" }
HatPos["models/props_phx/construct/metal_plate1.mdl"] = { Pos = Vector(4.6,0.5,0), Ang = Angle(-90,0,-75), ScaleVector = Vector (0.5,0.5,0.5), Model = "models/props_phx/construct/metal_plate1.mdl" }
HatPos["models/props_junk/terracotta01.mdl"] = { Pos = Vector(8,-2,0), Ang = Angle(0,20,90), Model = "models/props_junk/terracotta01.mdl" }
HatPos["models/props/cs_office/projector.mdl"] = { Pos = Vector(0,0.5,0.5), Ang = Angle(0,0,-90), Model = "models/props/cs_office/projector.mdl" }
HatPos["models/Gibs/Antlion_gib_Large_2.mdl"] = { Pos = Vector( 1.5, 0, 0 ), Ang = Angle( 90, 180, 90 ), Model = "models/Gibs/Antlion_gib_Large_2.mdl" }
HatPos["models/props_c17/lampShade001a.mdl"] = { Pos = Vector(5,0,0), Ang = Angle(0,0,-90), ScaleVector = Vector (1,1,1), Model = "models/props_c17/lampShade001a.mdl" }

AuraPos["angle"] = { 
		[1] = { Material = "effects/yellowflare", Bone = "ValveBiped.Bip01_Head1", Pos = Vector( 0, 0, 7 ), Color = color_white, Forward = true, Move = true, Size = 6 },
}

AuraPos["hands"] = {
		[1] = { Material = "sprites/glow04_noz", Bone = "ValveBiped.Bip01_L_Hand", Color = Color( 255, 0, 0, 200 ), Size = 30 },
		[2] = { Material = "sprites/light_glow02_add", Bone = "ValveBiped.Bip01_R_Hand", Color = Color( 0, 255, 0, 200 ), Size = 30 },
}
	
AuraPos["angle_hands"] = {
	[1] = { Material = "sprites/light_glow02_add", Bone = "ValveBiped.Bip01_L_Hand", Color = color_white, Forward = true, Move = true, Size = 10 },
	[2] = { Material = "sprites/glow04_noz", Bone = "ValveBiped.Bip01_R_Hand", Color = color_white, Forward = true, Move = true, Size = 10 }
 }
 
AuraPos["energy"] = {
	[1] = { Material = "sprites/strider_blackball", Vector = Vector( 0, 0, 30 ), Bone = "ValveBiped.Bip01_Head1", Pos = Vector( 0, 0, 7 ), Forward = true, Move = true, Color = color_white, Size = 2 }
}

function SHOP:SpawnAura( pl, aura )
	if not IsValid( pl ) then return end
	if not pl.PlayerData then return end
	
	pl.PlayerData["aura"] = aura
	
	if ValidEntity( pl.Aura ) then
		pl.Aura:Remove( )
	end
	
	if not AuraPos[aura] then return end
	
	pl.Aura = ents.Create( "sent_aura" )
	pl.Aura:SetPos( pl:GetPos( ) )
	pl.Aura:SetParent( pl )
	pl.Aura:SetOwner( pl )
	
	pl.Aura:Spawn( )
	
	if SERVER then
		DATABASE:Query( "UPDATE player_stats SET aura = '"..aura.."' WHERE steamid = '"..pl:SteamID( ).."'" )
		SHOP:SendDataToPlayers( pl )
	end
end

TitleColors = {}
TitleColors["NULL"] = color_white
TitleColors["white"] = color_white
TitleColors["yellow"] = Color( 220, 180, 0, 255 )
TitleColors["purple"] = Color( 136, 16, 207, 255 )
TitleColors["orange"] = Color( 255, 140, 0, 255 )
TitleColors["red"] = Color( 255, 0, 0, 255 )
TitleColors["blue"] = Color( 0, 0, 255, 200 )
TitleColors["green"] = Color( 50, 205, 50, 200 )
TitleColors["pink"] = Color( 255, 105, 180, 255 )
TitleColors["lightblue"] = Color( 173, 216, 230, 255 )

AddAchievement( "ac_achv", "Who?", "Play with AC.", 100, true )
AddAchievement( "ac_kill", "INCOMING BANHAMMER", "Kill AC.", 200, false ) 
AddAchievement( "hello_achv", "I just came to say Hello", "Join the server.", 10, true )
AddAchievement( "shop_money_poor", "Poor basterd", "Have 1000 coins or less.", 100, true )
AddAchievement( "shop_money", "Money bag", "Get 10000 or more coins.", 100, true )
AddAchievement( "shop_money_rich", "Screw the rules, I have money!", "Get 1000000 or more coins.", 500, true )
AddAchievement( "shop_money_leet", "Screw the money, I am l33t", "Have 1337 coins.", 1337, true )
AddAchievement( "sexist_achv", "Sexist", "Kill a female playermodel.", 10, false )
AddAchievement( "jesus_achv", "Jesus Christ", "Kill the priest playermodel.", 5, false )
AddAchievement( "sentence", "I know the secret", "Say the secret sentence.", 100, true )
AddAchievement( "fullserver", "Power of the people", "Get the server full", 500, true )
AddAchievement( "rtd", "I dare to gamble", "Roll the dice", 5, true )

AddCraftableItem( "Coo Coo", { "dunce", "drinkcap", "egg" } )
AddCraftableItem( "viking", { "helmet", "fo31" } )
AddCraftableItem( "sombrero#2", { "starglasses", "3dglasses" } )
AddCraftableItem( "Zoidberg Mask", { "fo33", "fo34", "fo35" } )

for k, v in pairs( shopData ) do
	if shopData[k].Type == "MODEL" or shopData[k].Type == "HAT" then
		util.PrecacheModel( shopData[k].Preview )
	end
end

function SHOP:GetItem( item )
	if not item then return end
	
	for k, v in pairs( shopData ) do
		if tostring(item) == shopData[k].item then
			return v
		end
	end
	
	return nil
end

function SHOP:GetCraftingItem( item )
	if not item then return end
	
	for k, v in pairs( craftData ) do
		if tostring( item ) == craftData[k].result then
			return v
		end
	end
	
	return nil
end

function SHOP:GetAchievement( achv )
	if not achv then return end
	
	for k, v in pairs( achievementsData ) do
		if tostring(achv) == achievementsData[k].achv then
			return v
		end
	end
	
	return nil
end

function SHOP:SpawnHat( pl, h )
	if not pl then return end
	if not pl.PlayerData then return end
	
	pl.PlayerData["hat"] = h
	
	if h == "NULL" then return end
	
	if ValidEntity( pl.Hat ) then
		pl.Hat:Remove( )
		
		pl.Hat = ents.Create( "sent_hat" )
		pl.Hat:SetPos( pl:GetPos( ) )
		pl.Hat:SetOwner( pl )
		pl.Hat:SetParent( pl )
		pl.Hat:SetHat( h )
		pl.Hat:Spawn( )
		return
	end
	
	pl.Hat = ents.Create( "sent_hat" )
	pl.Hat:SetModel( h ) 
	pl.Hat:SetPos( pl:GetPos( ) )
	pl.Hat:SetOwner( pl )
	pl.Hat:SetParent( pl )
	pl.Hat:SetHat( h )
	pl.Hat:Spawn( )
	
	DATABASE:Query( "UPDATE player_stats SET hat = '"..h.."' WHERE steamid = '"..pl:SteamID( ).."'" )
end
