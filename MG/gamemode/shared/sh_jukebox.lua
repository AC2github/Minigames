
JUKEBOX = {}
JUKEBOX.SONGS = {}
JUKEBOX.SONGS.New = {}
JUKEBOX.Cache = {}

function AddSong( id, name, song, t )
	table.insert( JUKEBOX.SONGS, { ID = id, Name = name, Song = song, Time = t } )
end

/*
AddSong( "borderlands", "Borderlands Theme", "Borderlands", 208 )
AddSong( "rejection", "Rejection - Martin Solveig", "Rejection", 220 )
AddSong( "duke", "DUKE NUKEM FOREVER THEME", "Duke", 220 )
AddSong( "gaben", "To Stop A Gaben", "Gaben", 83 )
AddSong( "cudderisback", "Cudderisback - Kid Cudi", "Cudderisback", 147 )
AddSong( "tapeworms", "I Staple Tapeworms On My Penis", "Tapeworms", 70 )
AddSong( "awesome", "I am awesome - Spose", "Awesome", 255 )
AddSong( "boat", "I'm On A Boat - The Lonely Island", "Boat", 159 )
AddSong( "world", "It's The End Of The World", "World", 242 )
AddSong( "always", "Always - Erasur",  "Always", 245 )
AddSong( "money", "Money - David Guetta", "Money", 184 )
AddSong( "dansen", "Caramel Dansen", "Dansen", 180 )
AddSong( "kurk", "Captain Of The Mountain - Fall On Your Sword", "Kurk", 166 )
AddSong( "emo", "Like A Nazi - Rucka Rucka Ali", "Emo", 258 )
AddSong( "hello", "Hello - Martin Solveig", "Hello", 284 )
AddSong( "dollard", "I Need A Dollar - Aloe Blacc", "Dollard", 248 )
AddSong( "invaders", "Invaders Must Die - The Prodigy", "Invaders", 297 )
AddSong( "kush", "Kush - Dr Dre feat Snoop Dogg", "Kush", 238 )
AddSong( "didnt", "Oh No You Didn't - Wojahn Brothers", "Didnt", 176 )
AddSong( "rockafeller", "The Rockafeller Skank - Fatboy Slim", "Rockafeller", 238 )
AddSong( "armstrong", "What A Wonderful World - Louis Armstrong", "Armstrong", 142 )
AddSong( "genitals", "Show Me Your Genitals 2 - Jon Lajoie", "Genitals", 179 )
AddSong( "vato", "Vato - Snoop Dogg", "Vato", 287 )
AddSong( "jizz", "Jizz In My Pants - The Lonely Island", "Jizz", 153 )
AddSong( "boss", "Like A Boss - The Lonely Island", "Boss", 109 )
AddSong( "natalie", "Natalie Is Rap - The Lonely Island", "Natalie", 149 )
AddSong( "blue", "Blue Speed (8 Bit Music) - DM Dokuro", "Blue", 217 )
AddSong( "queen", "Another One Bites The Dust - Queen", "Queen", 218 )
AddSong( "akon", "I Just Had Sex - The Lonely Island Feat. Akon", "Akon", 170 )
AddSong( "omen", "Omen - The Prodigy", "Omen", 197 )
AddSong( "beatles", "Eleanor Rigby - The Beatles", "Beatles", 130 )
AddSong( "graham", "Da Graham Craka - Runaway", "Graham", 185 )
*/

AddSong( "borderlands", "Borderlands Theme", "http://www.youtube.com/watch?v=LnSp9rgfel8", 180 )
AddSong( "rejection", "Rejection - Martin Solveig", "http://www.youtube.com/watch?v=HNPVFprwmVk&ob=av2e", 207 )
AddSong( "duke", "DUKE NUKEM FOREVER THEME", "http://www.youtube.com/watch?v=lGkV-YZDSy4", 213 )
AddSong( "gaben", "To Stop A Gaben", "http://www.youtube.com/watch?v=8tsHkpesBdY", 83 )
AddSong( "cudderisback", "Cudderisback - Kid Cudi", "http://www.youtube.com/watch?v=XN29FUwHbqI", 207 )
AddSong( "awesome", "I am awesome - Spose", "http://www.youtube.com/watch?v=6iJHaQuyUNA", 249 )
AddSong( "boat", "I'm On A Boat - The ", "http://www.youtube.com/watch?v=avaSdC0QOUM&ob=av3e", 185)
AddSong( "world", "It's The End Of The World", "http://www.youtube.com/watch?v=AzqiPvGrkTo", 224 )
AddSong( "money", "Money - David Guetta", "http://www.youtube.com/watch?v=60ahvLeZh58", 180)
AddSong( "dansen", "Caramel Dansen", "http://www.youtube.com/watch?v=A67ZkAd1wmI", 180 )
AddSong( "kurk", "Captain Of The Mountain - Fall On Your Sword", "http://www.youtube.com/watch?v=HU2ftCitvyQ", 179 )
AddSong( "emo", "Like A Nazi - Rucka Rucka Ali", "http://www.youtube.com/watch?v=aDzYvqgkzGE", 250 )
AddSong( "hello", "Hello - Martin Solveig", "http://www.youtube.com/watch?v=LnET4RKXx5k&ob=av2e", 243 )
AddSong( "dollard", "I Need A Dollar - Aloe Blacc", "http://www.youtube.com/watch?v=iR6oYX1D-0w", 248 )
AddSong( "invaders", "Invaders Must Die - The Prodigy", "http://www.youtube.com/watch?v=gTw2YvutJRA", 250 )
AddSong( "rockafeller", "The Rockafeller Skank - Fatboy Slim", "http://www.youtube.com/watch?v=FMrIy9zm7QY", 238 )
AddSong( "vato", "Vato - Snoop Dogg", "http://www.youtube.com/watch?v=W8IXqdypLps", 287 )
AddSong( "boss", "Like A Boss - The Lonely Island", "http://www.youtube.com/watch?v=NisCkxU544c", 80 )
AddSong( "blue", "Blue Speed (8 Bit Music) - DM Dokuro", "http://www.youtube.com/watch?v=QC5CyG0H9wk", 247 )

for k, v in pairs( JUKEBOX.SONGS ) do
	JUKEBOX.SONGS.New[v.ID] = JUKEBOX.SONGS[k]
end

