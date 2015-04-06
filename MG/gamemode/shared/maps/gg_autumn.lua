
local MAP = {}

MAP.Key = 30
MAP.Map = "gg_autumn"
MAP.Name = "GG Automn"
MAP.Desc = "Very fun map."
MAP.TeamBased = true
MAP.RoundBased = false
MAP.GunGame = true
MAP.Red = {}
MAP.Blue = table.Copy(MAP.Red)
MAP.Reward = 100

RegisterMap( MAP )